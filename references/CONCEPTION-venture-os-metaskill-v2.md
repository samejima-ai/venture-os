# venture-os メタスキル 考案 v2 ── 5決定の確定と初期建付け

> ステータス: **考案確定版（§9 の5フォーク全て人間合意済み・2026-07-05）**
> 前身: `CONCEPTION-venture-os-metaskill-v1.md`（v2 が上書き。写像表・9条翻訳・検証スタック等の骨格は v1 を正とし本書で再掲しない ── v1 を併読）
> 正典入力: `CANON-bizmodel-encyclopedia-expansion-27.md`（66パターン）
> 参照原典: `.claude/skills/layer0-spec-architect/references/philosophy.md`（DH 9条憲法）
> 初期建付け: `prototype/layer0-venture-architect.SKILL.md` / `prototype/bizmodel-pattern-library.md`

v1 で提示した5つのオープン設計課題（§9）が全て人間合意に達した。本書は確定した5決定を記録し、その帰結を設計へ畳み込み、§10 ロードマップの最初の建付け2点（VO の L0 SKILL 骨格・BM パターンライブラリ分類データ）を伴走する。

---

## 1. 確定した5決定（2026-07-05・人間合意）

| # | フォーク | 決定 | 確度 |
|---|---|---|---|
| D1 | DH との統合形態 | **相乗り連携前提＋独立リポジトリ**（共通祖先からの分岐・二重保守回避・VO 単体でも汎用事業FWとして自己完結） | 人間確定 |
| D2 | venture_scope 初期到達点 | **design_only 既定**（机上の設計・検証まで・可逆。金を出す責務は人間専管 H4） | 人間確定 |
| D3 | 大辞典の凍結範囲 | **IT 関連に絞る。物理インスタンスは参照凍結・デジタル再来を持つ抽象パターンは active** | 人間確定 |
| D4 | 新軸 G の採否 | **REGIME 正式軸に昇格。ただし軸の値を消費財語彙→IT 市場ポスチャ語彙に翻訳** | 人間確定 |
| D5 | VTL 閾値設計 | **CTL 機構を移植（可逆判断サブセットにのみ適用）＋ `monetary_gate`（人間設定の支出上限）を直交に1本** | 人間確定 |

---

## 2. D1 の帰結 ── 独立リポジトリ × 相乗り連携のアーキテクチャ

VO は DH の**設計形状を継承しつつ独立 repo として自己完結**する。「相乗り」は同一 repo での skill 共有ではなく、**共通祖先（DH 9条憲法）からの分岐と、規格化された契約による連携**を意味する。

```
                 philosophy.md（9条憲法・共通祖先）
                  /                              \
        DH（dialog-harness）               VO（venture-os）
        素材=コード                         素材=事業
        repo: dialog-harness               repo: venture-os（独立）
        Council/crosscut を自前保有         Council/crosscut を同型移植で自前保有
                  \                              /
                   ＼── 規格化された契約で連携 ──／
                   VO の THESIS.md → DH の SPEC.md 入力（事業→ソフト実装の橋）
```

### 連携契約（第3条 情報純度の入出力規格）

- **VO → DH**: VO が design_only で確定した `THESIS.md`（顧客×課題×価値提案×BMパターン×ユニットエコノミクス前提）を、DH の L0（spec-architect）の入力アセットとして渡す。事業テーゼが「作るべきソフトの WHY 層」を供給する。
- **DH → VO**: DH が生成したプロダクトの計算可能代理指標（CVR・完了率・レイテンシ等）を、VO の市場検証スタック（第2〜3層）のセンサー入力に還す。
- **単体動作の保証**: DH 無し（連携なし）でも VO は design_only で完全動作する ── 事業設計・検証（机上）だけで価値を出せる。DH が「GitHub 無しでも完全動作」を原則とするのと同型。

### 二重保守の回避

Council・crosscut・philosophy を「DH からコピー」するのではなく、**共通祖先からの分岐**として管理する。将来 philosophy.md を共有 submodule / パッケージ化する余地を残す（本考案では方針記録に留め、実装は VO repo 立ち上げ時に決定）。第6条・第9条の**憲法自己改訂禁止は両 repo で継承**され、VO も自らの委譲境界 SPEC を自ら改訂できない。

---

## 3. D3 の帰結 ── IT-active / physical-frozen の判定原則

判定軸は「カテゴリ（A〜G）」ではなく **「価値論理がデジタル経済性で成立するか」**（複製限界費用ゼロ・在庫レス・地理制約レス）。物理由来パターンでも**デジタル再来を持つ抽象は active 側に再来形で収録**し、**物理インスタンスのみ凍結**する。

| 区分 | 定義 | L0 選択メニュー |
|---|---|---|
| **IT-active** | デジタル価値論理を持つ／物理由来でもデジタル再来を持つ抽象パターン | 選択対象 |
| **physical-frozen** | 物理ロジスティクス・実在庫・逆物流・実店舗立地が価値の核で、デジタル再来を持たない物理インスタンス | 参照凍結（選択非対象・思想は温存） |

