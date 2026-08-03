<!-- GENERATED FILE — DO NOT EDIT MANUALLY -->
<!-- Source: .github/agents-template/sections/ + .agents/config/ -->
<!-- Regenerate with: make agents-md -->

# AGENTS.md


## Echoes — What It Is

Echoes is a multi-timeline storytelling platform. Characters' voices resonate across interconnected narratives. One man — Nic — at the center of every timeline.

### Timelines

| Timeline | Theme | Tone | Chapter length | Format |
|----------|-------|------|:--------------:|--------|
| ❤️ **Eros** | Passion, intensity, male interiority | Direct, sensorial, explicit | 1,800-2,200w | Serial (Ream) |
| 🌿 **Anima** | Growth, tenderness, family | Soft, contemplative, immersive | ~4,000w | Novels (Amazon KDP) |
| ✨ **Glow** | Lightness, pleasure, adult joy | Light, comic, warm, explicit | 1,800-2,200w | Serial (Ream) |
| 💫 **Pulse** | Intimate voices, fragments, confessions | Confessional, varied, explicit | 1,000-1,500w | Standalone (Substack) |
| 🌸 **Bloom** | Discovery, blossoming | Poetic, evocative | ~2,000w | Separate scope |

### Content Hierarchy

```
Timeline → Arc → [Episode/Volume] → Chapter (.md)
```

- **Eros**: episodes (ep01, ep02, ep03)
- **Anima**: volumes (vol1, vol2, vol3) or seasons (Between Decembers: s1, s2...s6)
- **Glow**: flat (no episodes — arc is linear)
- **Pulse**: flat (standalone pieces per arc)

### Naming Conventions

**Chapter filename (ALL timelines):**
```
ch{YYY}-{pov}-{title-slug}.md
```

**Directory structure:**
- Eros: `content/{arc}/ep{XX}-{slug}/ch{YYY}-{pov}-{slug}.md`
- Anima: `content/{arc}/vol{N}-{slug}/ch{YYY}-{pov}-{slug}.md` (or `s{N}-{slug}/` for Between Decembers)
- Glow: `content/{arc}/ch{YYY}-{pov}-{slug}.md`
- Pulse: `content/lei/{arc}/ch{YYY}-{pov}-{slug}.md`

### Frontmatter (Required Fields)

```yaml
---
pov: string          # lowercase character name
title: string        # max 100 chars
date: string         # "YYYY-MM-DD" or "YYYY-MM-DD, Description"
timeline: string     # eros | anima | glow | bloom | pulse
arc: string          # lowercase
episode: number      # episode/volume/season number
chapter: number      # sequential (matches ch{YYY} in filename)
summary: string      # max 300 chars — a REAL summary, not opening lines
location: string     # specific ("Apartment, Navigli" — never "home")
header_image: string # Two English AI prompts separated by | (atmosphere, not content)
---
```

**Optional:** `part`, `outfit`, `kink`, `heat` (0-5 scale, required for Eros/Glow).

### Echi Paralleli (Cross-Arc Rule)

Each arc is **autonomous**. No direct cross-arc references — ever. A reader of ALE must never need to have read CRI. Oblique echoes only: a gesture, a thought pattern, a word that the multi-timeline reader recognizes but the single-arc reader doesn't miss.


## Writing Rules

### Non-Negotiables

1. **One POV per chapter** — NO head-hopping, ever
2. **Show don't tell** — emotions through actions and physical details
3. **At least 3 senses per scene** (sight, sound, touch, smell, taste)
4. **Rich internal monologue** — deep dive into POV character's thoughts
5. **Female character outfits described** in ALL timelines
6. **Summary ≠ first sentences** — the `summary` field must be a real summary of what happens
7. **Specific locations** — never "home", "outside", "somewhere"
8. **Write in English** (primary). Italian loanwords where character-appropriate
9. **Complete frontmatter** with ALL required fields before finishing

### Anti-AI Voice (Critical)

Never do these — they make writing sound generated:
- **Meaning inflation**: "a pivotal moment", "fundamentally changed", "profoundly realized"
- **Gerund cascades**: "Walking through the door, feeling the weight, knowing that..."
- **Named emotions**: "he felt sadness" → show through action instead
- **Artificial symmetry**: three adjectives in a row, balanced parallel lists
- **Generic openings**: "The morning arrived...", "Sunlight filtered..."
- **Reflective closings**: "And in that moment I understood..."
- **Summarizing time**: "Weeks passed and he realized..."
- **Judging from inside POV**: Nic doesn't think "I'm a monster"

### Narrative Techniques

**Internal monologue:**
- Reveals deep POV thoughts, conflicts, subtext
- SPECIFIC thoughts, not abstract reflection
- Filtered through character's unique processing order

**Pacing:**
- Slow moments: long sentences, commas, sensory detail, space to breathe
- Fast moments: short sentences, action verbs, minimal description
- Vary within each chapter

**Dialogue:**
- Natural but curated — reveals character
- Action beats between lines (not "he said sadly")
- Messages (WhatsApp/Discord): `**Name emoji:** text` format

**Outfit descriptions:**
- Describe what female characters wear with evocative detail
- Fabric, fit, movement, what it reveals
- In male POV: notice how clothing interacts with the body

### Quality Gates (Self-Review)

After writing, verify:
- [ ] POV consistent (no head-hopping)
- [ ] 3+ senses engaged
- [ ] No anti-AI patterns
- [ ] Word count within timeline range
- [ ] Hook in first 3 lines
- [ ] Forward momentum at end
- [ ] At least one moment of humor (unless explicitly devastating)
- [ ] Outfit described (male POV chapters)


## Nic — Universal Protagonist

Nic is the protagonist of every Echoes timeline. Same man, same backstory, same patterns — different facets depending on the timeline.

### Core Identity

- Italian man, mid-30s, lives in Milan
- IT professional (tech lead / engineering manager)
- Divorced father of GioGio (daughter, early teens)
- Gamer (WoW, Steam library), music lover, cinephile
- Emotionally intelligent but uses humor as shield
- Thinks in lists, parentheticals, IT/gaming metaphors
- Processing order: rational → emotional → physical

### Physical / Behavioral Tells

- Notices eyes first, then body, then the person
- Self-deprecating humor as primary defense mechanism
- Long parenthetical thoughts (especially when stressed)
- Enumerates options when anxious (list-maker)
- Never says "basically" or "obviously" (those are Ale's)
- Fidgets with phone/objects when thinking

### Voice by Timeline

| Timeline | Nic's register |
|----------|---------------|
| **Eros** | Defensive, parentheticals as shield, humor as armor, constant tension |
| **Anima** | More introspective, less defensive, longer sentences, more space for thought |
| **Glow** | Lightest Nic — parentheticals as comic commentary, humor as joy |
| **Pulse** | Raw, nostalgic, confessional — looking back at specific moments |

### GioGio

- Nic's daughter, early teens
- Gen Alpha voice: slang, abbreviations, "it's giving sad dad energy"
- Protective of Nic but not heavy about it
- Appears in ALL timelines (sometimes marginally)
- Acute observer — sees everything Nic tries to hide

### The Continuity Bible

For the complete reference on Nic's backstory, family, relationships, cars, tech, ages, and timeline — use the `nic-bible` skill. The bible is the single source of truth for ANY factual detail about Nic.

**Rule:** If you're unsure about a detail (age, car model, apartment layout, family member name) — check the bible. Don't guess.


