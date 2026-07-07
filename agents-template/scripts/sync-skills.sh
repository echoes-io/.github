#!/usr/bin/env bash
set -euo pipefail

# sync-skills.sh — Copies universal skills from .github/agents-template/skills/ to a timeline repo.
# Also copies resonance files into the appropriate skill references/ directories.
#
# Usage:
#   ./sync-skills.sh <path-to-github-repo> <path-to-timeline-repo> [--check]
#
# Examples:
#   ./sync-skills.sh ../.github .
#   ./sync-skills.sh ../.github . --check
#
# With --check: exits 1 if any universal skill is out of sync.

GITHUB_REPO="${1:?Usage: sync-skills.sh <github-repo-path> <timeline-repo-path> [--check]}"
TIMELINE_REPO="${2:?Usage: sync-skills.sh <github-repo-path> <timeline-repo-path> [--check]}"
CHECK_MODE="${3:-}"

SOURCE_SKILLS="${GITHUB_REPO}/agents-template/skills"
TARGET_SKILLS="${TIMELINE_REPO}/.agents/skills"

# Validate
if [[ ! -d "$SOURCE_SKILLS" ]]; then
  echo "ERROR: source skills directory not found: $SOURCE_SKILLS" >&2
  exit 1
fi

CHANGES=0

# Sync each universal skill
for skill_dir in "$SOURCE_SKILLS"/*/; do
  skill_name=$(basename "$skill_dir")
  target_dir="${TARGET_SKILLS}/${skill_name}"

  if [[ "$CHECK_MODE" == "--check" ]]; then
    # Check mode: compare
    if [[ ! -d "$target_dir" ]]; then
      echo "MISSING: $target_dir" >&2
      CHANGES=$((CHANGES + 1))
      continue
    fi
    # Compare SKILL.md
    if ! diff -q "${skill_dir}/SKILL.md" "${target_dir}/SKILL.md" > /dev/null 2>&1; then
      echo "OUT OF SYNC: ${target_dir}/SKILL.md" >&2
      CHANGES=$((CHANGES + 1))
    fi
  else
    # Sync mode: copy
    mkdir -p "$target_dir"
    # Copy SKILL.md always
    cp "${skill_dir}/SKILL.md" "${target_dir}/SKILL.md"
    # Copy references/ if exists in source (only files that don't exist locally or are from template)
    if [[ -d "${skill_dir}/references" ]]; then
      mkdir -p "${target_dir}/references"
      # Only copy template references, not overwrite local ones
      for ref_file in "${skill_dir}/references/"*; do
        if [[ -f "$ref_file" ]]; then
          ref_name=$(basename "$ref_file")
          cp "$ref_file" "${target_dir}/references/${ref_name}"
        fi
      done
    fi
    echo "SYNCED: $skill_name"
  fi
done

# Sync resonance files into skill references (if resonance exists)
RESONANCE_DIR="${GITHUB_REPO}/../resonance/output"
if [[ -d "$RESONANCE_DIR" && "$CHECK_MODE" != "--check" ]]; then
  # nic-bible: copy full bible
  if [[ -f "${RESONANCE_DIR}/nic-continuity-bible.md" && -d "${TARGET_SKILLS}/nic-bible" ]]; then
    mkdir -p "${TARGET_SKILLS}/nic-bible/references"
    cp "${RESONANCE_DIR}/nic-continuity-bible.md" "${TARGET_SKILLS}/nic-bible/references/full-bible.md"
    echo "SYNCED: nic-bible/references/full-bible.md (from resonance)"
  fi

  # timeline-master: copy timeline
  if [[ -f "${RESONANCE_DIR}/timeline-master.md" && -d "${TARGET_SKILLS}/timeline-master" ]]; then
    mkdir -p "${TARGET_SKILLS}/timeline-master/references"
    cp "${RESONANCE_DIR}/timeline-master.md" "${TARGET_SKILLS}/timeline-master/references/timeline-master.md"
    echo "SYNCED: timeline-master/references/timeline-master.md (from resonance)"
  fi

  # write-chapter: copy workflow
  if [[ -f "${RESONANCE_DIR}/writer-workflow.md" && -d "${TARGET_SKILLS}/write-chapter" ]]; then
    mkdir -p "${TARGET_SKILLS}/write-chapter/references"
    cp "${RESONANCE_DIR}/writer-workflow.md" "${TARGET_SKILLS}/write-chapter/references/writer-workflow.md"
    echo "SYNCED: write-chapter/references/writer-workflow.md (from resonance)"
  fi

  # anti-ai-check: copy full guide
  if [[ -f "${RESONANCE_DIR}/anti-ai-voice-guide-en.md" && -d "${TARGET_SKILLS}/anti-ai-check" ]]; then
    mkdir -p "${TARGET_SKILLS}/anti-ai-check/references"
    cp "${RESONANCE_DIR}/anti-ai-voice-guide-en.md" "${TARGET_SKILLS}/anti-ai-check/references/full-guide.md"
    echo "SYNCED: anti-ai-check/references/full-guide.md (from resonance)"
  fi

  # echi-paralleli: copy full doc
  if [[ -f "${RESONANCE_DIR}/architettura-echi-paralleli.md" && -d "${TARGET_SKILLS}/echi-paralleli" ]]; then
    mkdir -p "${TARGET_SKILLS}/echi-paralleli/references"
    cp "${RESONANCE_DIR}/architettura-echi-paralleli.md" "${TARGET_SKILLS}/echi-paralleli/references/full-doc.md"
    echo "SYNCED: echi-paralleli/references/full-doc.md (from resonance)"
  fi
fi

# Check mode exit
if [[ "$CHECK_MODE" == "--check" ]]; then
  if [[ $CHANGES -gt 0 ]]; then
    echo "FAIL: $CHANGES skill(s) out of sync. Run 'make skills-sync' to fix." >&2
    exit 1
  fi
  echo "OK: All universal skills are in sync."
  exit 0
fi

echo "Done. Universal skills synced to ${TARGET_SKILLS}/"
