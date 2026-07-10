# Echoes — Core Steering

Echoes is a multi-timeline storytelling platform. Characters' voices resonate across interconnected narratives. Primary language: English. Italian and other languages downstream.

## Timelines

| Timeline | Theme | Tone | Chapter length | Format | Platform |
|----------|-------|------|:--------------:|--------|----------|
| ❤️ **Eros** | Passion, intensity, male interiority | Direct, sensorial, explicit | 1,800-2,200w | Serial, drip-feed | Ream |
| 🌿 **Anima** | Growth, tenderness, family | Soft, contemplative, immersive | ~4,000w | Novels | Amazon KDP |
| ✨ **Glow** | Lightness, pleasure, adult joy | Light, comic, warm, explicit | 1,800-2,200w | Serial, mini-arcs | Ream |
| 💫 **Pulse** | Intimate voices, fragments, confessions | Confessional, varied, explicit | 1,000-1,500w | Standalone | Substack |
| 🌸 **Bloom** | Discovery, blossoming | Poetic, evocative | ~2,000w | Separate scope | — |

**Note**: Bloom is an independent project with its own rules.

## Content Hierarchy

```
Timeline → Arc → [Episode/Volume] → Chapter (.md)
```

- **Eros**: has episodes (ep01, ep02, ep03)
- **Anima**: has volumes (vol1, vol2, vol3)
- **Glow**: flat (no episodes — arc is linear)
- **Pulse**: flat (standalone pieces per arc)

## Naming Conventions

### Chapter Filename (ALL timelines)

```
ch{YYY}-{pov}-{title-slug}.md
```

- `ch` prefix + 3-digit zero-padded number: ch001, ch015, ch123
- `pov`: lowercase character name (nic, ale, cri, vale, giogio, marie)
- `title-slug`: lowercase, hyphens, no special chars

**Examples:**
- `ch001-nic-the-message.md`
- `ch015-ale-the-crack.md`
- `ch003-cri-milano.md`
- `ch007-nic-the-arrival.md`

### Directory Structure

**Eros** (arc → episode → chapters):
```
content/{arc}/ep{XX}-{slug}/ch{YYY}-{pov}-{slug}.md
```
Example: `content/ale/ep01-london-calling/ch001-nic-the-message.md`

**Anima** (arc → volume → chapters):
```
content/{arc}/vol{N}-{slug}/ch{YYY}-{pov}-{slug}.md
```
Example: `content/london/vol1-somewhere-else/ch001-nic-arrival.md`

**Glow** (arc → chapters):
```
content/{arc}/ch{YYY}-{pov}-{slug}.md
```
Example: `content/vale/ch001-nic-the-half-bottle.md`

**Pulse** (filone → arc → chapters):
```
content/lei/{arc}/ch{YYY}-{pov}-{slug}.md
```
Example: `content/lei/cri/ch001-cri-milano.md`

### General Rules
- All directories: lowercase, no spaces, hyphens for slugs
- POV in filename: lowercase (nic, ale, cri, marie, vale, giogio)
- Episode dirs: 2-digit padding (ep01, ep03)
- Chapter files: 3-digit padding (ch001, ch015)

## Frontmatter

### Required Fields (ALL timelines)

```yaml
---
pov: string          # lowercase character name
title: string        # max 100 chars, evocative
date: string         # "YYYY-MM-DD" or "YYYY-MM-DD, Description"
timeline: string     # eros | anima | glow | bloom | pulse
arc: string          # lowercase (ale, cri, vale, london, etc.)
episode: number      # episode/volume number (1 if timeline has no episodes)
chapter: number      # sequential integer (matches ch{YYY} in filename)
summary: string      # max 300 chars — a real summary, NOT the first sentences
location: string     # specific ("Apartment, Navigli" — never "home" or "outside")
header_image: string # Two English AI prompts separated by | (atmosphere, not content)
---
```

### Optional Fields

