# Struttura Contenuti Echoes

## Gerarchia Completa

```
Timeline (universo narrativo)
├── Arc (fase della storia)
│   ├── Episode (evento narrativo)
│   │   ├── Part (suddivisione opzionale)
│   │   │   └── Chapter (file .md individuale)
```

## Livelli della Gerarchia

### Timeline
**Definizione:** Universo narrativo con tono e atmosfera distintivi

**Timelines Attive:**
- `anima` - Crescita, supporto, tenerezza
- `eros` - Passione, intensità, emozione cruda
- `bloom` - Scoperta, equilibrio, fioritura
- `pulse` - Diario personale di Nic

**Caratteristiche:**
- Nome univoco (lowercase, no spazi)
- Palette colori dedicata (via @echoes-io/brand)
- Tono narrativo distintivo
- Database tracker separato

### Arc
**Definizione:** Fase narrativa all'interno di una timeline

**Esempi:**
- `anima/matilde` - Primi 5 capitoli di Anima
- `anima/anima` - Arc principale di Anima (50 capitoli)
- `eros/ale` - Arc di Ale (122 capitoli)
- `eros/gio` - Arc di Gio (57 capitoli)
- `eros/work` - Arc lavorativo (87 capitoli)

**Caratteristiche:**
- Nome descrittivo (lowercase, no spazi)
- Può contenere più episodi
- Rappresenta una fase o tema narrativo

### Episode
**Definizione:** Evento narrativo completo, composto da più capitoli

**Numerazione:** 2 cifre con zero padding (01, 02, 12)

**Naming Convention:**
```
ep{XX}-{episode-title}
```

**Esempi:**
- `ep01-new-life`
- `ep03-growth`
- `ep12-transformation`

**Caratteristiche:**
- Numero progressivo all'interno dell'arc
- Titolo descrittivo (lowercase, trattini)
- Contiene 5-15 capitoli tipicamente
- Struttura narrativa completa (setup, sviluppo, risoluzione)

### Part (OPZIONALE)
**Definizione:** Suddivisione opzionale di un episodio

**⚠️ IMPORTANTE:**
- Part è un livello OPZIONALE
- Non tutti gli episodi hanno parts
- Chapter dipende da Episode, NON da Part
- `partNumber` nel frontmatter è nullable

**Quando usare Parts:**
- Episodi molto lunghi (>15 capitoli)
- Necessità di suddividere in sotto-archi
- Struttura narrativa complessa

**Quando NON usare Parts:**
- Episodi standard (5-15 capitoli)
- Struttura lineare semplice
- Default: non usare parts

### Chapter
**Definizione:** Singolo file markdown, unità base della narrazione

**Numerazione:** 3 cifre con zero padding (001, 015, 123)

**Naming Convention:**
```
ep{XX}-ch{XXX}-{pov}-{title-slug}.md
```

**Esempi:**
- `ep01-ch001-marie-awakening.md`
- `ep03-ch015-nic-reflection.md`
- `ep12-ch045-ale-intensity.md`

**Caratteristiche:**
- Numero progressivo all'interno dell'episodio
- POV singolo (no head-hopping)
- Lunghezza ideale: 2000-3000 parole
- Frontmatter YAML completo

## Struttura Filesystem

### Layout Standard

```
timeline-{name}/
├── content/                          # Tutti i capitoli
│   ├── {arc-name}/                  # Arc directory
│   │   ├── ep01-{episode-title}/   # Episode directory
│   │   │   ├── ep01-ch001-{pov}-{title}.md
│   │   │   ├── ep01-ch002-{pov}-{title}.md
│   │   │   └── ...
│   │   ├── ep02-{episode-title}/
│   │   │   └── ...
│   │   └── ...
│   └── {another-arc}/
│       └── ...
│
├── docs/                            # Planning documents
│   ├── characters/                  # Character sheets
│   │   ├── marie.md
│   │   ├── nic.md
│   │   └── ...
│   ├── episodes/                    # Episode outlines
│   │   ├── ep01-new-life.md
│   │   ├── ep02-discovery.md
│   │   └── ...
│   └── locations/                   # Location descriptions
│       ├── apartment.md
│       ├── office.md
│       └── ...
│
└── .kiro/                           # Kiro agent config
    └── agent.json
```

### Esempio Concreto: Anima

```
timeline-anima/
├── content/
│   ├── matilde/
│   │   └── ep01-inizio/
│   │       ├── ep01-ch001-marie-awakening.md
│   │       ├── ep01-ch002-marie-morning.md
│   │       ├── ep01-ch003-marie-reflection.md
│   │       ├── ep01-ch004-nic-perspective.md
│   │       └── ep01-ch005-marie-evening.md
│   │
│   └── anima/
│       ├── ep01-new-life/
│       │   ├── ep01-ch001-marie-beginning.md
│       │   └── ...
│       ├── ep02-growth/
│       │   └── ...
│       └── ...
│
└── docs/
    ├── characters/
    │   ├── marie.md
    │   └── nic.md
    ├── episodes/
    │   ├── ep01-inizio.md
    │   └── ep01-new-life.md
    └── locations/
        └── apartment.md
```

## Frontmatter Schema

