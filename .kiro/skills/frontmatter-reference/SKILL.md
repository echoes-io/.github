---
name: frontmatter-reference
description: Complete YAML frontmatter schema, field validation rules, required and optional fields, date format, summary rules, examples per timeline. Use when creating, editing, or validating chapter frontmatter and metadata.
---

# Metadata e Frontmatter Echoes

## Schema Frontmatter Completo

```yaml
---
pov: string          # Point of view character (required)
title: string        # Chapter title (required)
date: string         # Date with description (required, e.g. "2024-04-19, Friday")
timeline: string     # Timeline name (required)
arc: string          # Arc name (required)
episode: number      # Episode number (required)
part: number         # Part number (optional, nullable)
chapter: number      # Chapter number (required)
summary: string      # Chapter summary (required)
location: string     # Scene location (required)
outfit: string       # Main female characters' outfits (optional)
kink: string         # Content tags (optional, mainly Eros)
---
```

## Campi Obbligatori

### pov (string)
- Lowercase, no spazi, nome semplice
- Esempi validi: `marie`, `nic`, `ale`, `gio`
- ❌ NON: `Marie`, `marie-anne`, `Marie Dubois`

### title (string)
- Max 100 caratteri, descrittivo ma conciso
- Può essere poetico/evocativo
- ❌ NON: "Chapter 1", "Untitled"

### date (string)
- Formato: `"YYYY-MM-DD, Description"`
- Esempi: `"2024-04-19, Friday"`, `"2024-12-25, Christmas Day"`
- ⚠️ NON usare ISO timestamp

### timeline (string)
- Valori validi: `anima`, `eros`, `bloom`, `pulse`
- Lowercase

### arc (string)
- Lowercase, no spazi
- Esempi: `matilde`, `anima`, `ale`, `gio`, `work`

### episode (number)
- Intero positivo (1, 2, 3...)
- Nel frontmatter: senza padding (1, 12)
- Nel filename: con padding (ep01, ep12)

### chapter (number)
- Intero positivo (1, 2, 3...)
- Nel frontmatter: senza padding (1, 15)
- Nel filename: con padding (ch001, ch015)

### summary (string)
- Riassunto conciso del capitolo (NON le prime frasi)
- Max 300 caratteri
- Cattura eventi principali e sviluppo emotivo

Esempi validi:
```yaml
summary: "Nic vola da Milano a Londra per incontrare la sua gilda di WoW. Ansioso all'aeroporto, arriva al Meltdown pub dove scopre che James, Tom e Marie sono persone reali e accoglienti."
summary: "Marie si sveglia nell'appartamento di Nic. Riflette sulla notte passata e su come si sente finalmente al sicuro."
```

### location (string)
- Specifico, non generico
- ✅ "Apartment", "Office", "Marie's Bedroom"
- ❌ "home", "outside", "somewhere"

## Campi Opzionali

### part (number, nullable)
- Solo per episodi molto lunghi con suddivisioni
- Default: omettere o `null`

### outfit (string)
- Descrizione outfit di TUTTI i personaggi femminili principali nella scena (non solo POV)
- Solo se rilevante per la scena
- Esempio: `"Marie: green sweater and jeans; Angi: black dress"`

### kink (string)
- Tag comma-separated, descrittivi
- Principalmente per Eros, raramente per altre timeline
- Esempio: `"intimacy, tenderness"`, `"intensity, passion"`

## Validazione

### Regole
- Tutti i campi required presenti e non vuoti
- `title`: max 100 char
- `summary`: max 300 char
- `date`: formato "YYYY-MM-DD, Description"
- `timeline`: uno dei valori validi
- `episode`, `chapter`: interi positivi

### Coerenza Filename
- `ep{episode}` nel filename = `episode` nel frontmatter
- `ch{chapter}` nel filename = `chapter` nel frontmatter
- `{pov}` nel filename = `pov` nel frontmatter

### Errori Comuni

```yaml
# ❌ date non nel formato corretto
date: "2025-12-02T10:30:00.000Z"
# ✅ CORRETTO
date: "2025-12-02, Tuesday"

# ❌ summary troppo lungo (>300 char)
# ✅ Tronca a 300 char

# ❌ location generica
location: "home"
# ✅ CORRETTO
location: "Apartment"
```

## Esempi Completi

### Frontmatter Minimo
```yaml
---
pov: marie
title: "Awakening"
date: "2025-12-02, Tuesday"
timeline: anima
arc: matilde
episode: 1
chapter: 3
summary: "Marie si svegliò con il sole negli occhi. Per un momento non ricordò dove fosse."
location: "Apartment"
---
```

### Frontmatter Eros (Con Optional)
```yaml
---
pov: ale
title: "Intensity"
date: "2025-12-02, Tuesday"
timeline: eros
arc: ale
episode: 12
chapter: 45
summary: "Le dita di Ale tracciarono la linea della sua schiena con una lentezza deliberata."
location: "Bedroom"
outfit: "Black silk robe"
kink: "intensity, passion, vulnerability"
---
```

## Arc README Frontmatter

Ogni arc directory contiene `README.md`:
```yaml
---
status: planned | active | hiatus | complete
episodes:
  ep01-titolo: complete
  ep02-titolo: active
---
```

## Episode Outline Frontmatter

File in `docs/episodes/`:
```yaml
---
chapters: 30
---
# Episode 1: Titolo
```

`chapters` = numero totale capitoli pianificati. Naming: `{arc}-{epXX}-{slug}.md`.
