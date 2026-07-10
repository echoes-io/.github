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
- **Anima**: volumes (vol1, vol2, vol3)
- **Glow**: flat (no episodes — arc is linear)
- **Pulse**: flat (standalone pieces per arc)

### Naming Conventions

**Chapter filename (ALL timelines):**
```
ch{YYY}-{pov}-{title-slug}.md
```

**Directory structure:**
- Eros: `content/{arc}/ep{XX}-{slug}/ch{YYY}-{pov}-{slug}.md`
- Anima: `content/{arc}/vol{N}-{slug}/ch{YYY}-{pov}-{slug}.md`
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
episode: number      # episode/volume number
chapter: number      # sequential (matches ch{YYY} in filename)
summary: string      # max 300 chars — a REAL summary, not opening lines
location: string     # specific ("Apartment, Navigli" — never "home")
header_image: string # English AI prompt for chapter header image (atmosphere, not content)
---
```

**Optional:** `part`, `outfit`, `kink`, `heat` (0-5 scale, required for Eros/Glow).

### Echi Paralleli (Cross-Arc Rule)

Each arc is **autonomous**. No direct cross-arc references — ever. A reader of ALE must never need to have read CRI. Oblique echoes only: a gesture, a thought pattern, a word that the multi-timeline reader recognizes but the single-arc reader doesn't miss.
