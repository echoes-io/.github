---
name: write-chapter
description: Complete workflow for writing a new chapter. Use when the user asks to write, continue, or create a new chapter in any timeline. Includes step-by-step process from context gathering to metadata generation.
---

# Write Chapter Workflow

## The 8-Step Process

Follow these steps for EVERY chapter. Do not skip steps.

### STEP 1 — Identify Components

Parse from user input:
- `timeline` — eros, anima, glow, bloom, pulse
- `arc` — discover from filesystem or ask
- `episode` — number
- `chapter` — number (or next available)
- `pov` — discover from planning or ask

Verify episode exists. If chapter not specified, use next available.

### STEP 2 — Context Gathering

**A. Previous chapter** (if not first):
- Read the previous chapter for continuity
- Note: POV, location, emotional state, last events

**B. Arc context:**
- Activate the relevant `arc-{name}` skill
- Read the chapter outline from arc structure
- Note what must happen in this chapter

**C. Character context:**
- Check character sheets for POV character
- Verify physical details, voice, relationships

**D. Location context:**
- Check location docs if scene is in a documented place
- Verify layout, atmosphere, previous descriptions

### STEP 3 — Planning

Create a mental brief:
- ONE emotional beat (what's the single thing the reader must feel?)
- Location and time of day
- Who's in the scene
- Heat level (if Eros/Glow)
- Outfit (what is she wearing?)

**If certainty < 95% on ANY detail → ask the user.**

### STEP 4 — Kink & Heat Planning (Eros/Glow only)

- What heat level? (check arc structure)
- What's the sexual dynamic?
- What does it mean emotionally? (sex reveals, doesn't fill)
- Who leads? Who surrenders?

### STEP 5 — Writing

**Structure:**
- Opening (first 3 lines: hook the reader)
- Development (the beat unfolds)
- Closing (end ON the moment — no reflection after)

**Word count by timeline:**
- Eros: 1,800-2,200w
- Anima: 3,500-4,500w
- Glow: 1,800-2,200w
- Pulse: 1,000-1,500w

**Rules during writing:**
- ONE emotional beat per chapter (Anima: one primary + one secondary allowed)
- End ON the moment — no "and in that moment I understood..."
- At least one moment of humor (unless explicitly devastating)
- 3+ senses engaged
- Outfit described (in male POV chapters)
- Dialogue is action, not exposition

### STEP 6 — Hook Engineering

**Last line:** ≤10 words (Eros), ≤15 words (Glow/Anima/Pulse)

**Hook types** (vary from previous chapter):
- EMOTIONAL_CLIFF — feeling unresolved
- TENSION_PEAK — something about to happen
- QUESTION — reader needs an answer
- REVELATION — something just changed
- INTERRUPTION — cut mid-action
- UNSPOKEN — what wasn't said
- RESOLUTION — rare, earned (max 10-20% of chapters)

### STEP 7 — Anti-AI Check

Scan your output for:
- [ ] No meaning inflation ("pivotal", "profound", "fundamental")
- [ ] No gerund cascades
- [ ] No named emotions ("he felt X")
- [ ] No artificial symmetry (three-adjective lists)
- [ ] No generic openings/closings
- [ ] Sounds human — would a paid reader feel cheated?

### STEP 8 — Metadata & Save

Generate frontmatter:
```yaml
---
pov: [character]
title: "[evocative title]"
date: "[narrative date or today]"
timeline: [timeline]
arc: [arc]
episode: [number]
chapter: [number]
summary: "[real summary of what happens, max 300 chars]"
location: "[specific location]"
header_image: "[Two English AI prompts separated by | — atmosphere, not content]"
outfit: "[Character: outfit description]"  # if relevant
heat: [0-5]  # if Eros/Glow
kink: "[tags]"  # if Eros/Glow
---
```

Generate filename: `ch{YYY}-{pov}-{title-slug}.md`

## Self-Review Summary

Present with:
```
### Self-Review: ✅ PASS (X/10)
Words: N | Hook: TYPE (strength/5) | Last line: Nw | Heat: N | Senses: N
```

## References

See [writer-workflow.md](references/writer-workflow.md) for the detailed Eros-specific workflow with all nuances.
