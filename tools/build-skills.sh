#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUT_DIR="${1:-"$ROOT_DIR/dist/skills"}"
VERSION="$(tr -d '[:space:]' < "$ROOT_DIR/VERSION")"

if ! command -v python3 >/dev/null 2>&1; then
  echo "error: python3 command is required" >&2
  exit 1
fi

rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

INNER_DIR="$(mktemp -d)"
trap 'rm -rf "$INNER_DIR"' EXIT

build_one() {
  local skill_dir="$1"
  local name
  local stage_dir

  name="$(basename "$skill_dir")"
  stage_dir="$(mktemp -d)"

  cp -R "$skill_dir"/. "$stage_dir"/

  python3 - "$stage_dir" "$INNER_DIR/${name}.zip" <<'PY'
import os
import sys
import zipfile

source_dir, archive_path = sys.argv[1], sys.argv[2]

with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
    for root, _, files in os.walk(source_dir):
        for filename in files:
            path = os.path.join(root, filename)
            archive.write(path, os.path.relpath(path, source_dir))
PY

  rm -rf "$stage_dir"
  echo "built ${name}.zip"
}

for skill_md in "$ROOT_DIR"/skills/*/SKILL.md; do
  build_one "$(dirname "$skill_md")"
done

cat > "$INNER_DIR/README.md" <<EOF
# Lytskill ${VERSION}

Trae Solo 一个 zip 装一个 skill。本压缩包里有 5 个独立的 skill zip：

- lyt.zip
- lyt-problem-clarifier.zip
- lyt-traffic-logic.zip
- lyt-product-selection.zip
- lyt-data-analysis.zip

每个 zip 解压后根级是 SKILL.md，可以逐个拖进 Trae Solo 的「上传技能」窗口。
EOF

python3 - "$INNER_DIR" "$OUT_DIR/lytskill-${VERSION}.zip" <<'PY'
import os
import sys
import zipfile

inner_dir, archive_path = sys.argv[1], sys.argv[2]

with zipfile.ZipFile(archive_path, "w", compression=zipfile.ZIP_DEFLATED) as archive:
    for root, _, files in os.walk(inner_dir):
        for filename in sorted(files):
            path = os.path.join(root, filename)
            archive.write(path, os.path.relpath(path, inner_dir))
PY

echo
echo "done: $OUT_DIR/lytskill-${VERSION}.zip"
