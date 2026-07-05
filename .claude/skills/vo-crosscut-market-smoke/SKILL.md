---
name: vo-crosscut-market-smoke
origin: venture-os
version: 0.1.0
description: >-
  venture-os の第2層 需要スモークテスト実働機構。demand-sensor が design_only で"設計"した
  反証可能な需要前提を、gtm_execution 昇格後に実市場で"実走"させ（LP＋事前登録・小予算広告・
  fake-door・concierge MVP）、実反応を earned データとして計測して三センサー（needs/貨幣/信用）へ
  還元する。DH の autonomous-drive 相当（机上でなく実市場に出す最初の点）。Make sure to use this skill
  whenever a venture needs to actually test demand in the real market: LP を出して反応を見たい、
  需要スモークテストを回したい、事前登録/広告 CVR で仮説を実検証したい、fake-door で払うか確かめたい、
  実 CAC を測りたい — even if not explicitly asked. design_only では INACTIVE（計器の設計のみ・実 deploy
  しない）。有効化は venture_scope ≥ gtm_execution かつ monetary_gate 内かつ支出は L-GATE 発話確認。
  買ったトラフィック/サクラ登録で反応を水増ししない（earned のみ・V5）。VO:L1 実働で回す。
---

# vo-crosscut-market-smoke（第2層 需要スモークテスト・実市場の実働）

`demand-sensor` が机上で**設計**した「反証可能な需要前提＋安価な検証法」を、実市場で**実走**させて earned データに変える第2層機構。VO が design_only（机上）から実市場へ渡る**最初の点**であり、DH の `crosscut-autonomous-drive`（コードを実 prod に出す）に対応する（事業版＝需要仮説を実市場に出す）。

> **正典参照**: 検証設計の入力元は `../vo-crosscut-demand-sensor/SKILL.md`（反証命題＋検証法）。実測は貨幣side `../vo-crosscut-unit-economics/SKILL.md`（実 CAC/CVR）・信用side `../vo-crosscut-credit-runway/SKILL.md`（早期の解約/苦情）へ還元。委譲境界は VO:L0 の第9条表（支出＝L-GATE・不可逆＝人間）。憲法 第2条（第2層＝実反応）・V2（充足）・V5（earned のみ）・V6（不可逆は人間）。VO 独立 repo 移設時に references/ へ colocate。

## 位置づけと有効化ゲート（design_only では INACTIVE）

- **第2層／VO:L1 実働**。第1層（`unit-economics` の算数）で破綻を潰した後、実市場で需要を実検証する。
- **design_only では起動しない**（計器の設計のみ・実 deploy なし）。有効化は3条件の AND:
  1. `venture_scope ≥ gtm_execution`（人間が ADR で昇格・H4）
  2. `monetary_gate` 内（1行為/期間あたりの支出上限・人間設定）
  3. 各 deploy の支出は **L-GATE**（実行前に発話確認）。上限超過・不可逆は人間専管（V6）。

## スモークテストの型（安価順）

| 型 | 何を反証するか | 主コスト |
|---|---|---|
| LP＋事前登録 | ターゲット実在・課題の痛み（登録率） | 制作のみ（広告なしなら ¥0） |
| fake-door / 価格ページ | WTP（想定単価でのクリック/離脱） | 制作のみ |
| 小予算広告（検索/SNS） | 到達可能性・実 CAC・CVR | 広告費（monetary_gate 対象） |
| concierge / Wizard-of-Oz MVP | 課金意思（手動提供で実際に払うか） | 人手 |

## フロー

1. **入力受領**: `demand-sensor` の `demand_premises`（特に `is_fatal` かつ `assumed`）を受け取り、**最も安く潰せる前提から**着手（Shift Left）。
2. **実験選択**: 前提を反証する最小コストの型を選ぶ（広告費が要るものは monetary_gate と照合）。
3. **ゲート確認**: `venture_scope ≥ gtm_execution` かつ `monetary_gate` 内か。支出発生なら L-GATE で発話確認。超過・不可逆は人間へ。
4. **deploy＆計測**: LP/広告等を出し、実反応（登録率・CVR・実 CAC・離脱）を収集。**買ったトラフィック/サクラで水増ししない**（V5・earned のみ）。
5. **確度昇格＆還元**: 実データで前提の確度タグを `assumed/estimated → earned` に昇格し、`demand-sensor` の `verified_ratio` を更新。実 CAC/CVR を `unit-economics` へ、早期の解約/苦情を `credit-runway` へ還元。
6. **判定連携**: 前提が実市場で棄却 → L0 へ pivot 献上。実 CAC が算数前提を破る → `unit-economics` 再計算。信用毀損の芽 → `credit-runway`／two-runway なら Council。

## 出力

```
- experiments: [{ premise_id, test_type, spend, gate(design_only|gtm_ok|human_needed), result_metric, confidence_after }]
- earned_signals: { preregistration_rate, cvr, real_cac, wtp_evidence, early_churn }
- promoted_premises: [assumed/estimated → earned に昇格した前提...]
- verdict: "demand_confirmed" | "demand_rejected" | "inconclusive_need_more"
```

## 真正性ガード（V5）と不可逆（V6）

- **earned のみ**: 買ったトラフィック・サクラ事前登録・自作自演の CVR は製造信号＝計測から除外（`credit-runway` の真正性フィルタと同思想）。数字を良く見せる誘惑を DONT-VENTURE に置く。
- **不可逆の注意**: 公開実験はブランド毀損（信用runway 毀損）を伴い得る。炎上リスク・誤解を招く fake-door は要人間確認。撤退困難な公開・大型出稿は L-FROZEN 相当で人間専管。

## design_only での扱い

計器（実験計画・ゲート・計測項目）を**設計するだけ**で実 deploy しない。THESIS には「gtm 昇格後に走らせるスモークテスト計画」を含め、`demand-sensor` の未検証前提と1対1で対応づける。実走は `gtm_execution` 昇格（人間 H4）で段階解放。
