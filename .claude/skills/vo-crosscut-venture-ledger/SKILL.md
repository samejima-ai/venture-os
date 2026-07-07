---
name: vo-crosscut-venture-ledger
origin: venture-os
version: 0.1.0
compatibility: dialog-harness 兄弟メタスキル。DH の COUNCIL-LOG（append-only）＋ crosscut-continuous-learning（候補出力・人間承認）＋ layer0-reindex-librarian（蒸留・代謝）の VO 統合版。
description: >-
  venture-os の学習機構（横断）。Council ログのように venture 実行の事実を append-only で蓄積し
  （VENTURE-LOG）、そこから Best Practice（効いた型）と Anti-pattern（踏んだ罠）を蒸留して、
  プロジェクト毎の業務ナレッジベースを構築する。過去から学ぶ ── 同じ罠を踏まない・効いた型を再利用する。
  記録は「独立検証を通った実 outcome のみ」（自己申告の成功を KB に入れない・earned のみ・V5）。
  蒸留は候補出力のみで、Best Practice/Anti-pattern への昇格は人間最終承認（自動 promote しない・第6条）。
  Make sure to use this skill whenever a venture needs to record or learn from its execution history:
  venture ログを残したい、過去の実行から学びたい、Best Practice/アンチパターンを蓄積したい、
  同じ失敗を繰り返さない仕組みが欲しい、業務ナレッジベースを作りたい、この判断/代謝/検証の結果を記録したい、
  振り返りで何が効いて何が罠だったか蒸留したい — even if not explicitly asked. ログは編集不可（append-only）。
  蒸留は読み取りのみの一方向（ログを書き換えない・harness-verifier の独立性原則）。層でなく横断機構（L 番号なし）。
---

# vo-crosscut-venture-ledger（venture 実行の記録簿 → 業務ナレッジベース）

Council ログのように **venture 実行の事実を append-only で蓄積**し、そこから **Best Practice（効いた型）と Anti-pattern（踏んだ罠）を蒸留**して、プロジェクト毎の業務ナレッジベースを構築する学習機構。DH の情報代謝サイクル（history → 叡智 → COLD）の事業版。

> **出自（発明でなく翻訳・第3条）**: DH `crosscut-council` の COUNCIL-LOG（append-only・単一情報源）／ DH `crosscut-continuous-learning`（観測パターンから候補出力・**自動 promote しない・人間最終承認**）／ DH `layer0-reindex-librarian`（episodic history → 叡智へ結晶化・抜け殻を COLD へ）。
> **正典参照**: outcome の真正性は `../../../references/PHILOSOPHY-venture-os-draft-v1.md`（V5 earned のみ・第6条 人間最終承認）。検証済 outcome の供給は `../vo-crosscut-council/`（判断）・`../vo-layer1-venture-exec/references/execution-playbook.md`（独立検証を通った成果）。会計台帳は別（`../vo-crosscut-unit-economics/`）── 本スキルは**事業実行の記録簿と学習**であって財務ではない。

## 三層構造

```
① VENTURE-LOG（append-only・project-scope）    ← 事実の記録（編集不可）
        ↓ 蒸留（読み取りのみ・一方向）
② Best Practice / Anti-pattern 候補             ← 抽出（候補出力のみ）
        ↓ 人間最終承認（第6条・自動 promote しない）
③ 業務ナレッジベース（human-ratified）          ← 承認された叡智
        ↓ 消費
   VO:L0（設計時に Anti-pattern を避ける）／ VO:L1（実行時に Best Practice を適用）
```

## ① VENTURE-LOG スキーマ（1イベント1エントリ・append-only）

`venture/VENTURE-LOG.md`（利用者プロジェクト・project-scope）へ追記する。編集・削除しない。

| フィールド | 内容 |
|---|---|
| `timestamp` | ISO 8601 |
| `venture` | 事業識別子 |
| `event` | 種別: `decision`（Council 判断）/ `metabolism`（代謝の試行）/ `verify`（検証結果）/ `escalation`（献上）/ `pivot` / `outcome` |
| `topic` | 何についてか（抽象要約・固有機微は入れない） |
| `action` | 採った判断・行動 |
| `outcome` | **独立検証を通った実結果のみ**（`success`/`failure`/`pending`）。**自己申告の成功は記録しない**（false success 除外・V5） |
| `cost` | AIコスト / 人間コスト（分かれば） |
| `constitution` | 憲法接続（V1〜V6・第N条） |
| `ref` | 関連 invocation（Council id・検証層の記録） |

**不変条件**: `outcome=success` は `vo-layer1-venture-exec` の独立検証層（execution-playbook §2）を PASS したもののみ。検証を通っていない成功主張は `outcome=pending` で載せる（後で検証されるまで success にしない）。

