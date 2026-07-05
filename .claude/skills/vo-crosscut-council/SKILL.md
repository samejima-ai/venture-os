---
name: vo-crosscut-council
origin: venture-os
version: 0.2.0
compatibility: DH crosscut-council の判定機構（consensus-protocol / ctl-calculation / 合議6公理）を継承。ペルソナのみ VO 素材へ差替。
description: >-
  venture-os の判断合議機構。VO:L0/L1 の実行中に生じた判断点（実装方針の拮抗・トレードオフ・
  憲法抵触・不可逆操作・二runway競合）を、資本家/信用の番人/需給の代弁者の三極（単極フォース）で並列独立に評価し、
  重み付き判定（judgment）を返す。決定（decision）ではない — final_decision は常に null で、
  実装者/人間が合意プロセスで方針化する。Make sure to use this skill whenever a venture judgment is
  in tension: 信用と貨幣のトレードオフ、どの信用ポジション/BMパターン/価格を採るか拮抗している、
  憲法（V1〜V6）に抵触しそう、不可逆な賭け（金/法/人/撤退）の是非、信用のための赤字継続 vs 黒字化の
  信用犠牲（二runway競合）、confidence<0.6 の実装判断 — even if not explicitly asked to convene a council.
  タイポ修正・明確仕様の素直実装・定型処理では起動しない。層ではなく横断の判断機構（L 番号を付けない）。
---

# VO Council（判断合議・横断機構）

VO:L0/L1 実行中の判断点で発動する合議制判断機構。DH `crosscut-council` の判定機構を**そのまま継承**し、business ペルソナを VO の**三極（単極フォース）**へ差し替える（第3条・再実装しない）。

> **正典参照**: 判定機構は DH `crosscut-council`（consensus / ctl / 合議6公理）を継承。ペルソナ定義は `references/personas/business/`（三極 ＋ invocable 悪魔の代弁者）、要約と VTL 算出は `../../../references/build-pack/03-council-personas.md`、憲法は `../../../references/PHILOSOPHY-venture-os-draft-v1.md`（第6条 人間≒Council / V1〜V6）。VO 独立 repo 移設時に references/ へ colocate。

## 不変核（DH 合議6公理を継承）

- **非フラクタル核**: Council 自体は非フラクタル。判断は決断であり認識合わせではない。層を作らない（L 番号なし）。
- **対立の哲学**: 対立は悪でなく、構造化して見える化するのが目的。`minority_opinion` を常に保持。
- **認識合わせと合意の分離**: Judgment Agent 出力は**判断（judgment）であって決定（decision）ではない**。`final_decision` は常に null。実装者/人間が合意プロセスで方針化する。

## ペルソナ＝三極の単極フォース（presentation 差替のみ・logic は council 本体）

役割の混合（旧: 投資家/創業者/懐疑的顧客 ── 投資家と創業者が二重に金を見て憲法に逆風、顧客は真正性専業で需給を欠き最弱）ではなく、**単極のフォース**（1体＝1つの力の偏執）で立てる。各辺が本気でぶつかり判断の耐久力が出る。設計判断は DH Council で叩いた（三極採用・第4極不常設・水準分離）。定義は `references/personas/business/`。

| ペルソナ | 極 | 憲法との関係 | 典型の問い | 定義 |
|---|---|---|---|---|
| **資本家** | 利益（貨幣最大化） | ストレステスター | 「なぜ最大化しない。充足は競争で死ぬ＝V4 の失敗では」 | `capitalist.md` |
| **信用の番人** | 信用（真正・充足） | 擁護者（V1/V2/V3/V5） | 「狙った信用を積むか。earned か。焼いていないか」 | `credit-steward.md` |
| **需給の代弁者** | 需給（顧客の真実・WTP） | 直交 | 「ターゲットは実在し、その値で払うか。需給ギャップは」 | `demand-advocate.md` |

**対立トライアングル**: 利益⇔信用（最大化 vs 充足）／利益⇔需給（儲かる形 vs 客が欲しい形）／信用⇔需給（深い信頼 vs 大衆需要）。3辺すべてが衝突する＝耐久力の源。

**水準分離ルール**（資本家の憲法攻撃リスクの解決）: 資本家は憲法を攻撃するが、争えるのは【この事業の戦術】であって【憲法 V1〜V6 そのもの】ではない。憲法改正は人間専管（H1/H2）で Council の投票対象にしない。judgment ≠ decision（`final_decision` は常に null）ゆえ、重みは「憲法が自動で勝つ」にも「投票で憲法を転覆」にも設定しない。

**invocable な悪魔の代弁者（常設4極にしない）**: リスク/不可逆/致命前提は H 専管＋DONT-VENTURE＋monetary_gate の構造ゲートが受けるため第4極は常設しない（DRY）。三極が全員 GO でも成立しない致命前提を狩る必要がある時だけ `references/personas/business/devils-advocate.md` を invocable で召喚する（DH Council 判定の minority_opinion の温存）。

## 発動する判断点（C カテゴリ・第6条）

- **C1 抵触**: 憲法照合（例: この代謝は信用ポジションを焼かないか＝V1/V5）
- **C2 トレードオフ**: 信用ポジション/BMパターン/価格の選択拮抗
- **C3 不可逆**: 権限内の不可逆判断（不可逆枠＝金/法/人/撤退/調達は H へエスカレート）
- **C4 仕様矛盾**: THESIS 内部矛盾の解消
- **two-runway**（VO 固有）: 信用runway と貨幣runway の競合（信用のための赤字 vs 黒字化の信用犠牲）。裁定原則・プロトコルは `../../../references/TWO-RUNWAY-ARBITRATION-venture-os-v1.md`（両runwayは `vo-crosscut-credit-runway`／`vo-crosscut-unit-economics` が同一 timebase＝VENTURE-REGIME.period・既定 monthly で供給。健全時は `null`=∞）

**起動しない**: タイポ修正・フォーマット調整・明確仕様の素直実装・定型リファクタ。

## 出力（判断であって決定でない）

```json
{
  "topic": "関係信用の事業で高単価プレミアムに寄せるべきか",
  "persona_opinions": [
    {"persona": "capitalist", "opinion": "runway と回収を考えれば単価を上げて最大化すべき", "weight": 0.34},
    {"persona": "credit_steward", "opinion": "高単価は狙った関係信用を焼く。充足水準に留めよ", "weight": 0.33},
    {"persona": "demand_advocate", "opinion": "そもそもターゲットはその値で払うか。WTP を安く検証してから", "weight": 0.33}
  ],
  "weighted_judgment": "WTP を安価検証しつつ、充足水準までの緩やかな単価調整に留める",
  "minority_opinion": "資本家の積極値上げ案を two-runway 競合として温存する",
  "judgment_confidence": 0.62,
  "escalate_to_human": false,
  "final_decision": null
}
```

`minority_opinion` は常に保持する（対立の哲学・少数意見を消さない）。

`final_decision` は常に null。`judgment_confidence < 0.5` または不可逆枠抵触なら `escalate_to_human: true`。

## VTL 委譲（CTL 機構の移植）

`../../../references/build-pack/03-council-personas.md` の VTL 算出に従う。可逆な事業判断サブセットのみ委譲（不可逆＝金/法/人/撤退/調達は VTL 非依存で常時人間専管・第9条）。Council data は `~/.claude/council-data/`（user-scope・DH と共有し得る）。

## 人間専管の境界（第6条 H カテゴリ）

H1 哲学変更 / H2 ルール・禁止境界変更 / H3 方向性発案 / H4 根本設計見直し は Council で代替不可。VO では加えて資金調達・撤退が H4 相当。
