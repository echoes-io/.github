# Workflow di Scrittura Echoes

## Panoramica

Questo documento descrive il workflow step-by-step per scrivere un capitolo Echoes, dalla pianificazione alla pubblicazione.

## Workflow Completo

```
1. Identificazione → 2. Context Gathering → 3. Planning → 4. Scrittura → 5. Validazione → 6. Metadata → 7. Sync
```

---

## Step 1: Identificazione Componenti

### Input Tipico
```
"Scrivi capitolo anima ep01 ch006"
"Continua eros ale ep12"
"Nuovo capitolo pulse"
```

### Parsing Componenti

**Estrai:**
- `timeline` - anima, eros, bloom, pulse
- `arc` - scopri da filesystem o chiedi
- `episode` - numero episodio
- `chapter` - numero capitolo (o prossimo disponibile)
- `pov` - scopri da planning o chiedi

**Esempio:**
```
Input: "Scrivi anima matilde ep01 ch006"

Parsed:
  timeline: anima
  arc: matilde
  episode: 1
  chapter: 6
  pov: ? (da determinare)
```

### Verifica Esistenza

```typescript
// Verifica episodio esiste
const episodeInfo = await mcp.call('episode-info', {
  timeline: 'anima',
  arc: 'matilde',
  episode: 1
})

// Se chapter non specificato, usa prossimo disponibile
const nextChapter = episodeInfo.totalChapters + 1
```

---

## Step 2: Context Gathering

### A. Verifica Database Sync

**⚠️ CRITICO:** Prima di usare RAG tools!

```typescript
// Se RAG restituisce 0 risultati, sync necessario
await mcp.call('timeline-sync', {
  timeline: 'anima',
  contentPath: './content'
})

await mcp.call('rag-index', {
  timeline: 'anima',
  contentPath: './content'
})
```

### B. Metadata Capitolo Precedente

```typescript
// Se non è il primo capitolo dell'episodio
if (chapter > 1) {
  const prevChapter = await mcp.call('chapter-info', {
    timeline,
    arc,
    episode,
    chapter: chapter - 1
  })
  
  // Note: pov, location, eventi recenti
}
```

### C. Context Narrativo (RAG)

```typescript
// Background generale
const context = await mcp.call('rag-context', {
  timeline,
  query: `sviluppo emotivo di ${pov} in ${arc}`,
  topK: 5
})

// Scene simili
const similar = await mcp.call('rag-search', {
  timeline,
  query: 'atmosfera e tema della scena che vuoi scrivere',
  topK: 3
})

// Interazioni personaggio
const interactions = await mcp.call('rag-characters', {
  timeline,
  character: pov
})
```

### D. Planning Documents

```typescript
// Leggi character sheet
const characterSheet = readFile(`docs/characters/${pov}.md`)

// Leggi episode outline
const episodeOutline = readFile(`docs/episodes/ep${episode.toString().padStart(2, '0')}-*.md`)

// Leggi location info (se disponibile)
const locationInfo = readFile(`docs/locations/${location}.md`)
```

### E. Informazioni Episodio

```typescript
const episodeInfo = await mcp.call('episode-info', {
  timeline,
  arc,
  episode
})

// Note: tema episodio, altri capitoli, progressione
```

---

## Step 3: Planning

### Prepara Writing Brief

Crea un briefing strutturato con tutte le informazioni raccolte:

```markdown
## CAPITOLO: ${timeline} - ${arc} - Ep${episode} - Ch${chapter}

**POV:** ${pov}
**Location:** ${location}
**Tema Episodio:** ${episodeTheme}

## CONTESTO NARRATIVO
${contextSummary}

## CAPITOLO PRECEDENTE
${previousChapterSummary}

## SVILUPPO PERSONAGGIO
${characterArc}

## CONTINUITÀ DA VERIFICARE
- Eventi da referenziare: ${events}
- Relazioni attive: ${relationships}
- Location consistency: ${locationDetails}

## ATMOSFERA TIMELINE
${timelineTone}

## OBIETTIVI CAPITOLO
- Sviluppo narrativo: ${plotGoal}
- Sviluppo emotivo: ${emotionalGoal}
- Setup per prossimo: ${setupNext}

## VINCOLI
- Lunghezza: 2000-3000 parole
- POV: ${pov} (no head-hopping)
- Tono: ${timelineTone}
```

### Determina Dettagli

**Location:**
- Dove si svolge la scena?
- Coerente con capitoli precedenti?
- Consulta location docs

