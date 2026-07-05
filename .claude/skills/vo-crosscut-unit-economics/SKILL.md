---
name: vo-crosscut-unit-economics
origin: venture-os
version: 0.1.0
description: >-
  venture-os の第1層計算的センサー。事業の継続可否を決定論の算数で判定する（Shift Left・第2条）。
  推論・実市場投下の前に、LTV/CAC/粗利率/回収期間/損益分岐/貨幣runway/TAM上限を計算し、
  自明な破綻（LTV/CAC<1・負の粗利・到達不能な必要顧客数・回収期間>runway）を検出して pivot 献上する。
  Make sure to use this skill whenever a venture's viability needs a numeric gut-check: この事業は
  儲かるか机上で確かめたい、CAC/LTV/粗利/runway を計算したい、価格やコスト構造が成立するか、
  黒字化に必要な顧客数は、この単価で継続できるか、充足水準（稼ぐべき額）はいくらか — even if not
  explicitly asked. 充足原則（V2）で「稼げる」でなく「継続に足る」を基準にする。VO:L0 が THESIS
  前提として仕込み、VO:L1 が運営で回す。推論センサーの前に必ず通す（計算で解ける破綻を推論で確かめない）。
---

# vo-crosscut-unit-economics（第1層計算的センサー）

事業の継続可否を決定論の算数で判定する Shift Left センサー。「E2E の前に Console 根絶」＝「顧客インタビュー・実市場投下の前に、財務モデルの破綻を根絶」。

> **正典参照**: 手順は `../../../references/build-pack/04-unit-economics-protocol.md`。憲法第2条（算数を先に）・V2（充足）・V4（貨幣runway）。VO 独立 repo 移設時に references/ へ colocate。

## 最小算数セット

| 指標 | 式 | 破綻判定（決定論） |
|---|---|---|
| 粗利率 | (売上−変動費)/売上 | 負 or 極小 → 即棄却 |
| LTV/CAC | LTV ÷ CAC | **< 1 → 破綻（pivot 献上）／< 3 → 要注意** |
| 回収期間 | CAC ÷ (月次ARPU × 粗利率) | 貨幣runway より長い → 継続を脅かす |
| 損益分岐 | 固定費 ÷ (単価 × 粗利率) | 到達不能な必要顧客数 → 棄却 |
| 貨幣runway | 現金 ÷ 月次ネットバーン | V4 継続の必要条件・充足水準と照合 |
| TAM上限 | TAM × 現実シェア × 単価 | 充足水準に届かない → 市場が小さすぎ（pivot） |

## 充足原則の算数化（V2）

必要売上 = 継続に足る額（sufficiency_target）。これを大幅超過する価格設計は、しばしば信用ポジションを焼く（credit-strategy §5）。「稼げる」と「稼ぐべき」を分け、後者を基準にする。**貨幣は最大化でなく充足**。

## 決定論の保全（第2条）

推論センサーは計算センサーの上位互換ではない。計算で解ける破綻を推論（LLM の「イケる」）で確かめない。数字が破綻を示すなら、物語がどれだけ良くても pivot 献上（タイプA）。

## 出力

- THESIS の「ユニットエコノミクス前提」欄を数値で埋める。
- 破綻検出時は L0 へ pivot 献上（タイプA）。境界内なら L1 実働へ。
- 貨幣runway を V4 の二軸の一方として供給（信用runway は別途 GAP #2）。
- design_only の献上物に「机上ユニットエコノミクス表」を含める（実市場に出さず机上で継続可否を判定）。

## 起動タイミング

- VO:L0 ステップ5（THESIS 策定時の机上検証）
- VO:L1 運営（runway 監視・二runway 競合時は Council two-runway へ）
