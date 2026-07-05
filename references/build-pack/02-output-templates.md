# VO-L0 出力テンプレート ── THESIS / VENTURE-REGIME / DONT-VENTURE

> ビルド準備パック #2。VO-L0 が生成する3成果物の雛形。DH の SPEC/REGIME/DONT に対応。
> プレースホルダは `<...>`。確度メタは `確度: 人間確定|AI推定`（INTENT.md 流儀）。

---

## THESIS.md（＝ DH SPEC.md 対応・DH 連携の出力を兼ねる）

```markdown
# THESIS — <事業名>

> 事業テーゼ。DH へ渡す時は本書が SPEC.md の WHY 層＋機能要求になる（連携契約 #6）。

## WHY（なぜやる・誰のどんな成功のため）
- 対象顧客: <誰>
- 課題: <どんな痛み>
- 価値提案: <どう解くか>

## 信用ポジション（一次目的・V1／credit-strategy CQ1〜4）
- 信用源（誰から）: <顧客/開発者/コミュニティ/パートナー/規制・社会>
- 信用種別（何を信じてほしい）: <能力|誠実|関係>（＋補助 <実績|移転>）
- 獲得経路（どう張る）: <...>
- 代謝設計（信用を焼かず何に換える）: <収益 × 選好パターン>

## 何で稼ぐか（BMパターン・再結合）
- 主パターン: <A-F> ／ 補完: <...>（Who/What/How/Value タグ併記）

## 誰と戦わないか（市場ポスチャ・G）
- <No Frills系|Luxury系|Aikido系|...>

## ユニットエコノミクス前提（#4 で算数化）
- 目標粗利率 / 許容CAC / LTV前提 / 回収期間

## 制約・禁止（→ DONT-VENTURE へ）
```

---

## VENTURE-REGIME.md（＝ DH REGIME.md 対応・骨子は #1）

```markdown
# 事業体制判定 — <事業名>
## 判定時のAI能力バージョン
- モデル: <...> / 判定日: <...>
## 事業ステージ: idea|MVP|PMF|scale
## 二軸＋信用ポジション
- BMパターン / 市場ポスチャ / 信用ポジション
## venture_scope: design_only（既定）
## Venture Trust Level
- vtl / delegation_scope / monetary_gate / irreversible_frozen
## 充足水準（V2）
- sufficiency_target / runway_floor_months
## 体制構成: VO-L0 / VO-L1 / Council / (L2休眠) / Rev
## DH連携: 要否（ソフト必要性の判定）
## LC / 判定ログ
```

---

## DONT-VENTURE.md（＝ DH DONT.md 対応）

```markdown
# DONT-VENTURE — <事業名>

## 参入しない市場・やらない事業
- <...>

## 戦わない領域（Aikido 的明示・G-5）
- <支配的競争軸のうち、あえて放棄する価値>

## 禁止手法（V5 真正性ガードレール）
- 信用の捏造（サクラ/水増し/偽装提携/ダミー母集団）
- 選んだ信用ポジションを焼く代謝（credit-strategy §5 の禁止列）
- ダークパターン・隠れた課金・ステマ

## 不可逆ゲート（第9条・VTL 非依存で人間専管）
- 資金調達 / 法人設立 / 雇用 / 重要契約 / 撤退 / 知財・規制の最終判断
```

---

## 生成規律

- 3成果物はプロジェクトルート直下（DH のファイル配置規則を継承）。
- THESIS は L0 完了の受け入れ基準に「信用ポジション確定済み」を含む（未確定で L1 へ譲渡しない・credit-strategy §8）。
