---
name: mcp-tools-reference
description: All MCP tools with parameters, examples, and workflows. Content operations, database sync, RAG semantic search, statistics, timeline overview. Use when calling MCP tools or troubleshooting tool issues.
---

# MCP Tools Reference - Echoes

## Setup Iniziale

Prima di usare i RAG tools, il database DEVE essere sincronizzato:
```
timeline-sync → rag-index
```

Se RAG restituisce 0 risultati: probabilmente serve sync!

## Content Operations

### chapter-info
Ottiene metadata e statistiche di un capitolo.
```typescript
{ timeline, arc, episode, chapter }
→ { pov, title, date, location, wordCount, readingTime, summary, outfit?, kink? }
```

### episode-info
Ottiene metadata di un episodio e lista capitoli.
```typescript
{ timeline, arc, episode }
→ { title, theme, totalChapters, totalWords, chapters: [{ number, pov, title, wordCount }] }
```

### chapter-refresh
Aggiorna metadata di un singolo capitolo nel tracker.
```typescript
{ timeline, arc, episode, chapter, filePath }
```
Usare dopo aver modificato un capitolo.

### chapter-insert
Crea nuovo capitolo con frontmatter e auto-renumbering.
```typescript
{ timeline, arc, episode, chapter, pov, title, location }
```

### chapter-delete
Rimuove capitolo da filesystem e tracker. ⚠️ Irreversibile!
```typescript
{ timeline, arc, episode, chapter }
```

### episode-update
Aggiorna metadata di un episodio.
```typescript
{ timeline, arc, episode, title?, theme? }
```

## Database Sync

### timeline-sync
Sincronizza filesystem → tracker database (completo).
```typescript
{ timeline, contentPath }
```
Eseguire PRIMA di usare RAG tools, dopo modifiche massive, se RAG restituisce 0 risultati.

## RAG Operations

### rag-index
Indicizza capitoli per ricerca semantica. Prerequisito: `timeline-sync`.
```typescript
{ timeline, contentPath }
```

### rag-search
Ricerca semantica attraverso i capitoli.
```typescript
{ timeline, query, topK?: 5, characters?: string[], allCharacters?: false }
→ [{ chapter, episode, arc, pov, title, summary, similarity }]
```

Filtro personaggi: `allCharacters: true` = AND (entrambi presenti), `false` = OR.

**Esempi:**
```typescript
// Ricerca base
rag-search({ timeline: 'eros', query: 'momenti intensi', topK: 5 })

// Con filtro AND
rag-search({ timeline: 'anima', query: 'conversazione', characters: ['marie', 'nic'], allCharacters: true })
```

### rag-context
Ottiene context narrativo formattato per AI.
```typescript
{ timeline, query, topK?, characters?, allCharacters? }
→ { context: string, sources: [{ chapter, episode, pov, title }] }
```

### rag-characters
Scopre interazioni di un personaggio.
```typescript
{ timeline, character }
→ { character, interactions: [{ otherCharacter, chapterCount, chapters }] }
```

## Statistics

### timeline-overview
Overview rapida di tutti gli archi: status, capitoli, parole, POV, ultima modifica.
```typescript
{ contentPath }
```

### stats
Statistiche aggregate con filtri.
```typescript
{ timeline?, arc?, episode? }
→ { totalChapters, totalWords, totalReadingTime, averageChapterLength, povDistribution, locationDistribution }
```

## Workflow Tipici

### Scrivere Nuovo Capitolo
```
1. episode-info → verifica stato episodio
2. rag-context → raccogli background narrativo
3. rag-search → cerca scene simili
4. [scrivi capitolo]
5. timeline-sync → aggiorna database
```

### Verificare Continuità
```
1. chapter-info → capitolo precedente
2. rag-search con characters + allCharacters:true → interazioni
3. rag-search → uso location
```

## Best Practices

- TopK 3-5 per ricerche mirate, 5-10 per context ampio
- Usa filtri personaggi quando sai chi cerchi
- Sync regolare: dopo ogni sessione di scrittura, prima di usare RAG
- Se RAG restituisce 0 risultati → `timeline-sync` + `rag-index`
