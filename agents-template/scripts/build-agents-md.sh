#!/bin/bash
set -e

# build-agents-md.sh — Generate AGENTS.md from universal template + local config
#
# Usage:
#   bash build-agents-md.sh <github-repo-path> <timeline-repo-path> [--check]
#
# The generated AGENTS.md is composed of:
#   1. Universal sections (from .github/agents-template/sections/00-universal.md)
#   2. Local config files (from .agents/config/*.md, sorted by filename)

GITHUB_REPO="${1:?Usage: $0 <github-repo-path> <timeline-repo-path> [--check]}"
TIMELINE_REPO="${2:?Usage: $0 <github-repo-path> <timeline-repo-path> [--check]}"
CHECK_MODE="${3:-}"

SECTIONS_DIR="$GITHUB_REPO/agents-template/sections"
CONFIG_DIR="$TIMELINE_REPO/.agents/config"
OUTPUT="$TIMELINE_REPO/AGENTS.md"

# Validate paths
if [ ! -d "$SECTIONS_DIR" ]; then
  echo "❌ Error: $SECTIONS_DIR not found"
  exit 1
fi

if [ ! -d "$CONFIG_DIR" ]; then
  echo "❌ Error: $CONFIG_DIR not found"
  exit 1
fi

# Build the file
GENERATED=$(mktemp)

# Universal sections (sorted) — first section includes the generation header
for section in "$SECTIONS_DIR"/*.md; do
  [ -f "$section" ] || continue
  cat "$section" >> "$GENERATED"
  echo "" >> "$GENERATED"
done

# Local config (sorted)
for config in "$CONFIG_DIR"/*.md; do
  [ -f "$config" ] || continue
  cat "$config" >> "$GENERATED"
  echo "" >> "$GENERATED"
done

# Check mode: compare with existing
if [ "$CHECK_MODE" = "--check" ]; then
  if [ ! -f "$OUTPUT" ]; then
    echo "❌ AGENTS.md does not exist. Run 'make agents-md' to generate."
    rm "$GENERATED"
    exit 1
  fi
  if diff -q "$GENERATED" "$OUTPUT" > /dev/null 2>&1; then
    echo "✅ AGENTS.md is up to date"
    rm "$GENERATED"
    exit 0
  else
    echo "❌ AGENTS.md is out of date. Run 'make agents-md' to regenerate."
    echo ""
    echo "Differences:"
    diff "$GENERATED" "$OUTPUT" | head -30
    rm "$GENERATED"
    exit 1
  fi
fi

# Write mode
mv "$GENERATED" "$OUTPUT"
echo "✅ AGENTS.md generated ($(wc -l < "$OUTPUT") lines)"
