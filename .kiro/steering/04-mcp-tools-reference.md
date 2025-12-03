# MCP Tools Reference - Echoes

## Panoramica

Il package `@echoes-io/mcp-server` fornisce tools MCP (Model Context Protocol) per operazioni su contenuti Echoes.

**Installazione:**
```bash
npx -y @echoes-io/mcp-server@latest
```

**Configurazione Kiro:**
```json
{
  "mcpServers": {
    "echoes-mcp": {
      "type": "stdio",
      "command": "npx",
      "args": ["-y", "@echoes-io/mcp-server@latest"]
    }
  }
}
```

## ⚠️ Setup Iniziale IMPORTANTE

Prima di usare i RAG tools, il database tracker DEVE essere sincronizzato:

```bash
# 1. Sync filesystem → tracker database
timeline-sync --timeline <timeline> --contentPath ./content

# 2. Index tracker → RAG database
rag-index --timeline <timeline> --contentPath ./content
```

**Se RAG restituisce 0 risultati:** probabilmente serve sync!

## Categorie Tools

1. **Content Operations** - Info su capitoli ed episodi
2. **Database Sync** - Sincronizzazione filesystem ↔ tracker
3. **RAG Operations** - Ricerca semantica e context retrieval
4. **Statistics** - Statistiche aggregate
5. **Book Generation** - Compilazione LaTeX

---

## Content Operations

### chapter-info

**Descrizione:** Ottiene metadata e statistiche di un capitolo specifico

**Parametri:**
```typescript
{
  timeline: string    // Nome timeline (anima, eros, bloom, pulse)
  arc: string        // Nome arc
  episode: number    // Numero episodio
  chapter: number    // Numero capitolo
}
```

**Output:**
```typescript
{
  pov: string
  title: string
  date: string
  location: string
  wordCount: number
  readingTime: number  // minuti
  excerpt: string
  outfit?: string
  kink?: string
}
```

**Esempio:**
```typescript
const info = await mcp.call('chapter-info', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  chapter: 3
})
// → { pov: 'marie', title: 'Awakening', wordCount: 2847, ... }
```

**Quando usare:**
- Verificare metadata di un capitolo esistente
- Controllare word count
- Ottenere info per context gathering



### episode-info

**Descrizione:** Ottiene metadata di un episodio e lista dei suoi capitoli

**Parametri:**
```typescript
{
  timeline: string
  arc: string
  episode: number
}
```

**Output:**
```typescript
{
  title: string
  theme: string
  totalChapters: number
  totalWords: number
  chapters: Array<{
    number: number
    pov: string
    title: string
    wordCount: number
  }>
}
```

**Esempio:**
```typescript
const info = await mcp.call('episode-info', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1
})
// → { title: 'Inizio', totalChapters: 5, chapters: [...] }
```

**Quando usare:**
- Vedere struttura completa di un episodio
- Verificare numero capitoli esistenti
- Pianificare prossimo capitolo da scrivere

### chapter-refresh

**Descrizione:** Aggiorna metadata di un singolo capitolo nel tracker

**Parametri:**
```typescript
{
  timeline: string
  arc: string
  episode: number
  chapter: number
  filePath: string  // Path completo al file .md
}
```

**Esempio:**
```typescript
await mcp.call('chapter-refresh', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  chapter: 3,
  filePath: '/path/to/timeline-anima/content/matilde/ep01-inizio/ep01-ch003-marie-awakening.md'
})
```

**Quando usare:**
- Dopo aver modificato un capitolo
- Per aggiornare word count
- Per correggere metadata nel tracker

### chapter-insert

**Descrizione:** Crea nuovo capitolo con frontmatter e auto-renumbering

**Parametri:**
```typescript
{
  timeline: string
  arc: string
  episode: number
  chapter: number
  pov: string
  title: string
  location: string
}
```

**Esempio:**
```typescript
await mcp.call('chapter-insert', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  chapter: 6,
  pov: 'marie',
  title: 'New Beginning',
  location: 'Apartment'
})
```

**Quando usare:**
- Creare nuovo capitolo con template
- Auto-generare frontmatter
- Inserire capitolo in mezzo ad altri (auto-renumbering)

### chapter-delete

**Descrizione:** Rimuove capitolo da filesystem e tracker

**Parametri:**
```typescript
{
  timeline: string
  arc: string
  episode: number
  chapter: number
}
```

**Esempio:**
```typescript
await mcp.call('chapter-delete', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  chapter: 3
})
```

**Quando usare:**
- Eliminare capitolo non più necessario
- Pulizia dopo ristrutturazione

**⚠️ ATTENZIONE:** Operazione irreversibile!

### episode-update

**Descrizione:** Aggiorna metadata di un episodio

**Parametri:**
```typescript
{
  timeline: string
  arc: string
  episode: number
  title?: string
  theme?: string
}
```

**Esempio:**
```typescript
await mcp.call('episode-update', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  title: 'New Title',
  theme: 'Growth and discovery'
})
```

**Quando usare:**
- Aggiornare titolo episodio
- Modificare tema/descrizione

---

## Database Sync

