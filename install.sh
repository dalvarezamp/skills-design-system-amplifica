#!/usr/bin/env bash
# Instala la skill amplifica-design-system para Claude Code.
#
#   ./install.sh            -> skill personal  (~/.claude/skills)
#   ./install.sh --project  -> skill del repo  (./.claude/skills)
set -euo pipefail

SKILL_NAME="amplifica-design-system"
SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "${1:-}" == "--project" ]]; then
  DEST_ROOT=".claude/skills"
  SCOPE="proyecto actual ($(pwd))"
else
  DEST_ROOT="$HOME/.claude/skills"
  SCOPE="personal (todos tus proyectos)"
fi

DEST="$DEST_ROOT/$SKILL_NAME"

mkdir -p "$DEST_ROOT"

if [[ -e "$DEST" ]]; then
  echo "Ya existe: $DEST"
  read -r -p "¿Sobrescribir? [y/N] " ans
  [[ "$ans" =~ ^[Yy]$ ]] || { echo "Cancelado."; exit 1; }
  rm -rf "$DEST"
fi

mkdir -p "$DEST"
cp "$SRC_DIR/SKILL.md" "$DEST/"
cp -R "$SRC_DIR/references" "$DEST/"

echo "✓ Skill '$SKILL_NAME' instalada — alcance: $SCOPE"
echo "  Ubicación: $DEST"
echo "  Reinicia Claude Code y escribe '/' para verla en la lista."
