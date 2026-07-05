# VO Council ペルソナ ＋ VTL 算出

> ビルド準備パック #3。DH Council 機構（consensus-protocol / ctl-calculation）を継承し、ペルソナのみ差し替える（第3条・再実装しない）。
> 参照: council-philosophy（合議6公理）/ 憲法 V1〜V6 / 第6条 人間≒Council。

## 位置づけ

VO Council は DH Council の**判定機構をそのまま移植**し、business ペルソナ3体を VO 素材へ差し替える。合議6公理（非フラクタル核・対立の哲学・認識合わせと合意の分離・minority_opinion 保持）は不変。判定は judgment であって decision でない（final_decision は常に null）。

## 3ペルソナ（presentation 差替のみ・logic は council 本体）

| ペルソナ | 視点 | 重視する憲法条 | 典型的な問い |
|---|---|---|---|
| **投資家（Investor）** | 資本効率・継続性・スケール | V4 継続 / V2 充足 | 「この賭けは継続を脅かさないか。runway は。回収は」 |
| **創業者（Founder）** | ビジョン・信用の張り方・実行 | V1 信用一次 / V3 ループ | 「この一手は狙った信用ポジションを積むか、逸れるか」 |
| **懐疑的顧客（Skeptic-Customer）** | 真正性・体験・不信の芽 | V5 真正性 / 第4条 | 「これは earned な信用か、manufactured か。顧客は見抜く」 |

3ペルソナは**信用（創業者）× 貨幣継続（投資家）× 真正性/顧客視点（懐疑的顧客）**を張り、VO 憲法の主要緊張（信用⇄貨幣・真正⇄成長）を合議で可視化する。

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

## ペルソナ定義ファイル（VO repo 移設先）

`templates/personas/` に investor / founder / skeptic-customer を配置（DH の persona 二層モデル＝logic/presentation 分離に準拠。logic は council 本体、persona は presentation のみ）。