### timeline-sync

**Descrizione:** Sincronizza filesystem → tracker database (completo)

**Parametri:**
```typescript
{
  timeline: string
  contentPath: string  // Path alla directory content/
}
```

**Esempio:**
```typescript
await mcp.call('timeline-sync', {
  timeline: 'anima',
  contentPath: '/path/to/timeline-anima/content'
})
```

**Quando usare:**
- Prima volta setup
- Dopo aver aggiunto molti capitoli
- Se RAG restituisce 0 risultati
- Dopo modifiche massive al filesystem

**⚠️ IMPORTANTE:**
- Deve essere eseguito PRIMA di usare RAG tools
- Sync automatico via git hooks (husky)
- Può richiedere tempo per timeline grandi

---

## RAG Operations

### rag-index

**Descrizione:** Indicizza capitoli per ricerca semantica

**Parametri:**
```typescript
{
  timeline: string
  contentPath: string
}
```

**Esempio:**
```typescript
await mcp.call('rag-index', {
  timeline: 'anima',
  contentPath: '/path/to/timeline-anima/content'
})
```

**Quando usare:**
- Dopo `timeline-sync`
- Prima di usare `rag-search` o `rag-context`
- Dopo aver aggiunto nuovi capitoli

**⚠️ PREREQUISITO:** `timeline-sync` deve essere eseguito prima!



### rag-search

**Descrizione:** Ricerca semantica attraverso i capitoli

**Parametri:**
```typescript
{
  timeline: string
  query: string              // Query di ricerca
  topK?: number             // Numero risultati (default: 5)
  characters?: string[]     // Filtro per personaggi
  allCharacters?: boolean   // true = AND, false = OR (default: false)
}
```

**Output:**
```typescript
Array<{
  chapter: number
  episode: number
  arc: string
  pov: string
  title: string
  excerpt: string
  similarity: number  // 0-1
}>
```

**Esempi:**

**Ricerca base:**
```typescript
const results = await mcp.call('rag-search', {
  timeline: 'anima',
  query: 'momenti di intimità emotiva',
  topK: 5
})
```

**Ricerca con filtro personaggi (OR):**
```typescript
const results = await mcp.call('rag-search', {
  timeline: 'eros',
  query: 'momenti intensi',
  characters: ['ale', 'gio'],
  allCharacters: false  // Capitoli con ALE O GIO
})
```

**Ricerca con filtro personaggi (AND):**
```typescript
const results = await mcp.call('rag-search', {
  timeline: 'anima',
  query: 'conversazione profonda',
  characters: ['marie', 'nic'],
  allCharacters: true  // Capitoli con MARIE E NIC insieme
})
```

**Quando usare:**
- Trovare scene simili a quella che stai scrivendo
- Verificare come hai trattato un tema in passato
- Scoprire interazioni tra personaggi specifici
- Ricerca per atmosfera/emozione

### rag-context

**Descrizione:** Ottiene context narrativo rilevante per AI

**Parametri:**
```typescript
{
  timeline: string
  query: string
  topK?: number
  characters?: string[]
  allCharacters?: boolean
}
```

**Output:**
```typescript
{
  context: string  // Testo formattato per AI context
  sources: Array<{
    chapter: number
    episode: number
    pov: string
    title: string
  }>
}
```

**Esempio:**
```typescript
const context = await mcp.call('rag-context', {
  timeline: 'anima',
  query: 'sviluppo emotivo di Marie nell\'arc matilde',
  topK: 5
})

// context.context contiene testo formattato:
// "Capitolo ep01-ch001 (Marie - Awakening):
//  Marie si svegliò con il sole negli occhi..."
```

**Quando usare:**
- Prima di scrivere un nuovo capitolo
- Per raccogliere background narrativo
- Per context injection in AI prompts
- Per verificare continuità

### rag-characters

**Descrizione:** Scopre interazioni di un personaggio

**Parametri:**
```typescript
{
  timeline: string
  character: string  // Nome personaggio
}
```

**Output:**
```typescript
{
  character: string
  interactions: Array<{
    otherCharacter: string
    chapterCount: number
    chapters: Array<{
      chapter: number
      episode: number
      arc: string
      title: string
    }>
  }>
}
```

**Esempio:**
```typescript
const interactions = await mcp.call('rag-characters', {
  timeline: 'anima',
  character: 'marie'
})

// → {
//   character: 'marie',
//   interactions: [
//     { otherCharacter: 'nic', chapterCount: 15, chapters: [...] },
//     { otherCharacter: 'angi', chapterCount: 3, chapters: [...] }
//   ]
// }
```

**Quando usare:**
- Scoprire con chi interagisce un personaggio
- Verificare storia di una relazione
- Pianificare nuove interazioni
- Analizzare dinamiche narrative

---

## Statistics

### stats

**Descrizione:** Statistiche aggregate con filtri

**Parametri:**
```typescript
{
  timeline?: string    // Filtra per timeline
  arc?: string        // Filtra per arc
  episode?: number    // Filtra per episode
}
```

