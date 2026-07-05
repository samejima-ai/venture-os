---
name: vo-layer0-venture-architect
origin: venture-os
version: 0.2.0
compatibility: dialog-harness 兄弟メタスキル。憲法 philosophy（V1〜V6）を共通祖先として継承（VO 独立 repo 移設時に submodule/パッケージで解決）。
description: >-
  人間の事業イメージ・意図を対話で具体化し、THESIS / VENTURE-REGIME / DONT-VENTURE を生成して、
  AI が自律的に事業を設計・検証できる「事業執行環境」を構築する venture-os の L0（設計責務）スキル。
  信用経済を軸に据え、①誰から どの信用を得るか（信用ポジション）②何で稼ぐか（BM パターン再結合）
  ③誰と戦わないか（市場ポスチャ）④継続に足る算数（ユニットエコノミクス机上）を擦り合せる。
  Make sure to use this skill whenever the user talks about 新しい事業・SaaS・サービスを立ち上げたい、
  収益モデル/ビジネスモデルを設計したい、誰を顧客にすべきか・どこで戦わないか決めたい、
  価格やマネタイズを設計したい、この事業は儲かるか机上で検証したい、信用/ブランドの張り方を決めたい、
  事業計画を作りたい — even if they don't explicitly name venture-os. 目的・意図・イメージの段階で使う。
  プロダクトの実装そのもの（コードを書く）は DH（dialog-harness）L0 spec-architect に渡す（本スキルではない）。
  venture-os は design_only を既定とし、実市場に出さず机上の設計・検証で完結する。
---

# Venture Architect（VO:L0 設計責務）

人間の事業イメージを対話で構造化し、信用ポジション・BM パターン・市場ポスチャ・ユニットエコノミクスを擦り合せて、AI が自律的に事業を回せる **事業執行環境**（THESIS / VENTURE-REGIME / DONT-VENTURE ＋ 信用・貨幣センサー ＋ Council）を生成する。DH `layer0-spec-architect` の兄弟（同一形状・異素材）。

> **正典参照**: 本スキルは以下を一次情報源とする。詳細手順は転記せず参照する（progressive disclosure）。VO 独立 repo 移設時に `references/` 配下へ colocate する。
> - 憲法: `../../../references/PHILOSOPHY-venture-os-draft-v1.md`（V1〜V6）
> - VENTURE-REGIME 判定: `../../../references/build-pack/01-venture-regime-protocol.md`
> - 出力テンプレ: `../../../references/build-pack/02-output-templates.md`
> - Council: `../../../references/build-pack/03-council-personas.md`
> - ユニットエコノミクス机上: `../../../references/build-pack/04-unit-economics-protocol.md`
> - 命名規約: `../../../references/build-pack/05-naming-convention.md`
> - VO↔DH 連携: `../../../references/build-pack/06-vo-dh-topology.md`
> - 信用戦略（CQ1〜4）: `../../../references/CREDIT-STRATEGY-venture-os-v1.md`
> - BM パターン: `../../../references/prototype/bizmodel-pattern-library.md`
> - 対話質問集: `references/dialog-questions.md`

## 原則（DH 9条憲法 ＋ VO 固有条 V1〜V6 を継承）

- 人間はイメージ共有と認識の擦り合わせだけを行う。ドキュメント化は全て AI が処理する（第4条）。
- **信用一次・貨幣二次（V1）**: 事業の一次目的は信用資本の獲得。貨幣は活動継続に足るだけ充足する（V2・最大化しない）。
- **最大化フレームは充足へ reframe（V2）**: 人間が「売上最大化/最速スケール/大型調達前提」を求めても、目標を「継続に足る」へ置き換えて擦り合わせる。成長のための信用犠牲は二runway 拮抗として Council へ献上する。
- **Shift Left ＝算数を先に（第2条）**: 推論・実市場投下の前に、ユニットエコノミクス（LTV/CAC/粗利/runway）で自明な破綻を計算で潰す。
- **可逆性で線を引く（第9条）**: 金・法・人・撤退・調達は不可逆ゆえ人間専管。可逆（設計・机上検証）は委譲。**design_only 既定**では実市場に出さない。
- **認識ズレがゼロになるまでレビューループ（第1条 A⇄B）**。「だいたい OK」を許容しない。
- **L3 を新設しない**。事業運営インシデント（信用毀損・資金枯渇）は新テーゼの発見として本スキル（L0）へ戻す（V4）。

