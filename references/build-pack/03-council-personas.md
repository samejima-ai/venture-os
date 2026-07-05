# VO Council ペルソナ ＋ VTL 算出

> ビルド準備パック #3。DH Council 機構（consensus-protocol / ctl-calculation）を継承し、ペルソナのみ差し替える（第3条・再実装しない）。
> 参照: council-philosophy（合議6公理）/ 憲法 V1〜V6 / 第6条 人間≒Council。

## 位置づけ

VO Council は DH Council の**判定機構をそのまま移植**し、business ペルソナ3体を VO 素材へ差し替える。合議6公理（非フラクタル核・対立の哲学・認識合わせと合意の分離・minority_opinion 保持）は不変。判定は judgment であって decision でない（final_decision は常に null）。

## 三極ペルソナ＝単極フォース（presentation 差替のみ・logic は council 本体）

> **v0.2.0 で再設計**（DH Council 判定: 三極採用・第4極不常設・水準分離）。旧3ペルソナ（投資家/創業者/懐疑的顧客）は起業界の借り物で、投資家＋創業者が二重に貨幣最大化アーキタイプ＝憲法（V1/V2）に逆風、顧客は真正性専業で需給を欠き最弱、かつ憲法条の代弁者に再スキンした結果ぶつからず耐久力を失っていた。役割の混合をやめ、**1体＝1つの力の偏執**（単極フォース）に転換して対立トライアングルを張る。定義ファイルは `.claude/skills/vo-crosscut-council/references/personas/business/`。

| ペルソナ | 極 | 憲法との関係 | 典型的な問い |
|---|---|---|---|
| **資本家（Capitalist）** | 利益（貨幣最大化） | ストレステスター（V1/V2 を戦術で攻撃） | 「なぜ最大化しない。充足は競争で死ぬ＝V4 の失敗では」 |
| **信用の番人（Credit Steward）** | 信用（真正・充足） | 擁護者（V1/V2/V3/V5） | 「狙った信用を積むか。earned か。焼いていないか」 |
| **需給の代弁者（Demand Advocate）** | 需給（顧客の真実・WTP） | 直交（design_only では反証可能前提で語る） | 「ターゲットは実在し、その値で払うか。需給ギャップは」 |

**対立トライアングル**: 利益⇔信用（最大化 vs 充足）／利益⇔需給（儲かる形 vs 客が欲しい形）／信用⇔需給（深い信頼 vs 大衆需要）。3辺すべてが本気で衝突する＝判断の耐久力の源。

**水準分離ルール**: 資本家が攻撃するのは**戦術次元での V1/V2 のストレステスト**であって、**憲法 V1〜V6 そのものの改正ではない**（改正は人間専管 H1/H2・Council の投票対象にしない・judgment ≠ decision）。争えるのは【事業の戦術】に閉じる。

**invocable な悪魔の代弁者（常設4極にしない）**: リスク/不可逆/致命前提は H 専管＋DONT-VENTURE＋monetary_gate の構造ゲートが受けるため第4極は常設しない（DRY）。致命前提を狩る必要がある時だけ `devils-advocate.md` を invocable で召喚する。需給の判断データ供給元「需給センサー」skill は別途新設予定（unit-economics=貨幣・credit-runway=信用 の兄弟・後続 PR）。

## 起動する判断点（C カテゴリ・第6条）

- **C1 抵触**: 実装中の憲法照合（例: この代謝は信用ポジションを焼かないか＝V1/V5）
- **C2 トレードオフ**: BMパターン/信用ポジション/価格の選択拮抗
- **C3 不可逆**: 権限内の不可逆判断（不可逆枠は H へ）
- **C4 仕様矛盾**: THESIS 内部矛盾の解消
- **VO 固有**: 二runway 競合（信用のための赤字 vs 黒字化の信用犠牲）← GAP #3 の主戦場

## VTL 算出（CTL 機構の移植）

CTL の決定論算出（total 件数・カテゴリ別 count・agreement_rate → 委譲範囲）を**そのまま移植**。ただし:

- **適用対象は可逆な事業判断サブセットのみ**（不可逆＝金/法/人/撤退/調達は VTL 非依存で常時人間専管・第9条）。
- 閾値は CTL を初期流用（VTL-0: コールドスタート全件献上 / VTL-1: total≥10 かつ いずれか count≥10・agreement≥90% / VTL-2 / VTL-3）。
- monetary_gate（人間設定支出上限）と**直交**。実行可否 =「VTL 許可」AND「gate 内」。

```
## Venture Trust Level（VENTURE-REGIME.md に記録）
- vtl: VTL-0
- delegation_scope: []
- escalation_categories: [C1, C2, C3, C4, two-runway]
- council_data_version: 0.1
```

## Council data の横断蓄積

DH と同じく `~/.claude/council-data/`（user-scope）に蓄積。VO/DH で business ペルソナ系の判定資産を共有し得る（相乗り連携・D1）。repo 側は council-data を含まない。

## ペルソナ定義ファイル

`.claude/skills/vo-crosscut-council/references/personas/business/` に **capitalist / credit-steward / demand-advocate**（三極）＋ **devils-advocate**（invocable・常設しない）を配置済み（DH の persona 二層モデル＝logic/presentation 分離に準拠。logic は council 本体、persona は presentation のみ）。VO 独立 repo 移設時も同構造で colocate。
