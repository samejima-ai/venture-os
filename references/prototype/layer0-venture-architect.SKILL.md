---
name: layer0-venture-architect
origin: venture-os
version: 0.1.0-prototype
dimension: D4
status: prototype（delivery/venture-os/prototype/ に隔離。VO 独立 repo 立ち上げ時に .claude/skills/ へ移設）
description: >
  人間の事業イメージ・意図を対話で具体化し、THESIS / DONT-VENTURE / VENTURE-REGIME 等の
  事業仕様ドキュメント群を生成、事業ステージ（idea/MVP/PMF/scale）と venture_scope
  （design_only/gtm_execution/full_ops）を判定し、AI が自律的に事業を設計・検証できる
  環境一式を構築する VO の L0 スキル。DH layer0-spec-architect の兄弟（同一形状・異素材）。
  「新しい SaaS を始めたい、まだイメージだけ」「この事業の収益モデルを設計したい」
  「誰を顧客にすべきか・どこで戦わないか決めたい」「ユニットエコノミクスが成立するか机上検証したい」
  等、事業の目的・意図段階の対話と事業仕様策定で起動する。
  具体的なプロダクト実装（→ DH layer0-spec-architect / autonomous-dev）との混同を避ける。
  VO は design_only を既定とし、実市場に出さず机上の設計・検証で完結する。
---

# Venture Architect（VO L0・prototype）

人間の事業イメージをドキュメント化し、BM パターンと市場ポスチャを選択し、事業ステージ・
venture_scope を判定して AI 自律事業設計環境を構築するスキル。DH `layer0-spec-architect`
の写経＋事業素材への差し替え。

## 原則（DH philosophy.md 9条を継承）

- 人間はイメージ共有と認識の擦り合わせだけを行う。ドキュメント化は全て AI が処理する（第4条）
- 仕様（事業テーゼ）は成長するもの。完全な事前定義を目指さない
- 認識のズレがゼロになるまでレビューループを回す（第1条 A⇄B ループ）
- **Shift Left（第2条）＝算数を先に**: 推論・実市場投下の前に、ユニットエコノミクス（TAM/CAC/LTV/粗利）で
  自明な破綻を計算で潰す。「E2E の前に Console 根絶」＝「顧客インタビューの前に財務モデルの破綻を根絶」
- **可逆性で線を引く（第9条）**: 金・法・人・撤退は不可逆ゆえ VTL 非依存で人間専管。可逆（設計・机上検証・
  可逆な A/B）は委譲。design_only 既定では実市場に出さない
- L3（恒常運用層）を新設しない（第1条）。事業運営インシデントは「新テーゼの発見」として L0 対話に戻す

## 処理フロー（DH spec-architect フローの写経）

```
0. 対話 persona ロード（investor/founder/skeptic-customer。presentation のみ差替）
1. 人間の事業イメージ受領（何を・誰に・なぜ・絶対に嫌なこと）
1.5. 振り返り儀式（LC 判定。既存事業なら過去テーゼ・却下案と照合）
2. 対話による具体化（顧客×課題×価値提案を「仮説×検証可能条件」の粒度へ）
   並行して VENTURE-REGIME 判定情報を取得（事業ステージ・リスク・不可逆コスト）
2.5. ユニットエコノミクス 3問（目標粗利率・許容 CAC・LTV 前提）→ THESIS の算数基盤
2.6. 市場テスト oracle 言語化（「これが立証されねば世に出せない」核仮説を相 B 検証母集団へ）
3. ドキュメント化（THESIS / DONT-VENTURE / VENTURE-REGIME）
3.5. BM パターン選択・再結合（IT-active ライブラリから。現状=prototype/bizmodel-pattern-library.md／VO repo 移設後=references/bizmodel/）
3.6. 市場ポスチャ軸（G）確定（No Frills系/Luxury系/Aikido系/… 誰と戦わないか）
4. VENTURE-REGIME 判定（二軸＋事業ステージ＋venture_scope＋VTL/monetary_gate）
5. 人間レビュー → 認識ズレがあれば 2 に戻る（「だいたいOK」を許容しない）
6. 認識ズレなし → venture_scope に応じた事業設計環境の構築
7. 環境一式を L1（venture-exec）へ渡せる状態で出力／design_only なら机上成果物で完結
7.4. L0 自己検証（THESIS 内部矛盾・算数破綻・DONT 自己照合・broken reference）
```

ステップ 5→2 のループを省略しない（第1条の中核）。