**Output:**
```typescript
{
  totalChapters: number
  totalWords: number
  totalReadingTime: number  // minuti
  averageChapterLength: number
  povDistribution: Record<string, number>
  locationDistribution: Record<string, number>
}
```

**Esempi:**

**Stats intera timeline:**
```typescript
const stats = await mcp.call('stats', {
  timeline: 'anima'
})
// → { totalChapters: 55, totalWords: 145000, ... }
```

**Stats singolo arc:**
```typescript
const stats = await mcp.call('stats', {
  timeline: 'eros',
  arc: 'ale'
})
// → { totalChapters: 122, totalWords: 320000, ... }
```

**Stats singolo episodio:**
```typescript
const stats = await mcp.call('stats', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1
})
// → { totalChapters: 5, totalWords: 12500, ... }
```

**Quando usare:**
- Monitorare progresso scrittura
- Verificare bilanciamento POV
- Analizzare uso locations
- Report e dashboard

---

## Book Generation

### book-generate

**Descrizione:** Compila libro LaTeX da capitoli

**Parametri:**
```typescript
{
  timeline: string
  arc?: string        // Opzionale: solo un arc
  episode?: number    // Opzionale: solo un episodio
  outputPath: string  // Path per PDF output
}
```

**Esempio:**

**Libro completo timeline:**
```typescript
await mcp.call('book-generate', {
  timeline: 'anima',
  outputPath: '/path/to/output/anima-complete.pdf'
})
```

**Libro singolo arc:**
```typescript
await mcp.call('book-generate', {
  timeline: 'eros',
  arc: 'ale',
  outputPath: '/path/to/output/eros-ale.pdf'
})
```

**Libro singolo episodio:**
```typescript
await mcp.call('book-generate', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  outputPath: '/path/to/output/anima-matilde-ep01.pdf'
})
```

**Quando usare:**
- Generare PDF per review
- Creare versioni stampabili
- Backup formattato
- Condivisione con beta readers

**⚠️ PREREQUISITI:**
- LaTeX installato sul sistema
- `@echoes-io/books-generator` configurato

---

## Workflow Tipici

### Workflow: Scrivere Nuovo Capitolo

```typescript
// 1. Verifica episodio corrente
const episodeInfo = await mcp.call('episode-info', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1
})
// → Vedo che ci sono 5 capitoli, scrivo il 6°

// 2. Raccogli context narrativo
const context = await mcp.call('rag-context', {
  timeline: 'anima',
  query: 'sviluppo emotivo Marie episodio 1',
  topK: 5
})

// 3. Cerca scene simili
const similar = await mcp.call('rag-search', {
  timeline: 'anima',
  query: 'momenti di riflessione mattutina',
  topK: 3
})

// 4. Scrivi capitolo...

// 5. Sync database
await mcp.call('timeline-sync', {
  timeline: 'anima',
  contentPath: './content'
})
```

### Workflow: Verificare Continuità

```typescript
// 1. Ottieni info capitolo precedente
const prevChapter = await mcp.call('chapter-info', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1,
  chapter: 5
})

// 2. Cerca interazioni tra personaggi
const interactions = await mcp.call('rag-search', {
  timeline: 'anima',
  query: 'Marie e Nic conversazione',
  characters: ['marie', 'nic'],
  allCharacters: true
})

// 3. Verifica uso location
const locationHistory = await mcp.call('rag-search', {
  timeline: 'anima',
  query: 'Apartment descrizione',
  topK: 10
})
```

### Workflow: Analisi Timeline

```typescript
// 1. Stats generali
const overallStats = await mcp.call('stats', {
  timeline: 'eros'
})

// 2. Stats per arc
const aleStats = await mcp.call('stats', {
  timeline: 'eros',
  arc: 'ale'
})

// 3. Interazioni personaggio
const aleInteractions = await mcp.call('rag-characters', {
  timeline: 'eros',
  character: 'ale'
})
```

---

## Best Practices

### Context Gathering

✅ **Usa `rag-context` per background generale**
- Query descrittive del tema/atmosfera
- TopK 5-10 per context ampio

✅ **Usa `rag-search` per scene specifiche**
- Query precise su situazioni simili
- Filtri personaggi quando rilevante
- TopK 3-5 per risultati mirati

✅ **Usa `rag-characters` per relazioni**
- Scopri storia interazioni
- Verifica dinamiche passate
- Pianifica sviluppi futuri

### Database Sync

✅ **Sync regolare**
- Dopo ogni sessione di scrittura
- Prima di usare RAG tools
- Automatico via git hooks

✅ **Verifica sync**
- Se RAG restituisce 0 risultati
- Dopo modifiche massive
- Prima di operazioni importanti

### Performance

✅ **TopK appropriato**
- 3-5 per ricerche mirate
- 5-10 per context ampio
- Non esagerare (rallenta query)

✅ **Filtri personaggi**
- Usa quando sai chi cerchi
- `allCharacters: true` per scene insieme
- `allCharacters: false` per presenza generale

✅ **Cache results**
- RAG search può essere lento
- Salva risultati per riuso
- Non ripetere query identiche

---

**Questi tools sono fondamentali per context gathering e continuità narrativa.**
