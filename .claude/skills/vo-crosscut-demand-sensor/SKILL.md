---
name: vo-crosscut-demand-sensor
origin: venture-os
version: 0.1.0
description: >-
  venture-os の需給側センサー。事業が成立するための需要前提を分解し、各前提を「反証可能な命題＋
  安価な検証法＋確度タグ」に落として、需要の実在性を過信なく評価する。unit-economics（貨幣side）・
  credit-runway（信用side）の兄弟で、Council 三極の「需給の代弁者」へデータを供給する。
  Make sure to use this skill whenever a venture needs to check whether demand is real: 需要は
  あるか確かめたい、ターゲットは実在するか、WTP・支払意思を見たい、需給ギャップ・市場規模、
  この機能/事業に本当に需要があるか、誰が買うのか、需要を安く検証したい、市場実在の前提を洗い出したい
  — even if not explicitly asked. design_only では実市場で需要を測れないため、需要スコアを断定せず
  反証可能な前提と安価な検証法で語る（測れない需要に確信を捏造しない＝V5 を自分の認識にも適用）。
  VO:L0 が需要前提を仕込み、VO:L1 が gtm 昇格後に実検証する。
---

# vo-crosscut-demand-sensor（需給側センサー・Council 三極の需給を支える）

事業が成立するための**需要前提**を分解し、各前提を「反証可能な命題 ＋ 安価な検証法 ＋ 確度タグ」に落とす。需要を*測る*のではなく、需要が成立する条件を*反証可能にする*センサー。貨幣side（`vo-crosscut-unit-economics`）・信用side（`vo-crosscut-credit-runway`）と並ぶ**センサー三位一体の需給側**で、Council の「需給の代弁者」ペルソナへ事実を供給する。

> **正典参照**: 需給の代弁者ペルソナ `../vo-crosscut-council/references/personas/business/demand-advocate.md`。TAM・WTP の算数隣接は `../../../references/build-pack/04-unit-economics-protocol.md`（TAM上限）。憲法 第2条（推論の前に検証設計）・V5（真正性を自分の認識にも適用）・第6条（観測性統一）。VO 独立 repo 移設時に references/ へ colocate。

## なぜ「スコア」を出さないか（認識論ガード・V5 自己適用）

design_only では実市場が無く、需要は**測れない**。ここで「需要スコア 72」のような数値を出すのは、測っていないものを測ったと偽る＝**信用の捏造を自分の認識に対して犯す**（V5 違反）。よって本センサーは需要の断定でなく、**「これが真なら需要は成立する」という反証可能な前提の束**と、それを**安く潰す検証法**を出す。確信は earned な検証を経てのみ上げる。

## 分解フロー

1. **需要前提の列挙**: この事業が成立するために*真でなければならない*前提を洗い出す。最低限の5系統：
   - **ターゲット実在**: その顧客セグメントは実在し、到達可能な母数があるか
   - **課題の痛み**: その課題は「金を払って解きたい」ほど痛いか（vitamin か painkiller か）
   - **WTP（支払意思）**: 想定単価で払うか（unit-economics の LTV/CAC 前提と接続）
   - **代替への優位**: 非消費・DIY・既存 incumbent になぜ乗り換えるか
   - **到達可能性**: その CAC で届くチャネルが実在するか
2. **反証可能化**: 各前提を「〜なら需要成立／〜なら棄却」の falsifiable な命題へ（測定可能・二値で判定できる形）。
3. **安価な検証法の設計**: 各前提を**最も安く反証する実験**を割り当てる（例: LP＋事前登録の CVR、スモークテスト、顧客インタビュー N 件、検索ボリューム、競合の課金実績、コンシェルジュ MVP）。design_only では**設計まで**、実施は gtm 昇格後。
4. **確度タグ付け**: 各前提に `earned`（実データで検証済み）/ `estimated`（proxy・間接指標）/ `assumed`（未検証の仮定）を付す。**assumed を earned と偽らない**。
5. **致命前提の特定**: 単一で偽なら他の議論が全て無意味になる前提（single point of failure）を `is_fatal` で marking。

## 出力

```
- demand_premises: [
    { premise, falsifiable_claim, cheap_test, confidence_tag(earned|estimated|assumed), is_fatal }
  ]
- verified_ratio: earned な前提 ÷ 全前提（需要スコアの代わりの唯一の数値。捏造しない）
- fatal_unverified: [is_fatal かつ assumed の前提...]   # 最優先で検証すべき
- demand_verdict: "hypothesis" | "partially_validated" | "validated"
                  # design_only では原則 hypothesis（未検証前提が残る限り validated にしない）
```

**需要スコアは出さない。** 数値は「検証済み前提の割合（verified_ratio）」のみ ── これは事実（何を確かめ、何をまだ確かめていないか）であって、需要の断定ではない。

## 起動と連携

- **Council 三極**の需給側データ源。`vo-crosscut-council` の「需給の代弁者」に demand_premises を供給する。
- **貨幣side** `vo-crosscut-unit-economics`（WTP は LTV/CAC 前提と接続・TAM上限を共有）、**信用side** `vo-crosscut-credit-runway` と合わせてセンサー三位一体。
- `fatal_unverified` が残るまま実市場投下・大きな賭けに進むなら、`vo-crosscut-council` の悪魔の代弁者（致命前提狩り）を invocable で召喚。
- 需要前提が広く棄却される → L0 へ pivot 献上（市場ポスチャ/ターゲット再選択）。

## design_only での扱い

実市場データが無い段階では「**検証の設計**（反証可能命題＋安価な検証法）」を THESIS に含める。実検証は実働機構 `vo-crosscut-market-smoke`（第2層）が gtm_execution 昇格後に走らせ、実反応で確度タグを `earned` へ昇格して本センサーへ還元する（credit-runway と同型の段階解放）。design_only の献上物には「需要前提表（前提／反証命題／検証法／確度）」を含め、**verified_ratio が低い＝仮説段階であることを明示**する。