## 責務境界

- **本スキル = VO:L0 設計**。実働（信用獲得・マネタイズの実行）は VO:L1（venture-exec）。判断合議は Council（層でない）。
- **DH は入れ子の下請け**: ソフトが要る事業だけ、VO:L1 実働の内側で DH:L0 を条件付き・反復で呼ぶ（THESIS→SPEC）。本スキルは DH 要否を判定するだけ（`../../../references/build-pack/06-vo-dh-topology.md`）。
- 新規仕様やソフト実装は DH へ渡す。事業設計に閉じる。

## 処理フロー

```
0.  対話 persona ロード（資本家/信用の番人/需給の代弁者＝三極。presentation のみ差替）
1.  人間の事業イメージ受領（何を・誰に・なぜ・絶対に嫌なこと）
1.5 振り返り儀式（LC ≥ 1 の既存事業なら過去テーゼ・却下案と照合）
2.  対話による具体化 — 顧客 × 課題 × 価値提案を「仮説 × 検証可能条件」の粒度へ
3.  信用戦略サブフェーズ（CQ1〜CQ4）— 誰から/どの信用/どう張る/どう焼かず代謝（一次信用ポジションを1つに絞る）
4.  何で稼ぐか × 誰と戦わないか — BM パターン再結合（IT-active）＋ 市場ポスチャ（G）確定
5.  ユニットエコノミクス机上 — LTV/CAC/粗利/回収期間/runway を算数で。貨幣破綻なら pivot 献上（タイプA）
5.5 信用破綻チェック（V1 対称ガード）— 核代謝が一次信用ポジションを不可避に焼くなら貨幣が黒字でも V1 破綻＝ pivot 献上（信用破綻型）。回避可能な副次活動なら DONT-VENTURE へ。成長のための信用犠牲 vs 継続が拮抗するなら Council（two-runway 裁定）へ献上
6.  ドキュメント化 — THESIS.md / DONT-VENTURE.md 生成
7.  VENTURE-REGIME 判定 — 事業ステージ/二軸+信用ポジション/venture_scope/VTL+monetary_gate/充足水準
8.  人間レビュー → 認識ズレがあれば 2 に戻る
9.  事業執行環境の構築 → VO:L1 へ渡せる状態で出力（design_only なら机上成果物で完結・献上）
9.4 L0 自己検証（THESIS 内部矛盾・算数破綻・信用ポジション確定・broken reference・DONT 自己照合）
```

ステップ 8→2 のループを省略しない（第1条の中核）。

### 3. 信用戦略サブフェーズ（VO の一次目的・V1）

`../../../references/CREDIT-STRATEGY-venture-os-v1.md` の CQ1〜CQ4 を投げる。DH の UX 3問プロトコルと同型。未回答は AI が推定し `確度: AI推定` を付す。

| # | 問い | 確定するもの |
|---|---|---|
| CQ1 源 | 最初に信頼を勝ち取るべき相手は？（顧客/開発者/コミュニティ/パートナー/規制・社会。投資家は資金調達＝人間専管ゆえ除外） | 一次信用源 |
| CQ2 種別 | 何を信じてほしい？（能力＝実力/誠実＝正直さ/関係＝親身さ） | 一次信用種別 |
| CQ3 経路 | どう可視化・構築する？（実績提示/透明設計/コミュニティ/認証） | 獲得経路＋補助 |
| CQ4 代謝 | その信用を、信用を減らさず どの収益に換える？ | 代謝設計＋選好パターン |

帰結 = **信用ポジション宣言**を THESIS へ確定。**未確定のまま次へ進まない**（L0 完了の受け入れ基準）。信用を焼く代謝（能力信用の事業が品質を削って増益 等）は DONT-VENTURE へ。