**Outfit (opzionale):**
- Abbigliamento rilevante per la scena?
- Coerente con stagione/contesto?

**Scena:**
- Cosa succede in questo capitolo?
- Quale momento emotivo centrale?
- Come si collega al precedente/successivo?

---

## Step 4: Scrittura

### Struttura Capitolo

**Apertura (200-300 parole):**
- Hook che cattura attenzione
- Stabilisce POV, location, atmosfera
- Connessione con capitolo precedente (se necessario)

**Sviluppo (1500-2000 parole):**
- Scena principale o sequenza di scene
- Sviluppo emotivo/narrativo
- Dialoghi e interazioni
- Monologo interiore
- Dettagli sensoriali

**Chiusura (200-300 parole):**
- Risoluzione della scena
- Momento di riflessione
- Hook per capitolo successivo (opzionale)
- Immagine/sensazione finale

### Checklist Durante Scrittura

✅ **POV Consistente**
- Tutto filtrato attraverso il POV
- No head-hopping
- Monologo interiore presente

✅ **Dettagli Sensoriali**
- Almeno 3 sensi coinvolti
- Vista, udito, tatto, olfatto, gusto
- Sensazioni fisiche che rivelano emozioni

✅ **Show Don't Tell**
- Emozioni attraverso azioni
- Dialoghi che mostrano dinamiche
- Dettagli che rivelano stato d'animo

✅ **Tono Timeline**
- Anima: tenerezza, crescita
- Eros: intensità, passione
- Bloom: scoperta, equilibrio
- Pulse: autenticità, riflessione

✅ **Pacing Appropriato**
- Variare ritmo (lento/veloce)
- Frasi lunghe per contemplazione
- Frasi brevi per tensione/azione

---

## Step 5: Validazione

### A. Auto-Review

**Qualità Narrativa:**
- [ ] POV consistente (no head-hopping)
- [ ] Dialoghi naturali
- [ ] Dettagli sensoriali ricchi
- [ ] Pacing appropriato
- [ ] Lunghezza 2000-3000 parole

**Stile:**
- [ ] Tono appropriato per timeline
- [ ] Show don't tell applicato
- [ ] Monologo interiore efficace
- [ ] Prosa curata ma accessibile

**Struttura:**
- [ ] Apertura efficace
- [ ] Sviluppo coerente
- [ ] Chiusura soddisfacente

### B. Verifica Continuità

**Personaggi:**
```typescript
// Cerca menzioni precedenti del POV
const povHistory = await mcp.call('rag-search', {
  timeline,
  query: `${pov} personalità comportamento`,
  topK: 5
})

// Verifica: personalità consistente?
```

**Location:**
```typescript
// Cerca descrizioni precedenti
const locationHistory = await mcp.call('rag-search', {
  timeline,
  query: `${location} descrizione ambiente`,
  topK: 3
})

// Verifica: descrizione coerente?
```

**Eventi:**
```typescript
// Cerca eventi referenziati
const eventHistory = await mcp.call('rag-search', {
  timeline,
  query: 'evento specifico menzionato',
  topK: 3
})

// Verifica: riferimenti corretti?
```

**Relazioni:**
```typescript
// Se ci sono interazioni tra personaggi
const relationshipHistory = await mcp.call('rag-search', {
  timeline,
  query: `relazione tra ${char1} e ${char2}`,
  characters: [char1, char2],
  allCharacters: true
})

// Verifica: dinamica coerente?
```

### C. Checklist Continuità

- [ ] Personalità POV consistente
- [ ] Location descritta correttamente
- [ ] Eventi passati referenziati correttamente
- [ ] Relazioni coerenti con storia
- [ ] Nessuna contraddizione temporale

---

## Step 6: Metadata e Frontmatter

### Genera Frontmatter

```yaml
---
pov: ${pov}
title: "${title}"
date: "${new Date().toISOString()}"
timeline: ${timeline}
arc: ${arc}
episode: ${episode}
chapter: ${chapter}
summary: "${summary}"
location: "${location}"
${outfit ? `outfit: "${outfit}"` : ''}
${kink ? `kink: "${kink}"` : ''}
---
```

### Estrai Metadata da Contenuto

**Summary:**
```typescript
// Prime 2-3 frasi del capitolo
const sentences = content.match(/[^.!?]+[.!?]+/g) || []
const summary = sentences.slice(0, 2).join(' ')

// Tronca a 300 caratteri se necessario
if (summary.length > 300) {
  summary = summary.substring(0, 297) + '...'
}
```