**再来の扱い（重要）**: 「可用性保証」は物理保守としては凍結だが SLA/SaaS 稼働保証としては active。「セルフサービス」は物理セルフGSとしては凍結だが PLG セルフサーブ・オンボーディング自動化としては active。「スーパーマーケット」は物理量販としては凍結だが everything-store/マーケットプレイスとしては active。**同一抽象パターンの物理面を凍結し、デジタル再来面を active に置く**という二面管理を行う。

分類データは `prototype/bizmodel-pattern-library.md` に格納した（本書 §7 に要約）。**カバレッジは拡張編66＋被参照基幹分**で、基幹35の完全な逐語分類は辞典本体（本 repo 未収録）取得後に確定する（同ファイルの正典カバレッジ注記を参照）。

---

## 4. D4 の帰結 ── 市場ポスチャ軸（G）を VENTURE-REGIME の正式軸に

VO の VENTURE-REGIME 判定は、**「何で稼ぐか」（BM パターン選択・A〜F）とは直交に、「誰を選び誰と戦わないか」（市場ポスチャ軸・G）を第一級軸**として持つ。根拠は第2条 Shift Left ── 市場選択は最も不可逆で最も上流の戦略決定であり、DH が ARC/モードを L0 で固めるのと同じ位置に置く。

### 大辞典 G パターン → IT 市場ポスチャ類型への翻訳

大辞典の消費財寄り G パターンは**思想として温存**し、IT ポスチャ類型に写像する：

| 大辞典 G パターン（思想） | IT 市場ポスチャ類型（軸の値） |
|---|---|
| No Frills（機能削減で最下層独占） | セルフサーブ・PLG 最小機能無料〜低価格（開発者/個人の下層を独占） |
| Ultimate Luxury（排他性・少数高単価） | エンタープライズ専任・高 ACV・少数アカウント（招待/商談ゲート） |
| Aikido（競争軸の反転） | アンバンドリング/逆張り（支配的 SaaS の過剰機能を捨て単機能特化） |
| Target the Poor（支払単位・流通の再発明） | 従量マイクロ課金・新興国/未開拓セグメントの単位経済再設計 |
| Reverse Innovation（制約起点設計の還流） | 制約市場（低帯域・モバイルファースト・規制産業）起点で先進市場へ還流 |
| （軸の既定値） | mainstream horizontal / vertical SaaS |

### 軸の直交運用

VENTURE-REGIME.md は各事業を **「BM パターン（何で稼ぐか・A〜F の再結合）」×「市場ポスチャ（誰と戦わないか・G 類型）」** の二軸で記述する。St. Gallen の Who/What/How/Value タグは各パターンに併記する影響次元として保持（v1 §2 の二軸分類を継承）。

---

## 5. D5 の帰結 ── VTL ＋ monetary_gate の二機構

コードでは1つに畳めていた「AI の判断は信頼できるか（学習可）」と「この行為は安全な支出内か（人間設定）」を、事業では**分離**する。

### VTL（Venture Trust Level）── CTL 機構の移植

- CTL の決定論算出（total 件数・カテゴリ別 count・agreement_rate → 委譲範囲）を**そのまま移植**。
- ただし**可逆な事業判断サブセットにのみ適用**（どのパターンを推奨するか・どの市場テストを設計するか・LP コピー・可逆な価格 A/B 等）。
- **不可逆行為（支出・法務・雇用・撤退）は VTL がいくら登っても自律化しない**（第9条により L-GATE / 人間専管に固定）。

### monetary_gate（人間設定の支出上限 envelope）── VTL と直交

- 1行為あたり／期間あたりの支出上限を**人間が予算枠として設定**（信頼学習の対象外＝第8条「採用判断は AI 禁止」・第9条「不可逆」）。
- 実行可否 ＝ **「VTL が可逆判断を許可」AND「monetary_gate 内」**。
- 例: `¥1,000` の広告テストは VTL 内で自律 / `¥1,000,000` の広告投下は monetary_gate 超過で人間承認。

### VENTURE-REGIME.md への記録項目（追加）

```
## Venture Trust Level
- vtl: VTL-0                     # CTL 同型・コールドスタート
- delegation_scope: []           # 可逆判断のうち自律可のカテゴリ
- monetary_gate:
    per_action: 0                # 1行為あたり支出上限（¥・人間設定・既定0=全件承認）
    per_period: 0                # 期間あたり支出上限
    period: monthly
- irreversible_frozen: [spend, legal, hiring, exit]  # VTL 非依存で常時 L-GATE/人間専管
```

design_only（D2）では monetary_gate が実質意味を持たない（支出が発生しない）。gtm_execution 昇格時に初めて予算枠が効く。

---

## 6. 更新後の VENTURE-REGIME 二軸 × 段階スコープの全体像