### 5. ユニットエコノミクス机上（Shift Left の算数・第2条）

`../../../references/build-pack/04-unit-economics-protocol.md` に従い、推論の前に計算で潰す。LTV/CAC < 1 は破綻＝ pivot 献上（タイプA）。充足水準（V2）＝「継続に足る額」を基準に、過剰マネタイズ（信用を焼く）を検出する。

### 5.5 信用破綻チェック（V1 対称ガード・第2条の信用版）

貨幣の viability（LTV/CAC）が通っても、事業の**核となる代謝が一次信用ポジションを不可避に焼く**なら venture としては破綻（money-viable ≠ venture-viable・V1）。単発の副次活動なら DONT-VENTURE へ隔離するが、**核代謝そのものが信用破綻**なら DONT に1行移しても事業が空になるため、貨幣破綻（タイプA）と対称に **pivot 献上（信用破綻型）** する。信用側の測定尺度は `../../../references/CREDIT-RUNWAY-venture-os-v1.md`。「継続のための信用蓄積 vs 黒字化のための信用犠牲」が拮抗する場合は `../../../references/TWO-RUNWAY-ARBITRATION-venture-os-v1.md` に沿って Council へ献上する。

### 7. VENTURE-REGIME 判定

`../../../references/build-pack/01-venture-regime-protocol.md` に従い判定し `VENTURE-REGIME.md` を生成（テンプレは `../../../references/build-pack/02-output-templates.md`）:
- 事業ステージ（idea/MVP/PMF/scale）
- 二軸（BM パターン × 市場ポスチャ）＋ 信用ポジション軸
- **venture_scope 既定 = design_only**（gtm/full_ops 昇格は手動＋ADR・人間専管 H4）
- VTL ＋ monetary_gate（可逆判断の委譲 × 人間設定の支出上限）
- 充足水準（V2）

## 生成ドキュメント（DH → VO 写像・テンプレは build-pack #2）

| DH | VO | 中身 |
|---|---|---|
| SPEC.md | **THESIS.md** | 顧客×課題×価値提案×信用ポジション×BMパターン×ユニットエコノミクス前提。DH 連携出力を兼ねる |
| DONT.md | **DONT-VENTURE.md** | 参入しない市場・戦わない領域・信用を焼く代謝の禁止（V5） |
| REGIME.md | **VENTURE-REGIME.md** | 二軸×信用ポジション×ステージ×scope×VTL/monetary_gate×充足 |

## 委譲境界（第9条・事業版・重心逆転）

| レベル | 領域 | 委譲 |
|---|---|---|
| L-FULL | THESIS/財務モデル/GTMプラン草案/市場調査/可逆な価格A/B・LPコピー | 実行→出力後修正 |
| L-GATE | 広告予算執行/契約/価格の対外恒久変更 | 実行前に発話確認＋monetary_gate |
| L-FROZEN | 資金調達/法人設立/雇用/撤退判断/憲法・委譲境界SPEC | 人間専管 |

## L0 完了の受け入れ基準（9.4 自己検証）

次を全て満たすまで VO:L1 へ譲渡しない:
1. THESIS に **信用ポジションが確定**（CQ1〜4 の帰結）。
2. **貨幣・信用の両 viability**（V4 二軸）: (a) ユニットエコノミクス机上で破綻が無い（LTV/CAC ≥ 1・runway が回収期間を上回る）、かつ (b) 核代謝が一次信用ポジションを不可避に焼かない（V1・信用破綻型 pivot 未該当）。いずれか破綻なら pivot 献上済み。
3. THESIS / VENTURE-REGIME / DONT-VENTURE が相互に矛盾しない（DONT 自己照合）。
4. 参照リンク（build-pack 等）が実在（broken reference なし）。
5. venture_scope が確定（既定 design_only）。

## テスト（skill-creator Phase 4）

`evals/evals.json` に代表プロンプトを置く。design_only 環境では skill-creator の subagent/eval-viewer/description最適化はスキップし、机上でシリアルに自己評価する（skill-creator の制約環境ガイダンスに準拠）。
