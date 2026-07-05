#!/bin/bash
# SessionStart hook — DH（dialog-harness）開発スキルを毎セッション装着する。
#
# VO は独立 repo（D1・二重保守回避）。DH の開発スキル（layer0-spec-architect /
# crosscut-verifier-* / layer1-* 等）は「コミットで内蔵」せず、pinned submodule から
# 毎セッション .claude/skills/ に symlink して invocable にする。
# VO 自身のスキルは vo-* で tracked、DH スキルは bare 名で非追跡（.gitignore）——
# vo- 名前空間ゆえ名前衝突ゼロ（CO-RESIDENCE Model B）。
#
# 同期モード（async 行なし）: symlink はスキル探索より前に張られている必要があるため。
set -euo pipefail

cd "${CLAUDE_PROJECT_DIR:-$(git rev-parse --show-toplevel)}"

# 1) dialog-harness submodule を展開（web の fresh clone は submodule 未init）
#    失敗しても session は継続するが、原因診断のためエラーは握り潰さず表示する。
if ! sm_err="$(git submodule update --init --recursive dialog-harness 2>&1)"; then
  echo "[session-start] submodule update に失敗（session は継続）: ${sm_err}" >&2
fi

# 2) DH の開発スキルを .claude/skills/ へ symlink（invocable 化）
DH_SKILLS="dialog-harness/.claude/skills"
if [ -d "$DH_SKILLS" ]; then
  mkdir -p .claude/skills
  linked=0
  shopt -s nullglob  # glob が何もマッチしない時に literal ".../*/" でループが空回りするのを防ぐ
  for dir in "$DH_SKILLS"/*/; do
    name="$(basename "$dir")"
    target=".claude/skills/$name"
    # 既存の real ディレクトリ（vo-* 等）は絶対に上書きしない。
    # 張り直すのは「symlink である」または「何も無い」場合のみ。
    if [ -L "$target" ] || [ ! -e "$target" ]; then
      ln -sfn "../../$DH_SKILLS/$name" "$target"
      linked=$((linked + 1))
    fi
  done
  echo "[session-start] DH skills linked: $linked (submodule @ $(git -C dialog-harness rev-parse --short HEAD 2>/dev/null || echo '?'))" >&2
else
  echo "[session-start] dialog-harness submodule not populated; DH skills unavailable this session" >&2
fi