```
VENTURE-REGIME（VO の L0 が確定）
├── 市場ポスチャ軸（G・第一級）      … 誰を選び誰と戦わないか（No Frills系/Luxury系/Aikido系/…）
├── BM パターン軸（A〜F・再結合）    … 何で稼ぐか（IT-active ライブラリからの選択・再結合）
│     └ 各パターンに Who/What/How/Value タグ併記（影響次元）
├── 事業ステージ（規模×不確実性×リスク） … idea / MVP / PMF / scale（DH の S/U/R 写像）
├── venture_scope                   … design_only（既定）/ gtm_execution / full_ops
└── VTL ＋ monetary_gate            … 可逆判断の委譲度（学習）× 支出上限（人間設定）
```

---

## 7. 初期建付け（本 PR 同梱・prototype/）

D1 で VO は独立 repo と決まったため、ai-gata の稼働 harness（`.claude/skills/`）は汚さず、**プロトタイプは `delivery/venture-os/prototype/` に隔離**する。VO repo 立ち上げ時に移設する種。

### 7.1 `prototype/layer0-venture-architect.SKILL.md`

DH `layer0-spec-architect` の処理フローを写経し、以下を差し替えた VO の L0 SKILL 骨格：
- ARC パターン選択 → **BM パターン選択（IT-active ライブラリ）＋市場ポスチャ軸確定**
- REGIME 判定（S/U/R/N）→ **VENTURE-REGIME 判定（二軸＋事業ステージ＋venture_scope＋VTL/monetary_gate）**
- SPEC.md 生成 → **THESIS.md 生成**（DH への連携契約出力を兼ねる）
- 5層検出スタック参照 → **5層事業検証スタック**（v1 §5）

### 7.2 `prototype/bizmodel-pattern-library.md`

パターンを **IT-active / physical-frozen / dual-face** に分類し、各 active パターンに A〜G カテゴリ・Who/What/How/Value タグ・（G は）市場ポスチャ類型を付した選択可能データ。**カバレッジは拡張編66＋被参照基幹分**（基幹35の完全分類は辞典本体取得後に確定・タグの一部は AI 推定 `~`）。DH の `references/arc-patterns/` 3ファイルと同じ位置づけ（`crosscut-bizmodel-selector` の参照データ源）。分類サマリ：

- **IT-active**: A 課金系（サブスク/従量/フリーミアム/PWYW/Hidden Revenue/Barterのデータ交換面/Revenue Sharing）、B（P2P/マーケットプレイス/ロングテール/クラウドソーシング）、C（Affiliation/ライセンシング/D2C）、D（レイヤープレイヤー/Make More of It〔AWS〕/Virtualisation/Sensor aaS の一部）、E（User Design/Digitization/Cross-Sell/Customer Loyalty/データ収益化）、II（Object Self-Service/Object-as-PoS/Prosumer）、III（AI課金/Agent課金/PLG/API-as-Product/埋め込み型金融/データ協同組合）
- **physical-frozen**（思想温存・選択非対象）: 物々交換の物理在庫面、Shop-in-Shop 物理店舗、成分ブランディング物理部材、部分所有〔ジェット/別荘〕、Trash-to-Cash 逆物流、From Push to Pull 製造、Target the Poor 物理流通、Reverse Innovation 物理製品
- **二面管理（物理凍結／デジタル再来 active）**: 可用性保証（保守×/SLA○）、セルフサービス（GS×/PLG○）、スーパーマーケット（量販×/marketplace○）、体験販売（実店舗×/デジタル体験○）

---

## 8. 次の一歩（v2 以降）

1. **VO 独立 repo の立ち上げ**（D1）── philosophy 継承方式（submodule/パッケージ/フォーク）の確定は repo 立ち上げ時の人間判断（H3/H4）。
2. `prototype/` の2成果物を VO repo の `.claude/skills/layer0-venture-architect/` と `references/bizmodel/` へ移設。
3. `crosscut-unit-economics`（第1層計算的の事業版・LTV/CAC/粗利/runway の決定論検出）の実装。
4. `crosscut-market-smoke`（第2層・LP/広告 deploy＝autonomous-drive 相当。gtm_execution 昇格時に有効化）。
5. Council ペルソナ（investor / founder / skeptic-customer）の persona 定義。

DH の版管理規律（major=形状破壊 / minor=後方互換の追加）を継承する。

---

## 付録: v1 からの差分サマリ

- v1: 兄弟関係の定立・DH→VO 全写像・9条翻訳・5層検証スタック・献上4タイプ・venture_scope・スキル配置案・**5フォーク提示（未決）**。
- v2: **5フォーク確定**（D1〜D5）＋その帰結の設計畳み込み（独立repo連携／IT-active分類原則／市場ポスチャ軸昇格／VTL+monetary_gate）＋**初期建付け2種の実体**（L0 SKILL 骨格・パターンライブラリ分類データ）。
- 不変: 9条憲法の継承、L3 非新設、Council 同型、凍結境界、憲法自己改訂禁止。