## 生成ドキュメント（DH → VO 写像）

| DH | VO | 中身 |
|---|---|---|
| SPEC.md | **THESIS.md** | 顧客×課題×価値提案×BMパターン×市場ポスチャ×ユニットエコノミクス前提。DH への連携出力を兼ねる |
| DONT.md | **DONT-VENTURE.md** | 参入しない市場・やらない事業・戦わない領域（Aikido 的明示） |
| REGIME.md | **VENTURE-REGIME.md** | 二軸×事業ステージ×venture_scope×VTL/monetary_gate |
| DESIGN.md | （gtm 時のみ）LP/クリエイティブ視覚仕様 | gtm_execution 昇格時に生成 |

## モード判定（DH の S/U/R → 事業ステージ）

| 事業ステージ | 目安 | 構成 |
|---|---|---|
| idea | テーゼ未検証・机上のみ | design_only 固定・L1 単体 |
| MVP | 最小検証対象が定義済み | design_only〜gtm_execution |
| PMF | 市場適合探索中 | gtm_execution ＋独立市場検証者 |
| scale | 適合済み・拡大 | full_ops（多ワークストリームなら L2 統括） |

## venture_scope（DH dev_mode の写像・既定 design_only）

| venture_scope | 出力 | 外部露出 | 人間関与 |
|---|---|---|---|
| **design_only**（既定） | THESIS＋BM設計＋財務モデル＋GTMプラン（紙まで・可逆） | なし | L0 承認のみ |
| gtm_execution | ＋LP公開・小額広告・価格A/B・MVP定義 | 小（monetary_gate 付き） | 予算 GO＋P4 監視 |
| full_ops | ＋継続運営・自律実験・指標監視 | 大 | P1〜P4＋不可逆ゲート |

昇格・降格は手動＋ADR 記録必須（金を出す責務は人間専管 H4）。

## 委譲境界（第9条・事業版・重心逆転）

| レベル | 領域 | 委譲 |
|---|---|---|
| L-FULL | THESIS/財務モデル/GTMプラン草案/市場調査/可逆な価格A/B・LPコピー | 実行→出力後修正 |
| L-GATE | 広告予算執行/契約/価格の対外恒久変更 | 実行前に発話確認＋monetary_gate |
| L-FROZEN | 資金調達/法人設立/雇用/撤退判断/憲法・委譲境界SPEC | 人間専管 |

## 参照（現状パス ↔ VO repo 移設後パス）

| 対象 | 現状（本 repo・prototype） | VO repo 移設後 |
|---|---|---|
| 憲法（DH 9条・共通祖先） | `.claude/skills/layer0-spec-architect/references/philosophy.md` | `references/philosophy.md`（submodule/パッケージ/フォークで継承・D1） |
| パターンライブラリ | `prototype/bizmodel-pattern-library.md` | `references/bizmodel/` |
| 考案 | `delivery/venture-os/CONCEPTION-venture-os-metaskill-v2.md` | `docs/CONCEPTION.md` 等 |
| 5層事業検証スタック | 考案 v1 §5 | 同上（移設） |

## 独立リポジトリ移設契約（portability contract・D1）

本 prototype は「後から VO だけを独立 repo に切り出せる」ことを設計要件とする。

- **移動単位**: `delivery/venture-os/` 配下一式が自己完結の移動単位（`git mv` で丸ごと移せる）。VO の成果物は ai-gata の稼働 harness（`.claude/skills/`）・プロダクトコードに一切書き込まない（一方向・非干渉）。
- **唯一の外部シーム**: DH の `philosophy.md`（9条憲法）への参照だけが repo 境界を跨ぐ。これは D1 の「共通祖先からの分岐」の実体であり、移設時に **submodule / パッケージ / フォーク** のいずれかで継承を解決する（方式確定は repo 立ち上げ時の人間判断 H3/H4）。それ以外の参照は `delivery/venture-os/` 内で閉じる。
- **CANON の自己完結**: 正典（大辞典）は外部参照でなく `delivery/venture-os/` 内にコピー済みゆえ、移動後も dangling しない。

> **prototype 注記**: 本ファイルは骨格。各ステップの reference 群（dialog-questions / regime-assessment の
> 事業版・unit-economics 対話・market-test-oracle 等）は VO repo 立ち上げ時に DH spec-architect の
> references を写経して整備する。DH の版管理規律（major=形状破壊/minor=後方互換追加）を継承。
