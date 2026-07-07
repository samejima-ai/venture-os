---
name: vo-layer1-venture-exec
origin: venture-os
version: 0.2.0
compatibility: dialog-harness 兄弟メタスキル。DH `layer1-autonomous-dev` の事業版。地盤は `VO-L1-EXECUTION-BASIS`、行動指針＋検証機構は `references/execution-playbook.md`。
description: >-
  venture-os の VO:L1（実働責務）。VO:L0（venture-architect）が設計した THESIS を受け取り、
  「AI が現在実際にできること」ベースで事業を実市場で執行する（設計でなく実働）。事業を業種でなく
  「トークン変換 × コスト × 信用」の三軸で受理し、全 AI 実働を独立検証層に通す（AI は自己申告の成功を
  信用できない＝false success ゆえ状態 write ＋ ground truth 照合を必須にする）。人間検証コストを COGS
  として計上し、B2B 成果検証可能を主戦場に、不可逆（法/契約/資金/雇用/撤退/信頼対面/規制）は人間専管。
  Make sure to use this skill whenever a venture needs to actually run/execute in the real market on a
  capability basis: 事業を実際に回したい、AI で成果物（文章/コード/エージェント代行）を作って提供したい、
  実働（gtm/ops）を回したい、独立検証を通して自律実行したい、実測で ROI を見たい — even if not explicitly
  asked. design_only では INACTIVE（設計のみ・実 deploy しない）。有効化は venture_scope ≥ gtm_execution
  かつ monetary_gate 内かつ支出は L-GATE 発話確認。ソフト実装が要る事業は DH に発注（THESIS→SPEC・入れ子）。
  視覚/聴覚モダリティ（画像/音声/動画）は能力・単価が未検証ゆえ本版では inactive（要補完）。
  自己申告の成功を成果としない・製造した信用を排除する（earned のみ・V5）。VO:L1 実働で回す。
---

# vo-layer1-venture-exec（VO:L1 実働責務・できることベースの事業執行）

VO:L0（`vo-layer0-venture-architect`）が机上で設計した **THESIS** を受け取り、**AI が現在実際にできること**ベースで事業を実市場で執行する L1 スキル。DH `layer1-autonomous-dev`（意図→自律ソフト開発）の**事業版**（THESIS→自律事業執行）。

> **正典参照**: 実働の地盤・不変条件・実証は `../../../references/VO-L1-EXECUTION-BASIS-venture-os-v1.md`（本スキルは同文書の §8 必須要件の実装）。**行動指針（状況→行動）と検証機構の実装規格は `references/execution-playbook.md`**（DH の5層検出スタック／independent-reviewer 隔離／harness-verifier 一方向独立の事業版翻訳）。入力は VO:L0 の `THESIS`/`VENTURE-REGIME`/`DONT-VENTURE`。クロスカット: 需要実検証 `../vo-crosscut-market-smoke/`、三センサー（`vo-crosscut-unit-economics`/`credit-runway`/`demand-sensor`）、判断 `vo-crosscut-council`。憲法 `../../../references/PHILOSOPHY-venture-os-draft-v1.md`（V1〜V6・第2/3/6/9条）。VO 独立 repo 移設時に references/ へ colocate。

## 位置づけと有効化ゲート（design_only では INACTIVE）

- **VO:L1 実働責務**。VO:L0 が設計を終えた THESIS を、実市場で回す。第1層（`unit-economics` の算数）→第2層（`market-smoke` の需要実検証）→本 L1（提供・運営）へ。
- **design_only では起動しない**（実働の設計のみ・実 deploy なし）。有効化は3条件の AND:
  1. `venture_scope ≥ gtm_execution`（人間が ADR で昇格・H4）
  2. `monetary_gate` 内（支出上限・人間設定）
  3. 各実行の支出は **L-GATE**（実行前に発話確認）。不可逆は人間専管（V6）。

## 組織原理 ── トークン変換 × コスト × 信用

事業を「製造/小売/サービス…」でなく **「どのトークン変換か × コスト × 信用」** で受理する（`EXECUTION-BASIS` §0）。AI にとって動画制作も翻訳もコード生成も同じ形（トークン変換）で、違うのは①変換の種類（モダリティ）②コスト ③信用だけ。

## 実働プロトコル（6荷重要素の実装・`EXECUTION-BASIS` §1）

