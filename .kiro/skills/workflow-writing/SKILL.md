---
name: workflow-writing
description: Complete 7-step writing workflow from identification to database sync. Context gathering with MCP tools, planning brief, writing structure, validation, metadata generation. Use when starting a new chapter writing session.
---

# Workflow di Scrittura Echoes

## Workflow Completo

```
1. Identificazione → 2. Context Gathering → 3. Planning → 4. Scrittura → 5. Validazione → 6. Metadata → 7. Sync
```

## Step 1: Identificazione

Estrai da input: `timeline`, `arc`, `episode`, `chapter`, `pov`.

```typescript
// Verifica episodio esiste
const episodeInfo = await mcp.call('episode-info', { timeline, arc, episode })
// Se chapter non specificato, usa prossimo disponibile
const nextChapter = episodeInfo.totalChapters + 1
```

## Step 2: Context Gathering

### A. Verifica Database Sync
⚠️ Se RAG restituisce 0 risultati → `timeline-sync` + `rag-index`

### B. Capitolo Precedente
```typescript
if (chapter > 1) {
  const prevChapter = await mcp.call('chapter-info', { timeline, arc, episode, chapter: chapter - 1 })
}
```

### C. Context Narrativo (RAG)
```typescript
const context = await mcp.call('rag-context', { timeline, query: `sviluppo emotivo di ${pov} in ${arc}`, topK: 5 })
const similar = await mcp.call('rag-search', { timeline, query: 'tema della scena', topK: 3 })
const interactions = await mcp.call('rag-characters', { timeline, character: pov })
```

### D. Planning Documents
Leggi: `docs/characters/{pov}.md`, `docs/episodes/`, `docs/locations/`

## Step 3: Planning

Prepara writing brief con: POV, location, tema episodio, contesto narrativo, capitolo precedente, sviluppo personaggio, obiettivi capitolo, vincoli (lunghezza, tono).

## Step 4: Scrittura

- **Apertura (200-300w):** hook, POV/location/atmosfera
- **Sviluppo (1500-2000w):** scena principale, dialoghi, monologo interiore, dettagli sensoriali
- **Chiusura (200-300w):** risoluzione, riflessione, immagine finale

Checklist durante: POV consistente, 3+ sensi, show don't tell, tono timeline, pacing variabile.

## Step 5: Validazione

### Continuità (via RAG)
```typescript
// Personalità POV
rag-search({ timeline, query: `${pov} personalità comportamento`, topK: 5 })
// Location
rag-search({ timeline, query: `${location} descrizione`, topK: 3 })
// Relazioni
rag-search({ timeline, query: `relazione ${char1} ${char2}`, characters: [char1, char2], allCharacters: true })
```

Checklist: personalità consistente, location corretta, eventi referenziati correttamente, nessuna contraddizione.

## Step 6: Metadata e Frontmatter

```yaml
---
pov: ${pov}
title: "${title}"
date: "${date}, ${dayOfWeek}"
timeline: ${timeline}
arc: ${arc}
episode: ${episode}
chapter: ${chapter}
summary: "${summary}"
location: "${location}"
outfit: "${outfit}"      # opzionale
kink: "${kink}"          # opzionale
---
```

- Summary: riassunto capitolo (NON prime frasi), max 300 char
- Usa `words-count` MCP tool per conteggio (NON bash `wc`)

## Step 7: Salvataggio e Sync

### Filename
```
ep{XX}-ch{XXX}-{pov}-{title-slug}.md
```

### Path
```
content/{arc}/ep{XX}-{episode-title}/{filename}
```

### Sync
```typescript
// Singolo capitolo
await mcp.call('chapter-refresh', { timeline, arc, episode, chapter, filePath })
// Oppure sync completo
await mcp.call('timeline-sync', { timeline, contentPath: './content' })
// Re-index RAG
await mcp.call('rag-index', { timeline, contentPath: './content' })
```

### Aggiorna Arc Status (se necessario)
Se hai completato un episodio, aggiorna `content/{arc}/README.md`.

## Quick Reference

```
1. IDENTIFICA → timeline, arc, episode, chapter, pov
2. CONTEXT    → sync db, episode-info, rag-context, planning docs
3. SCRIVI     → apertura/sviluppo/chiusura, tono timeline
4. VALIDA     → continuità (RAG), checklist qualità
5. METADATA   → frontmatter completo, words-count
6. SYNC       → chapter-refresh o timeline-sync, rag-index
```
