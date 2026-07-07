#!/usr/bin/env bash
set -euo pipefail

# build-agents-md.sh — Generates AGENTS.md from universal sections + per-timeline config.
#
# Usage:
#   ./build-agents-md.sh <path-to-github-repo> <path-to-timeline-repo> [--check]
#
# Examples:
#   ./build-agents-md.sh ../.github . 
#   ./build-agents-md.sh ../.github . --check
#
# With --check: exits 1 if the current AGENTS.md differs from what would be generated.

GITHUB_REPO="${1:?Usage: build-agents-md.sh <github-repo-path> <timeline-repo-path> [--check]}"
TIMELINE_REPO="${2:?Usage: build-agents-md.sh <github-repo-path> <timeline-repo-path> [--check]}"
CHECK_MODE="${3:-}"

SECTIONS_DIR="${GITHUB_REPO}/agents-template/sections"
CONFIG_DIR="${TIMELINE_REPO}/.agents/config"
OUTPUT="${TIMELINE_REPO}/AGENTS.md"

# Validate inputs
if [[ ! -d "$SECTIONS_DIR" ]]; then
  echo "ERROR: sections directory not found: $SECTIONS_DIR" >&2
  exit 1
fi

if [[ ! -d "$CONFIG_DIR" ]]; then
  echo "ERROR: per-timeline config directory not found: $CONFIG_DIR" >&2
  exit 1
fi

# Build AGENTS.md
GENERATED=$(mktemp)
trap 'rm -f "$GENERATED"' EXIT

cat >> "$GENERATED" << 'HEADER'
<!-- GENERATED FILE — DO NOT EDIT MANUALLY -->
<!-- Source: .github/agents-template/sections/ + .agents/config/ -->
<!-- Regenerate with: make agents-md -->

# AGENTS.md
HEADER

echo "" >> "$GENERATED"

# Append universal sections (sorted by filename)
for section in "$SECTIONS_DIR"/*.md; do
  if [[ -f "$section" ]]; then
    echo "" >> "$GENERATED"
    cat "$section" >> "$GENERATED"
    echo "" >> "$GENERATED"
  fi
done

# Append per-timeline config sections (sorted by filename)
for config in "$CONFIG_DIR"/*.md; do
  if [[ -f "$config" ]]; then
    echo "" >> "$GENERATED"
    cat "$config" >> "$GENERATED"
    echo "" >> "$GENERATED"
  fi
done

# Check mode: compare with existing
if [[ "$CHECK_MODE" == "--check" ]]; then
  if [[ ! -f "$OUTPUT" ]]; then
    echo "FAIL: $OUTPUT does not exist. Run 'make agents-md' to generate it." >&2
    exit 1
  fi
  if ! diff -q "$GENERATED" "$OUTPUT" > /dev/null 2>&1; then
    echo "FAIL: $OUTPUT is out of date. Run 'make agents-md' to regenerate." >&2
    diff --unified=3 "$OUTPUT" "$GENERATED" >&2 || true
    exit 1
  fi
  echo "OK: $OUTPUT is up to date."
  exit 0
fi

# Write mode: overwrite
cp "$GENERATED" "$OUTPUT"
echo "Generated: $OUTPUT"