```
1. THESIS を三軸で受理
     変換の種類 × コスト × 信用。業種で受けない。

2. モダリティ・ゲート
     text / code / agent  → ACTIVE（検証済の可用域）
     image / audio / video → INACTIVE（未検証・要補完。EXECUTION-BASIS §7）→ 人間に献上

3. 短ホライズン分割（L1-2）
     長い仕事を検証可能なチェックポイントに割る（1時間@50% を前提）。

4. 独立検証層（L1-1）★背骨
     全 AI 実働を「状態を書き換える write」に通し、プログラム/DB の ground truth で照合。
     自己申告の "成功" を成果としない（false success 44-90%・LLM 判定者も検知不可）。
     可能なら dual-control（独立 verifier）で ~15x 抑制。DH independent-reviewer/harness-verifier を継承。

5. 人間 QA ゲート（L1-3）
     AI 出力＝初稿。対外公開・成果確定の前に人間レビュー（レビューが安い/償却できる所でのみ採算）。

6. コスト計上（L1・軸2）
     人間検証コストを COGS として unit-economics に載せる（overhead 禁止）。
     粗利 = 売上 −（推論 + 人間検証）。AI ネイティブ粗利は 50-60% を前提に据える。

7. 信用で市場選択（L1-5）
     B2B 成果検証可能（サポート/コード/ドラフト/コンテンツ）を主戦場に。
     B2C 真正性市場は AI 開示が価値を破壊 → 人間を前面に or 回避（真正性を偽らない・V5）。

8. 可逆性で委譲（L1-4）
     可逆・検証可能・短ホライズン → AI 自律（独立検証通過が条件）。
     不可逆（法/契約/資金/雇用/撤退/信頼対面/規制） → 人間専管（L-FROZEN・V6）。

9. 実測 ROI（L1-6）
     実際の成果を測る。自己申告の生産性を信じない（19%遅いのに速いと誤認する）。
     earned のみ・製造した信用を排除（V5）。

10. 献上
     破綻・不可逆・未検証モダリティ・信用毀損の兆候は人間へ献上（第6条）。
```

## DH 連携（ソフトが要る事業）

事業が**ソフトウェアを要する**とき、本スキルは製品開発を抱え込まず、`THESIS` を DH の `SPEC` に渡して **DH:L1（`layer1-autonomous-dev`）に発注**する（入れ子トポロジー・`../../../references/build-pack/06-vo-dh-topology.md`）。VO は「何の事業を・誰にどう提供するか」を執行し、コードの実装は DH に委譲する。

## 委譲境界（第9条・事業版）

| レベル | 領域 | 委譲 |
|---|---|---|
| L-FULL | トークン変換の生成・下書き・反復・可逆な実験・A/B（独立検証通過が条件） | 実行→出力後修正 |
| L-GATE | 出力の対外公開・成果の確定・広告予算執行・価格の対外変更 | 実行前に発話確認＋monetary_gate |
| L-FROZEN | 法的責任・契約・資金・雇用・撤退・信頼対面・規制産業判断・長ホライズン意思決定 | 人間専管（V6） |

## L1 実働の受け入れ基準（自己検証）

実働を回す前に次を満たす:
1. THESIS/VENTURE-REGIME/DONT-VENTURE が VO:L0 で確定済み（信用ポジション・代謝方針・充足水準の方向）。
2. 対象事業のトークン変換が **ACTIVE モダリティ**（text/code/agent）。視覚/聴覚なら献上。
3. **独立検証層**が接続済み（状態 write＋ground truth 照合の経路がある）。自己申告を成果としない。
4. 人間検証コストが unit-economics に COGS として載っている。
5. venture_scope ≥ gtm_execution かつ monetary_gate 内（design_only なら INACTIVE のまま設計に留める）。

## 現状スコープ（v0.1.0・骨格）

- **ACTIVE**: text/文章・code/program・agent/workflow のトークン変換（`EXECUTION-BASIS` で検証済の可用域）。
- **INACTIVE（要補完）**: image・audio/voice/music・video。能力・単価・ユニットエコノミクスが未検証（`EXECUTION-BASIS` §7）。補完リサーチ後に有効化する。
- 能力数値は floor（model 依存）。本スキルは数値でなく**構造（独立検証・可逆・信用・実測）**に依拠する。

## 一行

**THESIS を受け取り、AI が「短く・検証可能・可逆なトークン変換」を独立検証層の背後で実行する。人間検証は COGS、不可逆は人間専管、主戦場は B2B 成果検証可能、成果は自己申告でなく実測 ── design_only では設計のみ、gtm/ops 昇格で実働。**
