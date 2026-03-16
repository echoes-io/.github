---
name: content-structure
description: Filesystem layout, directory hierarchy, naming conventions, episode and chapter numbering, database sync workflow, arc README format. Use when creating files, directories, or verifying content organization.
---

# Struttura Contenuti Echoes

## Gerarchia

```
Timeline (universo narrativo)
├── Arc (fase della storia)
│   ├── Episode (evento narrativo)
│   │   ├── Part (opzionale)
│   │   │   └── Chapter (file .md)
```

- Part è OPZIONALE, chapter dipende da episode (non da part)
- `partNumber` nel frontmatter è nullable

## Naming Conventions

### Episode Directory
```
ep{XX}-{episode-title}
```
- 2 cifre con zero padding: ep01, ep02, ep12
- Titolo: lowercase, trattini
- Esempi: `ep01-new-life`, `ep03-growth`, `ep12-transformation`

### Chapter File
```
ep{XX}-ch{XXX}-{pov}-{title-slug}.md
```
- Episode: 2 cifre (ep01)
- Chapter: 3 cifre (ch001, ch015, ch123)
- POV: lowercase (marie, nic, ale)
- Esempi: `ep01-ch001-marie-awakening.md`, `ep12-ch045-ale-intensity.md`

### Arc Directory
- Lowercase, no spazi
- Esempi: `matilde`, `anima`, `ale`, `gio`, `work`

## Filesystem Layout

```
timeline-{name}/
├── content/
│   └── {arc-name}/
│       ├── README.md                    # Status arco
│       ├── ep01-{episode-title}/
│       │   ├── ep01-ch001-{pov}-{title}.md
│       │   ├── ep01-ch002-{pov}-{title}.md
│       │   └── ...
│       └── ep02-{episode-title}/
│           └── ...
├── docs/
│   ├── characters/          # Character sheets
│   ├── episodes/            # Episode outlines
│   │   └── {arc}-{epXX}-{slug}.md
│   ├── locations/           # Location descriptions
│   └── timeline-steering.md # Timeline-specific steering
└── .kiro/
    ├── agents/
    └── prompts/
```

### Versioni Archiviate
- Directory con `-old-` nel nome (es. `ep01-old-london-calling/`) sono archiviate
- Ignorate da `timeline-overview`, non contano nelle statistiche

## Arc README

Ogni arc ha `content/{arc}/README.md`:
```yaml
---
status: planned | active | hiatus | complete
episodes:
  ep01-titolo: complete
  ep02-titolo: active
---
# Arco Nome
```

Status validi: `planned`, `active`, `hiatus`, `complete`.
Aggiornare quando si completa un episodio o arco.

## Episode Outline

File in `docs/episodes/` con frontmatter:
```yaml
---
chapters: 30
---
# Episode 1: Titolo
```

Naming: `{arc}-{epXX}-{slug}.md` (es. `cri-ep03-due-sangui.md`).
`chapters` = numero totale capitoli pianificati.

## Validazione

### Naming Consistency
- `ep{episode}` nel filename = `episode` nel frontmatter
- `ch{chapter}` nel filename = `chapter` nel frontmatter
- `{pov}` nel filename = `pov` nel frontmatter

### Content Validation
- Word count > 100 (troppo corto)
- Word count < 10000 (warning)
- Summary non vuoto e < 300 char
- Date in formato "YYYY-MM-DD, Description"

## Database Sync

### Tracker Database
Ogni timeline ha un database SQLite che mantiene metadata, statistiche, relazioni, indici.

### Sync Workflow
```bash
# 1. Filesystem → Tracker
timeline-sync --timeline <timeline> --contentPath ./content

# 2. Tracker → RAG
rag-index --timeline <timeline> --contentPath ./content
```

⚠️ Sync DEVE essere fatto prima di usare RAG tools.
Se RAG restituisce 0 risultati → serve sync.
