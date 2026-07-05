---
name: vo-crosscut-council
origin: venture-os
version: 0.1.0
compatibility: DH crosscut-council の判定機構（consensus-protocol / ctl-calculation / 合議6公理）を継承。ペルソナのみ VO 素材へ差替。
description: >-
  venture-os の判断合議機構。VO:L0/L1 の実行中に生じた判断点（実装方針の拮抗・トレードオフ・
  憲法抵触・不可逆操作・二runway競合）を、投資家/創業者/懐疑的顧客の3ペルソナで並列独立に評価し、
  重み付き判定（judgment）を返す。決定（decision）ではない — final_decision は常に null で、
  実装者/人間が合意プロセスで方針化する。Make sure to use this skill whenever a venture judgment is
  in tension: 信用と貨幣のトレードオフ、どの信用ポジション/BMパターン/価格を採るか拮抗している、
  憲法（V1〜V6）に抵触しそう、不可逆な賭け（金/法/人/撤退）の是非、信用のための赤字継続 vs 黒字化の
  信用犠牲（二runway競合）、confidence<0.6 の実装判断 — even if not explicitly asked to convene a council.
  タイポ修正・明確仕様の素直実装・定型処理では起動しない。層ではなく横断の判断機構（L 番号を付けない）。
---

# VO Council（判断合議・横断機構）

VO:L0/L1 実行中の判断点で発動する合議制判断機構。DH `crosscut-council` の判定機構を**そのまま継承**し、business ペルソナ3体を VO 素材へ差し替える（第3条・再実装しない）。

> **正典参照**: 詳細は `../../../references/build-pack/03-council-personas.md`（ペルソナ定義・VTL算出）と `../../../references/PHILOSOPHY-venture-os-draft-v1.md`（第6条 人間≒Council / V1〜V6）。合議6公理は DH council-philosophy を継承。VO 独立 repo 移設時に references/ へ colocate。

## 不変核（DH 合議6公理を継承）

- **非フラクタル核**: Council 自体は非フラクタル。判断は決断であり認識合わせではない。層を作らない（L 番号なし）。
- **対立の哲学**: 対立は悪でなく、構造化して見える化するのが目的。`minority_opinion` を常に保持。
- **認識合わせと合意の分離**: Judgment Agent 出力は**判断（judgment）であって決定（decision）ではない**。`final_decision` は常に null。実装者/人間が合意プロセスで方針化する。

## 3ペルソナ（presentation 差替のみ・logic は council 本体）

| ペルソナ | 視点 | 重視条 | 典型の問い |
|---|---|---|---|
| **投資家** | 資本効率・継続性・スケール | V4 継続 / V2 充足 | 「継続を脅かさないか。runway は。回収は」 |
| **創業者** | ビジョン・信用の張り方・実行 | V1 信用一次 / V3 ループ | 「狙った信用ポジションを積むか、逸れるか」 |
| **懐疑的顧客** | 真正性・体験・不信の芽 | V5 真正性 / 第4条 | 「earned な信用か、manufactured か。顧客は見抜く」 |

3体で **信用（創業者）× 貨幣継続（投資家）× 真正性/顧客（懐疑的顧客）** を張り、VO 憲法の主要緊張（信用⇄貨幣・真正⇄成長）を可視化する。

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
    {"persona": "investor", "opinion": "runway を考えると単価を上げたい", "weight": 0.34},
    {"persona": "founder", "opinion": "高単価は狙った関係信用を焼くリスク", "weight": 0.33},
    {"persona": "skeptic_customer", "opinion": "顧客は値上げの意図を見透かす", "weight": 0.33}
  ],
  "weighted_judgment": "充足水準までの緩やかな単価調整に留める",
  "minority_opinion": "投資家の積極値上げ案を two-runway 競合として温存する",
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
