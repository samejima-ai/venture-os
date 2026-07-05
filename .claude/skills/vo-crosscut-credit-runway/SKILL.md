---
name: vo-crosscut-credit-runway
origin: venture-os
version: 0.1.0
description: >-
  venture-os の信用側センサー。信用ポジション別の代理指標束を、真正性フィルタ（earned のみ）を通して
  合成信用スコア（0-100）にし、その下落速度から「危険水準までの期数」＝信用runway を算出する。
  貨幣runway と同一単位に揃え、V4 の二軸監視を成立させる。Make sure to use this skill whenever a
  venture needs to gauge its trust/reputation health over time: 信用/評判が積めているか測りたい、
  信用runway を出したい、解約や炎上や不信の先行指標を見たい、NPS/リテンション/紹介率/オーガニック言及を
  ひとつの信用スコアにまとめたい、信用が貨幣より先に尽きないか、信用の毀損速度は — even if not
  explicitly asked. 製造された信用（サクラ/水増し）は除外する（V5）。VO:L0 が計器を設計、VO:L1 が実測監視。
---

# vo-crosscut-credit-runway（信用側センサー・V4 二軸の片肺）

信用資本を代理指標束から合成スコア化し、下落速度で「危険水準までの期数」＝信用runway を出す。貨幣runway と同一単位に揃え、V4 の二軸監視を成立させる。

> **正典参照**: 手順は `../../../references/CREDIT-RUNWAY-venture-os-v1.md`（GAP #2）。指標束の定義元は `../../../references/CREDIT-STRATEGY-venture-os-v1.md` §9。裁定は `../../../references/TWO-RUNWAY-ARBITRATION-venture-os-v1.md`（GAP #3）。憲法 V1/V4/V5・第6条 観測性統一。VO 独立 repo 移設時に references/ へ colocate。

## 算出フロー

1. **指標束選択**: 一次信用種別（能力/誠実/関係）が測る指標を確定（credit-strategy §9）。
2. **正規化**: 率/NPS/件数トレンドを 0-100 の共通スケールへ。逆符号指標（不具合率・苦情）は反転。
3. **真正性フィルタ（V5）**: 製造信用（サクラ・水増し・ダミー）を除外/減点。疑わしい指標は重み低減＋`確度: 低`。
4. **合成**: 信用ポジション由来の重みで加重平均 → 信用スコア（0-100）。
5. **信用runway**: 信用バーン＝スコア移動平均の傾き。`信用runway = (現スコア − credit_floor) ÷ |信用バーン|`（バーン≥0 なら ∞）。

## 出力

```
- credit_score: 0-100
- credit_burn: 期あたり変化（負=毀損）
- credit_runway_periods: 危険水準までの期数（**null = ∞ = 健全**・機械可読。1期＝VENTURE-REGIME.period・既定 monthly＝貨幣runway と同一 timebase）
- credit_floor: 危険水準（既定 40）
- authenticity_flags: [疑わしい指標...]
```

## 起動と連携

- **貨幣側**は `vo-crosscut-unit-economics`（貨幣runway）。両者が V4 の二軸。
- 信用runway が floor 接近 → L0 へ献上（信用ポジション再検討＝pivot 相当）。
- 貨幣runway と競合 → `vo-crosscut-council` の two-runway 判断点（`../../../references/TWO-RUNWAY-ARBITRATION-venture-os-v1.md`）へ。

## 観測性統一（第6条）

収集層（高解像度・構造化・append-only・真正性検査に足る粒度）と提示層（P3 が信用スコア/バーン/runway/危険度を一目）を整合させ、Council 3ペルソナが同じ事実を見られるようにする。

## design_only での扱い

実市場データが無い段階では「計器の設計＋想定値シミュレーション」を THESIS に含める。実測は gtm 昇格後に段階解放。
