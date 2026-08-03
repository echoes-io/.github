#!/bin/bash
set -e

# sync-skills.sh — Sync universal skills from .github to timeline repo
#
# Usage:
#   bash sync-skills.sh <github-repo-path> <timeline-repo-path> [--check]
#
# Universal skills (synced from .github/agents-template/skills/):
#   anti-ai-check, echi-paralleli, nic-bible, timeline-master, write-chapter
#
# Local skills (NOT synced — managed per-timeline):
#   arc-*, commercial-patterns, innovations-per-arc, nic-scar-graph, image-maker

GITHUB_REPO="${1:?Usage: $0 <github-repo-path> <timeline-repo-path> [--check]}"
TIMELINE_REPO="${2:?Usage: $0 <github-repo-path> <timeline-repo-path> [--check]}"
CHECK_MODE="${3:-}"

SOURCE_DIR="$GITHUB_REPO/agents-template/skills"
TARGET_DIR="$TIMELINE_REPO/.agents/skills"

# Universal skills to sync
UNIVERSAL_SKILLS=(
  anti-ai-check
  echi-paralleli
  nic-bible
  timeline-master
  write-chapter
)

# Validate paths
if [ ! -d "$SOURCE_DIR" ]; then
  echo "❌ Error: $SOURCE_DIR not found"
  exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
  echo "❌ Error: $TARGET_DIR not found"
  exit 1
fi

# Check mode
if [ "$CHECK_MODE" = "--check" ]; then
  OUT_OF_SYNC=0
  for skill in "${UNIVERSAL_SKILLS[@]}"; do
    if [ ! -d "$TARGET_DIR/$skill" ]; then
      echo "❌ Missing: $skill"
      OUT_OF_SYNC=1
      continue
    fi
    # Compare all files in the skill directory
    if ! diff -rq "$SOURCE_DIR/$skill" "$TARGET_DIR/$skill" > /dev/null 2>&1; then
      echo "❌ Out of sync: $skill"
      OUT_OF_SYNC=1
    fi
  done

  if [ $OUT_OF_SYNC -eq 0 ]; then
    echo "✅ All universal skills are in sync"
    exit 0
  else
    echo ""
    echo "Run 'make skills-sync' to update."
    exit 1
  fi
fi

# Sync mode
SYNCED=0
for skill in "${UNIVERSAL_SKILLS[@]}"; do
  if [ ! -d "$SOURCE_DIR/$skill" ]; then
    echo "⚠️  Skipping $skill (not in source)"
    continue
  fi

  # Check if different before copying
  if [ -d "$TARGET_DIR/$skill" ] && diff -rq "$SOURCE_DIR/$skill" "$TARGET_DIR/$skill" > /dev/null 2>&1; then
    continue  # Already in sync
  fi

  # Copy
  rm -rf "$TARGET_DIR/$skill"
  cp -r "$SOURCE_DIR/$skill" "$TARGET_DIR/$skill"
  echo "  ↻ $skill"
  SYNCED=$((SYNCED + 1))
done

if [ $SYNCED -eq 0 ]; then
  echo "✅ All universal skills already in sync"
else
  echo "✅ Synced $SYNCED skill(s)"
fi