**Location:**
- Già determinata in planning
- Verifica coerenza con contenuto

**Outfit (opzionale):**
- Se menzionato nel capitolo
- Estrai descrizione concisa

### Valida Frontmatter

```typescript
import { chapterFrontmatterSchema } from '@echoes-io/models'

try {
  const validated = chapterFrontmatterSchema.parse(frontmatter)
  console.log('✅ Frontmatter valido')
} catch (error) {
  console.error('❌ Errore:', error.message)
  // Correggi errori
}
```

### Calcola Statistiche

```typescript
// Usa MCP tool words-count (NON usare comandi bash come wc)
const stats = await mcp.call('words-count', {
  filePath: filepath
})

// stats contiene:
// - wordCount: numero parole
// - readingTime: minuti di lettura
```

---

## Step 7: Salvataggio e Sync

### A. Genera Filename

```typescript
const filename = `ep${episode.toString().padStart(2, '0')}-ch${chapter.toString().padStart(3, '0')}-${pov.toLowerCase()}-${titleSlug}.md`

// Esempio: ep01-ch006-marie-awakening.md
```

### B. Determina Path

```typescript
// Trova episode directory
const episodeDir = findEpisodeDirectory(arc, episode)
// → content/matilde/ep01-inizio/

const filepath = `${episodeDir}/${filename}`
```

### C. Salva File

```typescript
const fullContent = `${frontmatter}\n\n${content}`

await fs.writeFile(filepath, fullContent)
```

### D. Sync Database

```typescript
// Sync singolo capitolo
await mcp.call('chapter-refresh', {
  timeline,
  arc,
  episode,
  chapter,
  filePath: filepath
})

// Oppure sync completo
await mcp.call('timeline-sync', {
  timeline,
  contentPath: './content'
})

// Re-index per RAG
await mcp.call('rag-index', {
  timeline,
  contentPath: './content'
})
```

### E. Verifica Sync

```typescript
// Verifica capitolo nel tracker
const chapterInfo = await mcp.call('chapter-info', {
  timeline,
  arc,
  episode,
  chapter
})

console.log('✅ Capitolo salvato:', chapterInfo.title)
console.log('📊 Word count:', chapterInfo.wordCount)
```

---

## Workflow Semplificato (Quick Reference)

```
1. IDENTIFICA
   - timeline, arc, episode, chapter, pov

2. CONTEXT
   - Sync database (se necessario)
   - chapter-info (precedente)
   - rag-context (background)
   - rag-search (scene simili)
   - Leggi planning docs

3. PLANNING
   - Writing brief
   - Determina location, outfit
   - Obiettivi capitolo

4. SCRIVI
   - Apertura (200-300w)
   - Sviluppo (1500-2000w)
   - Chiusura (200-300w)
   - Verifica checklist

5. VALIDA
   - Auto-review qualità
   - Verifica continuità (RAG)
   - Checklist continuità

6. METADATA
   - Genera frontmatter
   - Estrai summary
   - Valida con Zod
   - Calcola stats

7. SALVA & SYNC
   - Genera filename
   - Salva file
   - Sync database
   - Verifica sync
```

---

## Best Practices

### Prima di Scrivere

✅ **Raccogli context completo**
- Non iniziare senza context gathering
- Usa RAG tools per background
- Leggi planning docs

✅ **Verifica continuità preventiva**
- Controlla capitoli precedenti
- Verifica location/personaggi
- Nota eventi da referenziare

✅ **Pianifica obiettivi chiari**
- Cosa deve succedere
- Quale sviluppo emotivo
- Come si collega al resto

### Durante Scrittura

✅ **Mantieni focus POV**
- Tutto attraverso il POV
- No head-hopping mai
- Monologo interiore ricco

✅ **Ricchezza sensoriale**
- Almeno 3 sensi per scena
- Dettagli che rivelano emozioni
- Sensazioni fisiche

✅ **Pacing variabile**
- Alterna momenti lenti/veloci
- Usa struttura frase per ritmo
- Respira con il personaggio

### Dopo Scrittura

✅ **Valida sempre**
- Auto-review completo
- Verifica continuità con RAG
- Checklist qualità

✅ **Metadata accurato**
- Frontmatter completo
- Summary informativo
- Validazione Zod

✅ **Sync immediato**
- Dopo ogni capitolo
- Verifica sync riuscito
- Re-index per RAG

---

**Questo workflow garantisce qualità, coerenza e efficienza nella scrittura.**
