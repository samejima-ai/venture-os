# VO ビルド準備パック ── skill-creator 投入前の必須材料

> 目的: venture-os（design_only スライス）を `/skill-creator` で構築できる状態にするための必須材料を揃える。
> スコープ判断: 初回ビルドは **design_only**（憲法 D2 既定・自己完結）に絞る。L1 実働の gtm/ops 面・②③測定裁定は段階解放で後続ビルド（憲法 V4・段階スコープ）。

## パック構成（本ディレクトリ）

| # | ファイル | 埋める必須点 |
|---|---|---|
| 01 | `01-venture-regime-protocol.md` | VENTURE-REGIME 判定（ステージ/二軸/scope/VTL/monetary_gate/充足） |
| 02 | `02-output-templates.md` | L0 出力3種（THESIS / VENTURE-REGIME / DONT-VENTURE）雛形 |
| 03 | `03-council-personas.md` | Council ペルソナ（投資家/創業者/懐疑的顧客）＋VTL算出 |
| 04 | `04-unit-economics-protocol.md` | ユニットエコノミクス机上（Shift Left の算数） |
| 05 | `05-naming-convention.md` | DH/VO 接頭語・責務呼称の規約 |
| 06 | `06-vo-dh-topology.md` | VO↔DH 二重入れ子ループ連携契約 |

既存（本パック外・確定済み）: 憲法 `PHILOSOPHY-*`（V1〜V6）/ `CONCEPTION-*-v2`（5決定）/ `CREDIT-STRATEGY-*`（信用戦略・CQ1〜4）/ `EXECUTION-ATOZ-*`（GAP マップ）/ `prototype/layer0-venture-architect.SKILL.md`（L0骨格）/ `prototype/bizmodel-pattern-library.md`（IT-active分類）。

## skill-creator 投入readiness（design_only スライス）

| 構成要素 | 投入可否 | 材料 |
|---|---|---|
| **VO-L0 venture-architect** | ✅ 投入可 | SKILL骨格＋#01判定＋#02テンプレ＋credit-strategy＋#04算数＋pattern-library |
| **Council（VO）** | ✅ 投入可 | #03（DH機構継承＋3ペルソナ＋VTL） |
| **crosscut-bizmodel-selector** | 🟡 データ可・selector薄 | pattern-library（基幹35は後続） |
| **crosscut-unit-economics** | ✅ 投入可 | #04 |
| **VO-L1 venture-exec** | ⏸ 後続（gtm/ops） | 概念のみ（design_only では机上に閉じる） |
| **crosscut-market-smoke** | ⏸ 後続（gtm） | — |
| **信用runway測定#2 / 二runway裁定#3** | ⏸ 後続 | credit-strategy §9 が対象定義済み |

→ **design_only の VO（L0＋Council＋設計系 crosscut）は skill-creator に投入できる状態**。L1 以降は段階解放で後続。

## 唯一の人間ゲート項目（H1・あなたの判断）

**憲法のステータス**: `PHILOSOPHY-venture-os-draft-v1.md` は現状 **草案**。ビルドの根なので、以下いずれかを人間が選ぶ（第6条 H1・L-FROZEN-PHIL）:

- **(a) 草案のままビルド**（推奨・可逆）: `draft` ステータスを保持したまま skill-creator に投入し、VO repo 立ち上げ時に正式 `philosophy.md`（L-FROZEN-PHIL）へ昇格・批准する。設計は revert 可能なので流速優先。
- **(b) 先に批准**: 今 V1〜V6 を正式憲法として確定してからビルド。

> 推奨は (a)。憲法の正式昇格（自己改訂禁止領域への固定）は VO 独立 repo の立ち上げ（H3/H4）と同期するのが自然で、それまでは草案として可逆に扱う。

## ビルド順（推奨）

1. 本パック確定（本PR）。
2. 憲法ステータス判断（(a)/(b)・人間）。
3. `/skill-creator` で **VO:L0 venture-architect** を生成（本パック#01〜#06＋既存を spec として投入）。
4. 続けて **VO:Council**（#03）→ **crosscut-unit-economics / bizmodel-selector**（#04/pattern-library）。
5. design_only で一周する最小 VO を smoke（机上テーゼ→信用戦略→BM→算数→献上）。
6. gtm/ops（L1実働・market-smoke・②③）は後続ビルドで段階解放。

## 一行

**design_only スライスの VO は、本パック6点で skill-creator 投入可能になる。唯一残る人間ゲートは憲法のステータス（草案のままビルド＝推奨 or 先に批准）だけ。**
