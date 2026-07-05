# philosophy 継承方式 3案（判断①・H3/H4）

> VO 独立 repo が DH 9条憲法（`philosophy.md`）を継承する方式。移設の唯一の repo 境界シーム（`MIGRATION-PLAN-v1.md`）。
> VO 憲法は「継承した DH 9条 ＋ 批准した VO V1〜V6」の二層（前文で明示）。本書は**下層（DH 9条）の取り込み方**を扱う。

## 3案

### (a) submodule ── 推奨

DH repo を VO repo の submodule として参照し、9条を**単一原典で共有**する。

```
venture-os/
├── dialog-harness/                       # git submodule → DH repo（pinned SHA）
│   └── .claude/skills/layer0-spec-architect/references/philosophy.md  # 9条の単一原典（DH repo 内の実パス）
└── philosophy.md                         # VO V1〜V6 + 「9条は dialog-harness/.../philosophy.md を継承」
```

- **長所**: 二重保守ゼロ。DH 9条の改訂が pinned SHA 更新で追随可能。原典が1つ（第6条 憲法自己改訂禁止の趣旨＝散逸回避に最適）。
- **短所**: submodule 運用の手間（clone 時 `--recursive`・SHA 更新）。
- **setup**:
  ```
  git submodule add <DH-repo-url> dialog-harness
  git -C dialog-harness checkout <pinned-sha>
  # philosophy.md 前文に継承元パスを明記
  ```

### (b) package

philosophy を配布物（npm/pip/git tag のいずれか）として **version 固定**で取り込む。

- **長所**: version が明快。依存として宣言的。
- **短所**: 配布基盤の用意が要る。9条を配布可能な形にパッケージ化する初期コスト。
- **適する場合**: DH 側が既に philosophy を配布している / 複数の兄弟メタスキル（VO 以外）が増える見込み。

### (c) fork

分岐時点の DH 9条を VO repo に**複製**する。

- **長所**: 完全独立・即動く・submodule 不要。
- **短所**: DH 9条の改訂が追随せず**散逸リスク**（兄弟間で憲法がズレる）。第6条「憲法自己改訂禁止」の趣旨（原典1つ）と緊張。
- **緩和**: 複製した 9条ファイル冒頭に「これは DH <SHA> の複製・改訂は DH 側で」と明記し、VO 側で編集しない規律を敷く。

## 推奨

**(a) submodule**。理由:
- 9条の原典を1つに保ち、兄弟メタスキル間の憲法ズレ（散逸）を防ぐ（第6条の趣旨）。
- pinned SHA で「どの版の 9条に準拠しているか」が明示され、追随も制御可能。
- 二重保守を避ける（D1 の「共通祖先からの分岐・二重保守回避」に最も忠実）。

## いずれの案でも不変

- VO 憲法は二層（継承 9条 ＋ VO V1〜V6）。
- **9条（下層）は VO 側で改訂しない**（第6条 憲法自己改訂禁止・L-FROZEN-META）。VO が触れるのは V1〜V6（上層）のみ、それも批准後は L-FROZEN-PHIL。
- 継承方式の変更自体が H3/H4（根本設計）。
