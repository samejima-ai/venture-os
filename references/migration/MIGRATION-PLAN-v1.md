# VO 独立リポジトリ移設プラン v1（C・turnkey 準備）

> 位置づけ: 推奨順 A→C→B の **C**。VO を独立 repo として立ち上げるための turnkey 準備。**2つの人間判断**（継承方式・憲法批准）を決めれば、あとは機械的に実行できる状態にする。
> **スコープ注記**: 実際の新規 repo 作成・git submodule 配線・push は **この ai-gata セッションの権限外**（scope=samejima-ai/ai-gata のみ）。本書は「決めれば実行できる」手順書であり、実行は人間または scope 拡張後の AI が行う。
> 根拠: D1（独立 repo）/ 憲法 第6条 H1（批准）・第9条 L-FROZEN-PHIL・portability contract（layer0 SKILL）。

---

## 移設の唯一のシーム（portability contract の再掲）

`delivery/venture-os/` 配下一式が自己完結の移動単位。**唯一 repo 境界を跨ぐのは DH 9条憲法（本 repo では `.claude/skills/layer0-spec-architect/references/philosophy.md`）への参照**だけ。これが継承方式（下記 判断①）の対象。CANON・build-pack・credit-strategy 等は dir 内に閉じるので移動後も dangling しない。

---

## 2つの人間判断（これだけ決めれば turnkey）

### 判断① philosophy 継承方式（H3/H4）→ 詳細は `INHERITANCE-METHODS.md`

| 方式 | 一行 | 推奨 |
|---|---|---|
| **submodule** | DH repo を submodule 参照し 9条を単一原典で共有 | ◎ 推奨（二重保守ゼロ・改訂追随） |
| package | philosophy を配布物として version 固定 | ○ |
| fork | 分岐時点の 9条を複製 | △（散逸リスク） |

### 判断② 憲法批准（H1・L-FROZEN-PHIL）→ 詳細は `RATIFICATION-CHECKLIST.md`

`PHILOSOPHY-venture-os-draft-v1.md`（V1〜V6・草案）を **正式 `philosophy.md`** に昇格するか。
- (a) **草案のまま立ち上げ → repo で批准**（推奨・可逆）
- (b) 立ち上げ前に批准

---

## 目標リポジトリ構成（venture-os）

```
venture-os/                          # 新独立 repo
├── philosophy.md                    # 批准した VO V1〜V6（上層）＋ 継承 9条への参照（下層・物理形は判断①に依存）
├── INDEX.md / REGIME.md / CLAUDE.md # VO repo 自身の harness scaffold
├── README.md                        # クレジット（Built with dialog-harness sibling）
├── .claude/skills/                  # ← delivery/venture-os/skills/ から移設
│   ├── vo-layer0-venture-architect/      # vo- 名前空間（DH と同居可・CO-RESIDENCE-DESIGN.md）
│   ├── vo-crosscut-council/
│   ├── vo-crosscut-unit-economics/
│   ├── vo-crosscut-bizmodel-selector/
│   └── vo-crosscut-credit-runway/
├── references/                      # ← 共有正典を colocate（下記マップ）
│   ├── bizmodel/                    # pattern-library + CANON
│   ├── credit-strategy.md
│   ├── credit-runway.md
│   ├── two-runway-arbitration.md
│   ├── venture-regime-protocol.md   # build-pack 01
│   ├── output-templates.md          # build-pack 02
│   ├── council-personas.md          # build-pack 03
│   ├── unit-economics-protocol.md   # build-pack 04
│   ├── naming-convention.md         # build-pack 05
│   └── vo-dh-topology.md            # build-pack 06
├── docs/                            # CONCEPTION v1/v2・EXECUTION-ATOZ（設計記録）
└── dialog-harness/                  # ① submodule 選択時のみ（DH repo）
```

---

## 参照 colocation マップ（相対パス書き換え）

移設時、SKILL.md 内の `../../<doc>` 参照を新レイアウトへ書き換える。SKILL は `.claude/skills/<skill>/SKILL.md` にあるため、`references/` へは `../../../references/`。

| 現在（delivery/venture-os/）| 移設後（venture-os/）| SKILL からの参照 |
|---|---|---|
| `PHILOSOPHY-venture-os-draft-v1.md` | `philosophy.md`（批准後） | `../../../philosophy.md` |
| `build-pack/01〜06` | `references/*` | `../../../references/*` |
| `CREDIT-STRATEGY-*` | `references/credit-strategy.md` | `../../../references/credit-strategy.md` |
| `CREDIT-RUNWAY-*` | `references/credit-runway.md` | 〃 |
| `TWO-RUNWAY-ARBITRATION-*` | `references/two-runway-arbitration.md` | 〃 |
| `prototype/bizmodel-pattern-library.md` | `references/bizmodel/pattern-library.md` | `../../../references/bizmodel/pattern-library.md` |
| `CANON-*` | `references/bizmodel/canon.md` | 〃 |
| `CONCEPTION-*` / `EXECUTION-ATOZ-*` | `docs/*` | 設計記録（SKILL からの必須参照でない） |

書き換えは各 SKILL.md の「正典参照」ブロックと本文リンク。`grep -rn '\.\./\.\.' .claude/skills` で全件洗い出し可能。

---

## turnkey 実行手順（決定後・repo 作成権限のある環境で）

```
1. 新 repo venture-os を作成（空）
2. delivery/venture-os/skills/*      → venture-os/.claude/skills/*        （git mv 相当のコピー）
3. build-pack/ credit-* two-runway prototype/pattern-library CANON  → venture-os/references/*
4. CONCEPTION*/EXECUTION-ATOZ*       → venture-os/docs/*
5. ①継承方式を適用（submodule/package/fork・INHERITANCE-METHODS.md）
6. ②批准: PHILOSOPHY-draft → philosophy.md（RATIFICATION-CHECKLIST.md）
7. 全 SKILL.md の ../../ 参照を colocation マップで書き換え
8. VO repo 自身の scaffold（INDEX/REGIME/CLAUDE/README・クレジット）生成
9. smoke: 各 SKILL の参照 broken-link 検査（grep + ファイル存在）／VO:L0 を机上1周
```

---

## smoke 検査（移設完了判定）

- [ ] 全 SKILL.md の参照が新レイアウトで実在（broken link ゼロ）
- [ ] philosophy.md が (1) VO V1〜V6 を含み批准済み（②）かつ (2) 継承 9条への参照が解決可能（①の方式のパスが resolvable）
- [ ] `.claude/skills/` に5スキル（L0＋crosscut4）が揃う
- [ ] VO:L0 を design_only で机上1周（テーゼ→信用戦略→BM→算数→信用runway設計→献上）
- [ ] ai-gata repo からの独立性（delivery/venture-os/ への依存ゼロ）

---

## 一行

**移動単位は `delivery/venture-os/` 一式、唯一のシームは philosophy 継承。①継承方式と②批准の2つを人間が決めれば、本書の手順で機械的に独立 repo が立ち上がる（実 repo 作成は本セッション権限外）。**
