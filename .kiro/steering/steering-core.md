# Echoes — Core Steering

Echoes is a multi-timeline storytelling platform. Characters' voices resonate across interconnected narratives. Primary language: English. Italian and other languages downstream.

## Timelines

| Timeline | Theme | Tone | Chapter length | Format |
|----------|-------|------|:--------------:|--------|
| ❤️ **Eros** | Passion, intensity, male interiority | Direct, sensorial, explicit | 1,800-2,200w | Serial (Ream), drip-feed |
| 🌿 **Anima** | Growth, tenderness, family | Soft, contemplative, immersive | ~4,000w | Novels (Amazon KDP) |
| 💫 **Pulse** | Fragments, desire, standalone truths | Two voices: NIC (confessional) + LEI (intimate) | 1,000-1,500w | One-shots & mini-series (Substack) |
| 🌸 **Bloom** | Discovery, blossoming | Poetic, evocative | TBD | Separate scope — not covered by Resonance |

**Note**: Bloom is an independent project with its own rules. This steering document covers Eros, Anima, and Pulse only.

## Content Hierarchy

### Eros & Anima
```
Timeline → Arc → Episode/Volume → Chapter (.md)
```

### Pulse
```
Timeline → Filone (nic/lei) → Series → Piece (.md)
```

A chapter/piece = one markdown file with YAML frontmatter.

## Naming Conventions

### Eros
- Arc directory: lowercase (`ale`, `cri`, `work`)
- Episode directory: `ep{XX}-{title-slug}` (2 digits: ep01, ep03)
- Chapter file: `ep{XX}-ch{XXX}-{pov}-{title-slug}.md` (3 digits: ch001, ch015)

### Anima
- Arc directory: lowercase (`london`, `milan`)
- Volume directory: `vol{X}-{title-slug}` (vol1, vol2)
- Chapter file: `vol{X}-ch{XXX}-{pov}-{title-slug}.md`

### Pulse
- Filone directory: `nic/` or `lei/`
- Series directory: lowercase (`vale`, `gio`, `cri`, `ale`, `ele`)
- Piece file: `{series}-{XX}-{title-slug}.md` (vale-01-la-mezza-bottiglia.md)

### General
- POV in filename: lowercase (nic, ale, cri, marie)
- All directories: lowercase, no spaces, hyphens for slugs

## Filesystem

### Eros
```
timeline-eros/
├── content/{arc}/{epXX-title}/{epXX-chXXX-pov-title}.md
├── docs/characters/{arc}/   # Character sheets per arc
├── docs/episodes/           # Episode outlines
├── docs/locations/          # Location descriptions
└── .kiro/                   # Agent config
```

### Anima
```
timeline-anima/
├── content/{arc}/{volX-title}/{volX-chXXX-pov-title}.md
├── docs/characters/{arc}/   # Character sheets per arc
├── docs/episodes/           # Episode/volume outlines
├── docs/locations/          # Location descriptions
└── .kiro/                   # Agent config
```

### Pulse
```
timeline-pulse/
├── content/{filone}/{series}/{series-XX-title}.md
├── docs/characters/         # Pulse-exclusive characters only
├── docs/pulse-structure.md  # Master document (voices, calendar, echoes)
└── .kiro/                   # Agent config
```

## Frontmatter

### Eros & Anima (required)
```yaml
---
pov: string          # lowercase (nic, ale, cri, marie)
title: string        # max 100 char
arc: string          # lowercase
episode: number      # (Eros) or volume number (Anima)
chapter: number      # integer
date: string         # "YYYY-MM-DD, Description"
location: string     # specific ("Apartment, Navigli", not "home")
summary: string      # max 300 char (NOT the first sentences)
---
```

Optional: `outfit` (string), `heat` (0-5, Eros), `hook_type` (string, Eros), `word_count` (number).

### Pulse (required)
```yaml
---
pov: string          # lowercase (nic, cri, ale, ele, gio, vale)
title: string
filone: string       # nic | lei
series: string       # vale, gio, cri, ale, ele
part: number         # within the series
heat: number         # 0-5
word_count: number
tags: list           # ["confessione", "nostalgia", "desiderio"]
---
```

Optional: `date` (string), `location` (string), `outfit` (string).

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

### NEVER
1. Head-hopping (accessing non-POV characters' thoughts)
2. Generic locations ("home", "outside", "somewhere")
3. Summary = first sentences of the chapter (must be a real summary)
4. Skip context gathering before writing
5. Cross-arc direct references in Eros/Pulse (oblique echoes only — see "Echi Paralleli")

## MCP Tools

- Content: `chapter-info`, `episode-info`, `chapter-refresh`, `chapter-insert`, `chapter-delete`, `episode-update`, `words-count`
- Sync: `timeline-sync`
- RAG: `rag-index`, `rag-search`, `rag-context`, `rag-characters`
- Stats: `stats`, `timeline-overview`

## Workflow

```
1. IDENTIFY  → timeline, arc, episode/series, chapter/piece, pov
2. CONTEXT   → planning docs, previous chapter, character sheets
3. WRITE     → follow timeline-specific prompt (see each repo's writer-prompt.md)
4. VALIDATE  → anti-AI check, continuity, quality gates
5. METADATA  → complete frontmatter, word count
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

## Arc README

Each arc has `content/{arc}/README.md`:
```yaml
---
status: planned | active | hiatus | complete
---
```
