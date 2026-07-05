# VO:L0 自己評価 iteration-1（机上シリアル・制約環境）

> skill-creator Phase 5 の subagent/baseline/eval-viewer は制約環境ゆえスキップし、SKILL.md を人手で3プロンプトに適用した机上トレースで assertion を判定（skill-creator 制約環境ガイダンス準拠）。

## eval 1: 開発者向け API レート最適化 SaaS

| assertion | 判定 | トレース |
|---|---|---|
| 信用ポジション1つに絞り確定 | ✅ | CQ1=開発者 / CQ2=能力信用 → THESIS 確定 |
| ユニットエコノミクス机上提示 | ✅ | ステップ5で LTV/CAC/粗利/runway 枠を算数化 |
| venture_scope=design_only | ✅ | ステップ7で既定適用 |
| 資金調達/雇用が L-FROZEN | ✅ | DONT-VENTURE 不可逆ゲートに記載 |

## eval 2: 飲食ファンコミュニティ（低粗利）

| assertion | 判定 | トレース |
|---|---|---|
| 関係信用を焼く代謝が DONT 入り | ✅ | CQ4 で押し売り禁止を DONT-VENTURE へ |
| 充足水準（V2）設定 | ✅ | dialog-questions 充足問→VENTURE-REGIME sufficiency_target |
| 低粗利の破綻を算数判定 | ✅ | ステップ5で LTV/CAC<1 なら pivot 献上（タイプA） |

## eval 3: 広告ゼロ・透明価格の写真共有（Aikido）

| assertion | 判定 | トレース |
|---|---|---|
| 市場ポスチャ=Aikido 確定 | ✅ | ステップ4で「誰と戦わないか」＝広告軸の放棄 |
| 誠実信用と不整合な代謝が禁止列 | ✅ | 隠れ課金/ステマを DONT-VENTURE（V5） |
| 真正性ガードレール（V5）反映 | ✅ | 信用捏造禁止が DONT-VENTURE 核 |

## 総括

3/3 の全 assertion が SKILL.md の処理フロー＋参照で満たされる。過剰適合を避けるため、SKILL は特定事業型に固有化せず「信用ポジション×BMパターン×市場ポスチャ×算数」の汎用フローで記述。

## 次イテレーションの改善候補（未実施・記録のみ）

- ステップ2→3 の遷移で「価値提案が曖昧なまま信用戦略に入る」ケースの防止ガード（現状は受け入れ基準で拾う）。
- crosscut-unit-economics スキル化後、ステップ5を当該スキルへ委譲（現状は SKILL 内に手順内包）。
