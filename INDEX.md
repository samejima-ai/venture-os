# INDEX — venture-os

DH（dialog-harness）の兄弟メタスキル。全体目次。

## 入口

- [`README.md`](./README.md) — 概要・DH との関係・deploy
- [`philosophy.md`](./philosophy.md) — 憲法（継承 DH 9条 ＋ VO V1〜V6・草案）

## スキル（`.claude/skills/`・`vo-` 名前空間）

| スキル | 責務 |
|---|---|
| `vo-layer0-venture-architect` | VO:L0 設計（テーゼ・信用戦略 CQ1〜4・BMパターン×市場ポスチャ・ユニットエコノミクス机上・VENTURE-REGIME 判定） |
| `vo-crosscut-council` | 判断合議（三極: 資本家/信用の番人/需給の代弁者・judgment・two-runway） |
| `vo-crosscut-unit-economics` | 貨幣side センサー（LTV/CAC/粗利/runway・第1層計算的） |
| `vo-crosscut-credit-runway` | 信用side センサー（信用runway・V4 二軸の片肺） |
| `vo-crosscut-demand-sensor` | 需給side センサー（需要前提＋反証可能命題＋確度・Council 需給の代弁者へ供給） |
| `vo-crosscut-market-smoke` | 第2層 需要スモークテスト実働（LP/広告 deploy・gtm 昇格で有効・demand-sensor の実走） |
| `vo-crosscut-bizmodel-selector` | 66パターン選択・再結合（信用蓄積性で選好） |

## 正典（`references/`）

- 憲法本文: `PHILOSOPHY-venture-os-draft-v1.md`
- 信用: `CREDIT-STRATEGY-*`（戦略）/ `CREDIT-RUNWAY-*`（測定）/ `TWO-RUNWAY-ARBITRATION-*`（裁定）
- 設計: `CONCEPTION-*-v1/v2`（兄弟定立・写像・5決定）/ `EXECUTION-ATOZ-*`（GAP マップ）
- ビルド: `build-pack/00-06`（REGIME判定・出力テンプレ・Councilペルソナ・ユニットエコノミクス・命名規約・VO↔DH連携）
- パターン: `prototype/bizmodel-pattern-library.md` / `CANON-*`（大辞典66）
- 移設: `migration/`（MIGRATION-PLAN・INHERITANCE-METHODS・RATIFICATION-CHECKLIST・CO-RESIDENCE-DESIGN）

## ステータス

- design_only スライス（L0＋Council＋設計系 crosscut）構築済み。
- 未確定: 憲法批准（full_ops 手前）・DH philosophy submodule 化・VO:L1 実働（gtm/ops）。
