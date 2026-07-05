---
name: vo-crosscut-bizmodel-selector
origin: venture-os
version: 0.1.0
description: >-
  venture-os の BM パターン選択・再結合ヘルパー。ビジネスモデル大辞典66パターン（IT-active 分類）から、
  事業テーゼに合うパターンを選び・組み合わせる（「新規BMの約90%は再結合」）。DH の ARC パターン選択の事業版。
  Make sure to use this skill whenever a venture needs to decide how it makes money or which model to copy/combine:
  収益モデル/ビジネスモデルを選びたい、どのパターンで稼ぐか、既存モデルをどう組み合わせるか、
  この事業型に合う課金/流通/プラットフォームの型は、サブスク/従量/フリーミアム/マーケットプレイス/
  レベニューシェア等のどれ、信用ポジションを増幅するパターンは — even if not explicitly asked.
  信用蓄積性でパターンを選好する（V1）。物理インスタンスは凍結・IT-active とデジタル再来のみ選択対象（D3）。
  VO:L0 のステップ4（何で稼ぐか × 誰と戦わないか）で起動。
---

# vo-crosscut-bizmodel-selector（BM パターン選択・再結合）

事業テーゼに合う BM パターンを、大辞典66パターンの IT-active 分類から選び・再結合するヘルパー。DH の ARC パターン選択（monolith/realtime/event-sourcing）の事業版。

> **正典参照**: データは `../../../references/prototype/bizmodel-pattern-library.md`（IT-active / physical-frozen / dual-face 分類・A〜G × Who/What/How/Value タグ・信用蓄積性）。正典本体は `../../../references/CANON-bizmodel-encyclopedia-expansion-27.md`。VO 独立 repo 移設時に references/ へ colocate。

## 選択原則

1. **再結合が既定**（白紙発明でなく既存パターンの組み合わせ・「90%は再結合」）。
2. **IT-active のみ選択対象**（D3）。物理インスタンスは凍結。dual-face はデジタル再来面を採る（可用性保証→SLA、セルフサービス→PLG、スーパーマーケット→marketplace）。
3. **信用蓄積性で選好**（V1）。同条件なら信用を積むパターンを選ぶ。

## 信用ポジション → 選好パターン（credit-strategy §6 と連動）

| 一次信用種別 | 増幅する選好パターン |
|---|---|
| 能力信用 | 成果課金（III-1）・SLA/可用性保証（D-11デジタル面）・レイヤープレイヤー（D-5） |
| 誠実信用 | データ協同組合（III-5）・合気道（G-5）・透明フリーミアム（A-3） |
| 関係信用 | 顧客ロイヤルティ（E-11）・体験販売（E-6デジタル面）・User Design（E-8）・クリエイター経済 |

## 二軸出力（VO:L0 ステップ4）

- **BM パターン軸**（何で稼ぐか）: A〜F の IT-active から主パターン＋補完を再結合。各パターンに Who/What/How/Value タグ併記。
- **市場ポスチャ軸**（誰と戦わないか・G）: No Frills系/Luxury系/Aikido系/… の IT ポスチャ類型（消費財語彙→IT 翻訳・CONCEPTION v2 §4）。

## 焼くリスクの明示

選んだ信用ポジションを焼くリスクのあるパターン（隠れた収益の過剰第三者最適化・アドオンの過剰課金 等）は DONT-VENTURE に個別記載する（V1/V5・credit-strategy §5）。

## 未確定

基幹35パターンの完全分類は辞典本体取得後（`bizmodel-pattern-library.md` の注記）。タグの一部は AI 推定 `~`。