## ② 蒸留 ── Best Practice / Anti-pattern 候補（候補出力のみ）

VENTURE-LOG を**読み取り専用**で走査し、繰り返しパターンを候補として抽出する。**ログは書き換えない**（一方向依存・harness-verifier 原則）。

| 型 | 形 | 抽出源 |
|---|---|---|
| **Best Practice** | 「状況 X で 行動 Y → 良い outcome（再現あり）」 | `outcome=success` の反復（検証済のみ） |
| **Anti-pattern（罠）** | 「状況 X で 行動 Z → 悪い outcome」 | `outcome=failure`・`escalation`・`pivot`・信用毀損 |

**アンチパターンの主源**: false success の見逃し／信用を焼いた代謝（V5 抵触）／不可逆への踏み込み（V6 越境）／充足を割った採算／未検証モダリティの実行。**失敗と献上こそが最も価値ある学習素材**（earned・実際に起きたこと）。

出力は `delivery/VENTURE-KNOWLEDGE-CANDIDATES-<timestamp>.md`（候補・未承認）。**この時点では叡智に昇格しない。**

## ③ 業務ナレッジベース（human-ratified）

人間が候補を承認したものだけを `venture/KNOWLEDGE-BASE.md` へ昇格する。**自動 promote しない**（DH continuous-learning が Council 諮問で確定した規範・第6条 人間最終承認）。理由: 因果の確からしさ・一般化可否は外側からの観測（人間ゲート）で補強する必要があり、自己申告だけでは情報純度が確保されない。

- Best Practice: 承認済みの「効く型」。VO:L1 が実行前に参照して適用。
- Anti-pattern: 承認済みの「罠」。VO:L0 が設計時に参照して回避（DONT-VENTURE の運用的補完）。

## 消費（過去から学ぶ経路）

| 読み手 | いつ | 何を |
|---|---|---|
| **VO:L0**（`venture-architect`） | 設計・振り返り儀式 | Anti-pattern を照合し、同じ罠を設計で避ける |
| **VO:L1**（`venture-exec`） | 実行前 | Best Practice を適用・過去の失敗型を検証層が警戒 |
| **Council** | 判断時 | 過去の類似判断とその outcome を参照（判断の質を上げる） |

## 代謝（情報の結晶化・reindex-librarian 同型）

- VENTURE-LOG が閾値を超えたら蒸留を走らせ、叡智へ結晶化した後の**抜け殻を COLD アーカイブへ**排出（`COLD≠delete`・生ログは消さない）。
- 目的は「AI 購読量（既定ロード量）の上限維持」── KB は薄く保ち、生ログは COLD で保存。
- 初回・規定サイクルは **Dry-run**（差分レポートのみ・実結晶化しない）。

## project-scope と VO 叡智への昇格

- 既定は **project-scope**（`venture/` 配下）。事業固有の Best Practice/Anti-pattern はその事業に閉じる。
- **複数 venture で反復した**パターンは、人間承認を経て **VO フレームワーク叡智**（`references/` の Best Practice/Anti-pattern ライブラリ）へ graduate し得る（reindex-librarian が L0/D4 叡智へ書くのと同型）。横断化も人間ゲート。

## DH 機構への対応（研鑽の出所）

| VENTURE-LEDGER の要素 | 翻訳元（DH 実装済み） |
|---|---|
| VENTURE-LOG（append-only・単一情報源） | COUNCIL-LOG（append-only・編集不可） |
| 候補出力・自動 promote しない・人間承認 | `crosscut-continuous-learning`（Council 諮問 w2qb01 で確定） |
| 蒸留・抜け殻を COLD へ・Dry-run 既定 | `layer0-reindex-librarian`（情報代謝サイクル） |
| ログを書き換えない一方向・読み取り専用 | `harness-verifier`（独立性原則） |
| outcome は検証済のみ（自己申告除外） | `layer1-independent-reviewer`＋execution-playbook §2（false success 対策） |

## 起動しない

- タイポ・フォーマット調整。単発の記録は append するだけで蒸留は回さない（閾値/リズムで蒸留）。
- 生ログの削除（COLD＝archive≠delete）。人間承認なしの叡智昇格。

## 一行

**venture 実行の事実（検証を通った outcome だけ）を append-only で積み、失敗と献上から Anti-pattern を、反復した成功から Best Practice を蒸留する。昇格は人間承認。同じ罠を二度踏まず、効いた型を再利用する業務ナレッジベース ── DH の COUNCIL-LOG／continuous-learning／reindex の事業版。**
