# Echoes.io - Panoramica Progetto

## Cos'è Echoes

Echoes è una **piattaforma di storytelling multi-POV** dove le voci dei personaggi risuonano attraverso narrative interconnesse in diverse timeline.

Ogni timeline rappresenta un universo narrativo diverso, con personaggi le cui esperienze si intrecciano e risuonano attraverso le storie.

## Le Timeline

### 🌿 Anima
**Tema:** Crescita, supporto, tenerezza  
**Atmosfera:** Intimità emotiva, calore, vulnerabilità condivisa  
**Tono:** Letterario ma accessibile, focus su connessioni profonde  
**Protagoniste:** Marie, altre figure femminili in percorsi di crescita

### ❤️ Eros
**Tema:** Passione, intensità, emozione cruda  
**Atmosfera:** Desiderio, tensione, esplorazione fisica ed emotiva  
**Tono:** Diretto, sensoriale, senza filtri  
**Protagoniste:** Ale, Gio, altre figure in relazioni intense

### 🌸 Bloom
**Tema:** Scoperta, equilibrio, fioritura  
**Atmosfera:** Trasformazione, nuovi inizi, armonia  
**Tono:** Poetico, evocativo, focus su momenti di rivelazione  
**Protagonista:** Ro

### 💫 Pulse
**Tema:** Diario personale, riflessioni, vita quotidiana  
**Atmosfera:** Intima, autentica, stream of consciousness  
**Tono:** Diretto, personale, senza protagonista femminile fissa  
**POV:** Nic (sempre), soggetti variabili

## Architettura Tecnica

### Gerarchia Contenuti

```
Timeline (universo narrativo)
├── Arc (fase della storia)
│   ├── Episode (evento narrativo)
│   │   ├── Part (suddivisione opzionale)
│   │   │   └── Chapter (file .md individuale)
```

**Note importanti:**
- `Part` è un livello OPZIONALE
- `Chapter` dipende da `Episode` (non da `Part`)
- `partNumber` nel frontmatter è nullable

### Repository Structure

```
echoes-io/
├── .github/                    # Questo repo - configurazioni condivise
│   ├── .kiro/steering/        # Documentazione base per agenti
│   ├── template/              # Template per nuovi repo
│   └── profile/               # Profilo organizzazione
│
├── timeline-anima/            # Timeline Anima
│   ├── content/              # Capitoli markdown
│   └── docs/                 # Planning: characters, episodes, locations
│
├── timeline-eros/            # Timeline Eros
│   ├── content/
│   └── docs/
│
├── timeline-bloom/           # Timeline Bloom
│   ├── content/
│   └── docs/
│
├── timeline-pulse/           # Timeline Pulse (nuovo!)
│   ├── content/
│   └── docs/
│
├── brand/                    # Design system e palette
├── utils/                    # Parsing markdown, statistiche
├── models/                   # TypeScript interfaces, Zod schemas
├── tracker/                  # Database SQLite per content management
├── mcp-server/              # AI integration via MCP
├── rag/                     # Semantic search con vector embeddings
├── books-generator/         # LaTeX book compilation
└── web-app/                 # Frontend Next.js (in sviluppo)
```

## Tech Stack

- **Language:** TypeScript (strict mode)
- **Runtime:** Node.js 22+
- **Database:** SQLite (tracker) + PostgreSQL (web-app)
- **ORM:** Kysely (tracker) + Drizzle (web-app)
- **Validation:** Zod schemas
- **Testing:** Vitest
- **AI Integration:** Model Context Protocol (MCP)
- **Vector Search:** ChromaDB + OpenAI embeddings
- **Web Framework:** Next.js 16 (App Router)

## Filosofia di Scrittura

### Stile Narrativo
- **Letterario ma accessibile** - non pretenzioso
- **POV intimo in terza persona** - deep dive nei pensieri del personaggio
- **Show, don't tell** - emozioni attraverso azioni e dettagli
- **Ricco di dettagli sensoriali** - coinvolgere tutti i sensi
- **Monologo interiore** - pensieri del personaggio POV

### Coerenza
- **Personalità consistente** - i personaggi evolvono ma restano riconoscibili
- **Continuità narrativa** - eventi e relazioni coerenti nel tempo
- **Atmosfera timeline** - ogni timeline ha il suo tono distintivo
- **Dettagli fisici** - descrizioni di luoghi e persone consistenti

### Qualità
- **Lunghezza capitoli** - Anima: 4000 parole; altre timeline: 2000-3000 parole
- **Un POV per capitolo** - no head-hopping
- **Pacing variabile** - momenti intensi alternati a riflessivi
- **Emotional resonance** - ogni capitolo deve lasciare qualcosa

## Strumenti AI Disponibili

### MCP Server (@echoes-io/mcp-server)
Fornisce tools per operazioni su contenuti:
- Content operations (chapter-info, episode-info, words-count)
- Database sync (timeline-sync, chapter-refresh)
- Semantic search (rag-search, rag-context, rag-characters)
- Statistics (stats)
- Book generation (book-generate)

### RAG System (@echoes-io/rag)
Ricerca semantica attraverso tutti i contenuti:
- Vector embeddings con OpenAI
- Ricerca per similarità semantica
- Context retrieval intelligente
- Filtri per personaggi e timeline

## Convenzioni di Naming

### File Capitoli
**Formato:** `ep{episode}-ch{chapter}-{pov}-{title-slug}.md`

**Esempi:**
- `ep01-ch001-marie-awakening.md`
- `ep03-ch015-nic-reflection.md`
- `ep12-ch045-ale-intensity.md`

**Regole:**
- Episode: 2 cifre con zero padding (ep01, ep02, ep12)
- Chapter: 3 cifre con zero padding (ch001, ch015, ch123)
- POV: nome personaggio lowercase (marie, nic, ale, gio)
- Title: slug lowercase con trattini

### Directory Structure
```
content/
└── {arc-name}/
    └── ep{XX}-{episode-title}/
        ├── ep{XX}-ch{XXX}-{pov}-{title}.md
        ├── ep{XX}-ch{XXX}-{pov}-{title}.md
        └── ...
```

## Workflow Base

1. **Identifica componenti** - timeline, arc, episode, chapter, pov
2. **Raccogli contesto** - usa MCP tools per context narrativo
3. **Consulta planning docs** - character sheets, episode outlines
4. **Scrivi contenuto** - segui stile e tono della timeline
5. **Valida continuità** - verifica coerenza con capitoli precedenti
6. **Genera metadata** - frontmatter YAML completo
7. **Sync database** - aggiorna tracker e RAG

## Best Practices

### Per la Scrittura
✅ Leggi sempre i capitoli precedenti dell'episodio  
✅ Consulta character sheet per coerenza  
✅ Usa RAG search per trovare scene simili  
✅ Mantieni il tono della timeline  
✅ Verifica continuità prima di salvare

### Per il Contesto
✅ Usa `rag-context` per background narrativo generale  
✅ Usa `rag-search` con filtri per scene specifiche  
✅ Usa `rag-characters` per scoprire interazioni passate  
✅ Verifica sync database se RAG restituisce 0 risultati

### Per i Metadata
✅ Frontmatter completo e validato  
✅ Summary conciso ma informativo (max 300 char)  
✅ Location specifica e consistente  
✅ Word count accurato  
✅ Date in formato ISO 8601

---

**Questa documentazione è la base condivisa per tutti gli agenti Echoes.**
