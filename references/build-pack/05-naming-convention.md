# 宣言・命名規約 ── DH/VO 接頭語と責務呼称

> ビルド準備パック #5（命名）。前回合意（2026-07-05）の口頭規約を正式記録。

## 宣言文法

```
{DH|VO}:{責務} 起動
   責務 = L0 | L1 | L2 | Council | crosscut-<名>
```

- 区切りは **コロン**（ハーネスの `plugin:skill` 名前空間と整合）。
- 例: `VO:L0 起動`（venture-architect）/ `VO:L1 起動`（venture-exec）/ `DH:L0 起動`（spec-architect）/ `DH:L1 起動`（autonomous-dev）/ `VO:Council 諮問` / `VO:crosscut-unit-economics 起動`

## 規約4原則

1. **L 番号は"層"の責務だけ**（L0/L1/L2）。**Council（非フラクタル判断機構）と crosscut（横断ヘルパー）に L 番号を付けない**（第1条「L3 を新設しない・対応を層にしない」と整合）。Council/crosscut は名前で呼ぶ。
2. **スキル実体名（frontmatter `name:` + dir）は `vo-` 名前空間で命名**（`vo-layer0-venture-architect` / `vo-crosscut-council` 等）。理由: DH と VO を**同一プロジェクトに同居**させても衝突しないため（特に `crosscut-council` は DH にも存在＝フラット名だと registry 衝突）。DH は base 名前空間の incumbent（無印）、VO は `vo-` で自己名前空間化（DH 無改修）。`VO:` 会話短縮記法 ⇔ `vo-` 実体接頭辞、が対応。metaskill 帰属は `origin:` frontmatter も併記。
3. **会話・跨ぎ参照では `VO:L0` 短縮記法**。単一 repo 内でも実体名は `vo-` を保持（同居時の安全のため常に付ける）。
4. **DH 側との対称化（任意・将来）**: 完全対称にするなら DH も `dh-` 名前空間 or 両者を Claude Code plugin 化（`venture-os:` `dialog-harness:` 自動名前空間）。ただし DH 改修を伴う（H 案件）。現行は VO 片側 `vo-` で同居衝突を回避（DH 無改修）。

## 責務と番号の対応（早見表）

| 呼称 | 番号 | 理由 |
|---|---|---|
| L0 設計 / L1 実働 / L2 統括 | あり | フラクタルな層責務 |
| Council 判断 | なし | 非フラクタル核（第1条） |
| crosscut-<名> | なし | 横断ヘルパー（層でない） |
