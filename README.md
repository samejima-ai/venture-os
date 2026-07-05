# venture-os

**人間の意図を対話で具体化し、AI が自律的に事業を設計・検証・運営するメタスキル。**
[dialog-harness](https://github.com/samejima-ai/dialog-harness) の**兄弟メタスキル** ── DH がソフトウェア開発の OS なら、venture-os は**事業の OS**。信用経済を軸に据える。

> ステータス: **design_only スライス構築済み**（机上で自己完結）。gtm/ops（実市場・実働）は段階解放で後続。憲法 V1〜V6 は草案。

## 一行

DH ＝「意図 → 自律ソフトウェア開発」。VO ＝その双対「意図 → 自律事業設計・検証・運営」。同一形状（9条憲法を継承）・異素材（ビット vs 事業）。決定的差分は**可逆性**（金・法・人は不可逆ゆえ委譲重心が保守的）。

## 軸（憲法 V1〜V6）

**信用を獲得し、活動継続に足るだけの貨幣へ充足的にマネタイズし、そのループを AI 自律で回し続ける。** 貨幣は流れ、信用は蓄積、継続が勝利条件。詳細は [`philosophy.md`](./philosophy.md)。

## 構成

```
venture-os/
├── philosophy.md                    # 憲法（継承 DH 9条 ＋ VO V1〜V6・草案）
├── .claude/skills/                  # vo- 名前空間のスキル（DH と同居しても衝突しない）
│   ├── vo-layer0-venture-architect/ # VO:L0 設計（テーゼ・信用戦略・BMパターン・市場ポスチャ・算数・REGIME判定）
│   ├── vo-crosscut-council/         # 判断合議（三極: 資本家/信用の番人/需給の代弁者）
│   ├── vo-crosscut-unit-economics/  # 貨幣side センサー（LTV/CAC/runway・Shift Left）
│   ├── vo-crosscut-credit-runway/   # 信用side センサー（信用runway・V4二軸）
│   ├── vo-crosscut-demand-sensor/   # 需給side センサー（需要前提＋反証命題＋確度）
│   ├── vo-crosscut-market-smoke/    # 第2層 需要スモークテスト実働（gtm 昇格で有効）
│   └── vo-crosscut-bizmodel-selector/ # 66パターン選択・再結合
└── references/                      # 設計正典（憲法本文・信用戦略・runway・build-pack・大辞典・移設プラン 等）
```

## DH との関係

- **兄弟**: 同一の 9条憲法（DH）を継承し、VO 固有条 V1〜V6 を上層に重ねる。
- **連携**: 事業がソフトを要するとき、VO の `THESIS` を DH の `SPEC` に渡して DH に製品開発を発注する（入れ子トポロジー・`references/build-pack/06-vo-dh-topology.md`）。
- **同居/個別**: 個別クローン（既定）でも、1プロジェクトへの DH との同居でも成立（`vo-` 名前空間で衝突回避・`references/migration/CO-RESIDENCE-DESIGN.md`）。

## deploy

`.claude/skills/vo-*` をプロジェクトに展開。design_only では実市場に出さず机上で「テーゼ→信用戦略→BMパターン×市場ポスチャ→ユニットエコノミクス算数→（拮抗時）Council→献上」を一周する。

---

Built as a sibling of [dialog-harness](https://github.com/samejima-ai/dialog-harness) · 信用経済を軸とする事業メタOS
