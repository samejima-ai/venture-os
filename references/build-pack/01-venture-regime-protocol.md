# VENTURE-REGIME 判定プロトコル ── VO-L0 の判定核

> ビルド準備パック #1。DH `regime-assessment.md` 相当。VO-L0 が事業を判定して `VENTURE-REGIME.md` を確定する手順。
> 参照: CONCEPTION v2 §5/§6（VTL/monetary_gate）/ 憲法 V2/V4/V6 / credit-strategy（信用ポジション）。

VO-L0 は対話（THESIS 策定）と並行して以下を判定し `VENTURE-REGIME.md` に記録する。DH の S/U/R/N スコアリングを事業素材へ写像したもの。

---

## 判定1: 事業ステージ（DH の M1/M2/L2 写像）

| ステージ | 目安 | 検証の重さ | 体制 |
|---|---|---|---|
| **idea** | テーゼ未検証・机上のみ | 算数（第1層）中心 | VO-L1 単体・design_only 固定 |
| **MVP** | 最小検証対象が定義済み | ＋市場スモーク（第2層） | design_only〜gtm |
| **PMF** | 市場適合を探索中 | ＋独立市場検証者 | gtm＋Rev |
| **scale** | 適合済み・拡大 | 全層＋ポートフォリオ | full_ops（多事業ラインなら L2 起動） |

判定入力: THESIS の検証状態・過去実績（LC）・市場の既知度。

---

## 判定2: 二軸（何で稼ぐか × 誰と戦わないか）＋信用ポジション

VENTURE-REGIME は事業を**3つの直交軸**で記述する:

| 軸 | 中身 | 参照 |
|---|---|---|
| **BM パターン軸** | 何で稼ぐか（A〜F の IT-active から再結合） | `prototype/bizmodel-pattern-library.md` |
| **市場ポスチャ軸（G）** | 誰と戦わないか（No Frills系/Luxury系/Aikido系/…） | CONCEPTION v2 §4 |
| **信用ポジション軸** | 誰の何の信用で立つか（源×種別） | `CREDIT-STRATEGY-venture-os-v1.md`（CQ1〜4） |

各 BM パターンに Who/What/How/Value タグを併記（影響次元）。

---

## 判定3: venture_scope（DH dev_mode 写像・既定 design_only）

| scope | 出力 | 外部露出 | 人間関与 |
|---|---|---|---|
| **design_only**（既定） | THESIS＋BM設計＋財務モデル＋GTMプラン（紙・可逆） | なし | L0 承認のみ |
| gtm_execution | ＋LP公開・小額広告・価格A/B・MVP定義 | 小（monetary_gate 付き） | 予算GO＋P4監視 |
| full_ops | ＋継続運営・自律実験・指標監視 | 大 | P1〜P4＋不可逆ゲート |

**判定フロー**: 既定 design_only。gtm/full_ops への昇格は**手動＋ADR 記録必須**（金を出す責務は人間専管 H4）。「実市場に出さなくても design_only で完全動作」が原則。

---

## 判定4: VTL ＋ monetary_gate（委譲ガバナンス）

CTL 機構を移植した VTL（可逆な事業判断の自律度）と、人間設定の支出上限 monetary_gate（直交）。

```
## Venture Trust Level
- vtl: VTL-0                     # CTL 同型・コールドスタート（可逆判断のみ統べる）
- delegation_scope: []           # 自律可の可逆判断カテゴリ
- monetary_gate:
    per_action: 0                # 1行為あたり支出上限（¥・人間設定・既定0=全件承認）
    per_period: 0
    period: monthly
- irreversible_frozen: [spend, legal, hiring, exit, fundraise]  # VTL 非依存で常時 L-GATE/人間専管
```

実行可否 ＝「VTL が可逆判断を許可」AND「monetary_gate 内」。design_only では monetary_gate は実質不作用（支出なし）。

---

## 判定5: 充足水準（V2）

貨幣は最大化せず「活動継続に足る」で充足。人間が置く（AI は自律で引き上げない・第8条）。

```
## 充足水準（V2）
- sufficiency_target:
    monthly_burn_cover: 0        # 継続に要する月額（人間設定）
    runway_floor_months: 0       # 下回ったら献上する貨幣runway下限
```

---

## VENTURE-REGIME.md 骨子（生成テンプレは #2 参照）

```
# 事業体制判定 — <事業名>
## 判定時のAI能力バージョン
## 事業ステージ: idea|MVP|PMF|scale
## 二軸＋信用ポジション
- BMパターン: <A-F 再結合>
- 市場ポスチャ: <G類型>
- 信用ポジション: <源×種別>（credit-strategy CQ1〜4）
## venture_scope: design_only|gtm_execution|full_ops
## VTL ＋ monetary_gate
## 充足水準（V2）
## 体制構成: VO-L0 / VO-L1 / Council / (L2休眠) / Rev
## LC / DH連携: 要否（ソフト必要性）
```

---

## 判定ログ規律（第4条）

判定は AI が閾値で機械的に行い、人間は結果を確認する（判定の代行はしない）。昇格・降格（特に venture_scope・不可逆枠）は手動＋ADR 記録必須。