```yaml
---
part: number         # only if episode is divided into parts (rare)
outfit: string       # female characters' outfits (required for Eros/Glow, optional elsewhere)
kink: string         # comma-separated content tags (Eros/Glow)
heat: number         # 0-5 sexual intensity (required for Eros/Glow, optional elsewhere)
---
```

### Heat Scale

| Heat | Meaning |
|:----:|---------|
| 0 | No physical content. Conversation, reflection, pure plot. |
| 1 | Tension, body awareness. Looks, proximity. No contact. |
| 2 | Physical contact: kisses, touches, build-up. Scene rises but doesn't arrive. |
| 3 | Sex present but not central. Partial, interrupted, or less detailed. |
| 4 | Explicit, detailed sex scene. One or two acts described fully. |
| 5 | Sex-dominant chapter. Multiple acts, very detailed, sex IS the chapter. |

### Frontmatter Validation Rules

- `chapter` in frontmatter MUST match `ch{YYY}` in filename (ch007 → chapter: 7)
- `pov` in frontmatter MUST match `{pov}` in filename
- `timeline` MUST be one of: eros, anima, glow, bloom, pulse
- `summary` is a REAL summary of what happens — never the opening lines
- `location` must be specific (place name, not "home" or "there")
- `date` format: ISO date, optionally with description after comma

## Critical Rules

### ALWAYS
1. One POV per chapter — NO head-hopping, ever
2. Show don't tell — emotions through actions and physical details
3. At least 3 senses per scene (sight, sound, touch, smell, taste)
4. Rich internal monologue — deep dive into POV character's thoughts
5. Female character outfits described in ALL timelines
6. Consult planning docs (characters, episodes, locations) before writing
7. Verify continuity with previous chapters
8. Write in English (primary). Italian loanwords where character-appropriate
9. Complete frontmatter with ALL required fields before finishing

### NEVER
1. Head-hopping (accessing non-POV characters' thoughts)
2. Generic locations ("home", "outside", "somewhere")
3. Summary = first sentences of the chapter (must be a real summary)
4. Skip context gathering before writing
5. Cross-arc direct references in Eros/Glow/Pulse (oblique echoes only — see "Echi Paralleli")
6. Wrong filename format (always `ch{YYY}-{pov}-{slug}.md`)
7. Missing or incomplete frontmatter

## MCP Tools

- Content: `chapter-info`, `episode-info`, `chapter-refresh`, `chapter-insert`, `chapter-delete`, `episode-update`, `words-count`
- Sync: `timeline-sync`
- RAG: `rag-index`, `rag-search`, `rag-context`, `rag-characters`
- Stats: `stats`, `timeline-overview`

## Workflow

```
1. IDENTIFY  → timeline, arc, episode/volume, chapter, pov
2. CONTEXT   → planning docs, previous chapter, character sheets
3. WRITE     → follow timeline-specific prompt (see each repo's writer-prompt.md)
4. VALIDATE  → anti-AI check, continuity, quality gates
5. METADATA  → complete frontmatter (ALL required fields), correct filename
6. SYNC      → update databases if available
```

Each timeline has its own detailed writer prompt in `.kiro/prompts/writer-prompt.md` that overrides general guidelines with timeline-specific rules.

## Reference Documents (in resonance/)

| Document | Purpose |
|----------|---------|
| `nic-continuity-bible.md` | Who Nic is — fixed backstory, family, details |
| `commercial-patterns-guide.md` | The 5 non-negotiables + all pattern rules (Eros) |
| `anti-ai-voice-guide-en.md` | What to avoid so writing sounds human |
| `architettura-echi-paralleli.md` | Each arc is autonomous, no cross-dependencies |
| `{arc}-arc-structure.md` | Chapter-by-chapter outline per arc |
| `writer-workflow.md` | 8-step workflow for Eros writer |
| `writer-agent-glow-prompt.md` | Glow-specific writing rules |