Ogni capitolo DEVE avere un frontmatter YAML completo:

```yaml
---
pov: string          # Point of view character (required)
title: string        # Chapter title (required)
date: string         # ISO 8601 timestamp (required)
timeline: string     # Timeline name (required)
arc: string          # Arc name (required)
episode: number      # Episode number (required)
part: number         # Part number (optional, nullable)
chapter: number      # Chapter number (required)
excerpt: string      # Short description, max 300 chars (required)
location: string     # Scene location (required)
outfit: string       # Character outfit (optional)
kink: string         # Content tags (optional, mainly for Eros)
---
```

### Campi Obbligatori

**pov** (string)
- Nome del personaggio POV
- Lowercase, no spazi
- Esempi: `marie`, `nic`, `ale`, `gio`

**title** (string)
- Titolo del capitolo
- Max 100 caratteri
- Descrittivo ma conciso
- Esempi: `"Awakening"`, `"Morning Light"`, `"Reflection"`

**date** (string)
- Formato ISO 8601: `2025-12-02T10:30:00.000Z`
- UTC timezone
- Timestamp completo

**timeline** (string)
- Nome timeline
- Valori validi: `anima`, `eros`, `bloom`, `pulse`

**arc** (string)
- Nome arc
- Lowercase, no spazi
- Esempi: `matilde`, `anima`, `ale`, `gio`

**episode** (number)
- Numero episodio
- Intero positivo
- Corrisponde al numero in `ep{XX}`

**chapter** (number)
- Numero capitolo
- Intero positivo
- Corrisponde al numero in `ch{XXX}`

**excerpt** (string)
- Breve descrizione del capitolo
- Max 300 caratteri
- Prime 2-3 frasi del capitolo
- Cattura atmosfera/tema

**location** (string)
- Luogo principale della scena
- Specifico, non generico
- Esempi: `"Apartment"`, `"Office"`, `"Central Park"`
- Evitare: `"home"`, `"outside"`, `"somewhere"`

### Campi Opzionali

**part** (number, nullable)
- Numero part (se l'episodio usa parts)
- Null se l'episodio non ha parts
- La maggior parte dei capitoli avrà `part: null`

**outfit** (string, optional)
- Descrizione concisa dell'abbigliamento
- Solo se rilevante per la scena
- Esempi: `"Green sweater and jeans"`, `"Black dress"`

**kink** (string, optional)
- Tag di contenuto (principalmente per Eros)
- Comma-separated
- Esempi: `"intimacy, tenderness"`, `"intensity, passion"`

## Validazione

### Zod Schema
Tutti i frontmatter sono validati con Zod schema da `@echoes-io/models`:

```typescript
import { chapterFrontmatterSchema } from '@echoes-io/models'

const validated = chapterFrontmatterSchema.parse(frontmatter)
```

### Regole di Validazione

**Naming Consistency:**
- Filename DEVE corrispondere a frontmatter
- `ep{episode}` nel filename = `episode` nel frontmatter
- `ch{chapter}` nel filename = `chapter` nel frontmatter
- `{pov}` nel filename = `pov` nel frontmatter

**Content Validation:**
- Word count > 100 (capitolo troppo corto)
- Word count < 10000 (capitolo troppo lungo, warning)
- Excerpt non vuoto e < 300 caratteri
- Date in formato ISO 8601 valido

**Referential Integrity:**
- Timeline esiste nel sistema
- Arc esiste nella timeline
- Episode esiste nell'arc
- Chapter number unico nell'episodio

## Database Sync

### Tracker Database
Ogni timeline ha un database SQLite tracker che mantiene:
- Metadata di tutti i capitoli
- Statistiche (word count, reading time)
- Relazioni tra timeline/arc/episode/chapter
- Indici per query veloci

### Sync Workflow

**1. Filesystem → Tracker**
```bash
timeline-sync --timeline <timeline> --contentPath ./content
```

**2. Tracker → RAG**
```bash
rag-index --timeline <timeline> --contentPath ./content
```

**⚠️ IMPORTANTE:**
- Sync DEVE essere fatto prima di usare RAG tools
- Se RAG restituisce 0 risultati, probabilmente serve sync
- Sync automatico via git hooks (husky) su commit

## Best Practices

### Organizzazione File
✅ Segui naming convention rigorosamente  
✅ Un capitolo = un file  
✅ Raggruppa per episode in directory  
✅ Mantieni structure pulita e consistente

### Frontmatter
✅ Compila tutti i campi obbligatori  
✅ Usa date ISO 8601 con timezone UTC  
✅ Excerpt conciso ma informativo  
✅ Location specifica e consistente  
✅ Valida con Zod prima di salvare

### Database
✅ Sync dopo ogni modifica ai file  
✅ Verifica sync prima di usare RAG  
✅ Usa `chapter-refresh` per singoli capitoli  
✅ Usa `timeline-sync` per sync completo

### Planning Docs
✅ Mantieni character sheets aggiornati  
✅ Scrivi episode outlines prima di iniziare  
✅ Documenta locations per consistenza  
✅ Usa planning docs come riferimento durante scrittura

---

**Questa struttura garantisce coerenza e facilita l'automazione.**
