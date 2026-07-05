# 同居・個別クローン設計 ＋ 相互リンク

> 判断（2026-07-05）: 本体は別リポ保管。**プロジェクト立ち上げ時の同居を考慮した設計を組み込む**。DH・VO とも **public リポ**、相互リンクで参照可能に。
> 本書は VO を独立 repo 化する際の deploy モデルと衝突回避を確定する（migration の一部）。

## 2つの deploy モデル（どちらも成立させる）

### モデルA: 個別クローン（既定・多くの場合）

- 事業設計だけの repo → **VO のみ**クローン（`.claude/skills/` に VO スキルだけ）。
- 製品開発だけの repo → **DH のみ**クローン（ai-gata がこれ）。
- 各 repo にメタスキルは1つ → **衝突ゼロ**。連携は repo 境界を跨ぐハンドオフ（VO の THESIS → DH の SPEC・入れ子トポロジー）。

### モデルB: 同居（1プロジェクトに両方）

- 1つの repo で事業設計（VO）と製品開発（DH）を同居させる（小規模一体運用）。
- `.claude/skills/` に DH と VO のスキルが**混在** → 同名スキルが衝突し得る。
- **衝突するのは実質 `crosscut-council` のみ**（DH＝経営者/開発者/哲学者、VO＝投資家/創業者/懐疑的顧客。同名・別内容）。他は名前が異なり衝突しない。

## 衝突回避 ── VO の `vo-` 名前空間（baked-in）

モデルB を成立させるため、**VO の全スキルは `vo-` 接頭辞**で命名（frontmatter `name:` + dir）:

| VO スキル（vo- 名前空間） | DH の対応 | 同居時 |
|---|---|---|
| `vo-layer0-venture-architect` | `layer0-spec-architect` | 別名・共存 |
| `vo-crosscut-council` | `crosscut-council` | **別名・共存（衝突回避の要）** |
| `vo-crosscut-unit-economics` | （DH になし） | 共存 |
| `vo-crosscut-bizmodel-selector` | （DH になし） | 共存 |
| `vo-crosscut-credit-runway` | （DH になし） | 共存 |

- DH は base 名前空間の incumbent（無印・無改修）。VO が `vo-` で自己名前空間化。
- 会話規約 `VO:L0` ⇔ 実体 `vo-layer0-venture-architect`。
- 完全対称化（DH も `dh-` / 両者 plugin 化）は将来任意（DH 改修を伴う H 案件）。現行は VO 片側で同居衝突を解消。

> **設計記録内の bare 名の読み替え**: `vo-` 決定（本 PR）より前に書かれた設計記録（`CONCEPTION-*`・`build-pack/*`・`CREDIT-STRATEGY-*` 等）に残る bare スキル名（`crosscut-unit-economics` 等）は、**deploy 実体としては `vo-` 名前空間に読み替える**（例: `crosscut-unit-economics` → `vo-crosscut-unit-economics`）。運用・起動を指す live ドキュメント（protocol 各書・SKILL・skills/README）は `vo-` に更新済み。

## 相互リンク（public 参照）

DH・VO を public リポとし、相互に参照リンクを置く:

| repo | 置くリンク |
|---|---|
| **VO**（venture-os・新規） | README・philosophy 前文に **DH へのリンク**: `https://github.com/samejima-ai/dialog-harness`（兄弟・9条継承元） |
| **DH**（dialog-harness・既存） | README に **VO へのリンク**: `https://github.com/samejima-ai/venture-os`（兄弟メタスキル）※ DH repo への追記は本セッション権限外。VO 公開時に人間 or scope 内 AI が追記 |

> VO repo の README は「Built as a sibling of dialog-harness（9条憲法を継承）」＋ DH リンクを含む（migration scaffold で生成）。DH→VO の相互リンクは VO 公開後に DH 側へ追記（DH は本セッション scope 外）。

## smoke（同居検証）

- [ ] VO 単独 repo: `vo-*` スキルだけで design_only 一周（モデルA）
- [ ] DH と同一 `.claude/skills/` に VO を置いても `crosscut-council` と `vo-crosscut-council` が共存（名前衝突なし・モデルB）
- [ ] VO README に DH リンク・DH README に VO リンク（相互参照）

## 一行

**VO は `vo-` 名前空間で baked-in 衝突回避 ── 個別クローン（既定）でも DH との同居でも成立し、両 public リポは相互リンクで繋ぐ。**
