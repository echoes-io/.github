# Echoes Writer Agents - CAO System

Sistema di agenti specializzati per la scrittura collaborativa dei capitoli Echoes utilizzando CLI Agent Orchestrator (CAO).

## 🎭 Workflow Multi-Agente

Il sistema implementa un workflow sequenziale con handoff tra agenti specializzati:

```
writer → writer_narrative_writer → writer_warmth_emotion_agent → writer_continuity_guardian → writer_style_editor → writer_metadata_manager
```

### 🔍 writer (Orchestrator)
**Ruolo:** Raccoglie e organizza tutto il contesto necessario per la scrittura
- Recupera metadata del capitolo target
- Usa RAG per contesto narrativo correlato
- Prepara briefing completo per il writer
- **Tools MCP:** `chapter-info`, `episode-info`, `rag-context`, `rag-search`

### ✍️ writer_narrative_writer
**Ruolo:** Scrittura creativa pura, focus su narrativa coinvolgente
- Riceve briefing completo dall'orchestrator
- Scrive draft del capitolo in italiano
- Focus su dialoghi, emozioni, sviluppo personaggio
- **Tools MCP:** Nessuno (creatività pura)

### 🔥 writer_warmth_emotion_agent
**Ruolo:** Riscalda la scrittura rendendola più emotiva e coinvolgente
- Trasforma descrizioni fredde in scene vissute
- Aggiunge dettagli sensoriali specifici
- Intensifica connessioni emotive
- **Tools MCP:** Nessuno (editing emotivo)

### 🛡️ writer_continuity_guardian
**Ruolo:** Verifica coerenza narrativa e continuità personaggi
- Controlla consistenza con capitoli precedenti
- Verifica sviluppo logico dei personaggi
- Identifica e corregge contraddizioni
- **Tools MCP:** `rag-search`, `rag-context`, `episode-info`

### 📝 writer_style_editor
**Ruolo:** Perfeziona stile, grammatica e ritmo narrativo
- Correzioni linguistiche e stilistiche
- Adatta stile alla timeline specifica
- Ottimizza ritmo e flow narrativo
- Controlla word count target
- **Tools MCP:** Nessuno (editing stilistico)

### 📊 writer_metadata_manager
**Ruolo:** Gestisce metadata, frontmatter e salvataggio finale
- Genera frontmatter completo
- Calcola statistiche accurate
- Aggiorna tracker database
- Salva file finale con naming convention
- **Tools MCP:** `chapter-info`, `words-count`, `chapter-insert`, `timeline-sync`

## 🚀 Come Usare il Sistema

### Prerequisiti
1. **CAO installato** e configurato
2. **MCP Server Echoes** attivo e funzionante
3. **Agenti installati** in CAO

### Installazione Agenti
```bash
# Installa tutti gli agenti writer da GitHub
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer_narrative_writer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer_warmth_emotion_agent.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer_continuity_guardian.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer_style_editor.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/writer/writer_metadata_manager.md
```

### Avvio Workflow
```bash
# Avvia il workflow dall'orchestrator principale
q chat --profile writer

# Il workflow procederà automaticamente attraverso tutti gli agenti
```

### Input Richiesto
L'orchestrator **writer** richiede solo:
- **Timeline:** anima/eros/bloom
- **Arc:** nome dell'arco
- **Episode:** numero episodio
- **Chapter:** numero capitolo

Tutto il resto (POV, location, metadata) viene recuperato automaticamente dal tracker.

## 🎨 Stili per Timeline

### 🌿 Anima - Crescita e Tenerezza
- Linguaggio caldo e accogliente
- Ritmo contemplativo e rilassato
- Metafore naturali (piante, stagioni)
- Focus su crescita personale e supporto

### ❤️ Eros - Passione e Intensità
- Linguaggio diretto e passionale
- Ritmo variabile con momenti di tensione
- Metafore corporee e sensoriali
- Focus su conflitti emotivi e desiderio

### 🌸 Bloom - Scoperta e Equilibrio
- Linguaggio poetico ed evocativo
- Ritmo che segue l'emozione
- Metafore di crescita e trasformazione
- Focus su scoperta e bilanciamento

## 🔧 Integrazione MCP

Il sistema utilizza **due MCP server** per funzionalità diverse:

### CAO MCP Server (Orchestrazione)
**Tutti gli agenti** hanno accesso a:
- `handoff` - Passa controllo a un altro agente
- `assign` - Assegna task in background  
- `send_message` - Comunicazione diretta

### Echoes MCP Server (Content Operations)

#### ⚠️ IMPORTANTE - Sequenza di Setup

**Prima di usare i tool RAG, il tracker database DEVE essere sincronizzato:**

1. **Prima volta o dopo aver aggiunto nuovi capitoli:**
   ```bash
   timeline-sync --timeline <timeline-name> --contentPath ./content
   ```

2. **Poi indicizza per la ricerca semantica:**
   ```bash
   rag-index --timeline <timeline-name> --contentPath ./content
   ```

**Se RAG restituisce 0 risultati:** esegui `timeline-sync` prima!

#### Tool Disponibili per Agente

**Context Orchestrator + Continuity Guardian + Metadata Manager:**
- `chapter-info` - metadata capitolo
- `episode-info` - informazioni episodio
- `timeline-sync` - sincronizzazione filesystem → tracker (RICHIESTO PRIMA!)
- `rag-index` - indicizzazione tracker → RAG (richiede sync!)
- `rag-search` - ricerca semantica
- `rag-context` - contesto narrativo
- `words-count` - statistiche testo
- `chapter-insert` - inserimento capitolo
- `chapter-refresh` - aggiorna singolo capitolo

**Narrative Writer + Warmth Agent + Style Editor:**
- Solo CAO MCP server per orchestrazione
- Nessun accesso diretto ai dati Echoes

#### Troubleshooting

**RAG non trova capitoli?**
- Verifica che `timeline-sync` sia stato eseguito
- Il tracker deve contenere i capitoli prima che RAG possa indicizzarli

**Capitolo non trovato nel database?**
- Esegui `timeline-sync` per sincronizzare le modifiche
- Oppure usa `chapter-refresh` per un singolo capitolo

## 📏 Target Word Count

**Capitoli Standard:**
- **Anima:** 800-1200 parole
- **Eros:** 1000-1500 parole  
- **Bloom:** 900-1300 parole

**Capitoli Speciali:**
- **Climax emotivi:** fino a 1800 parole
- **Transizioni:** 600-1000 parole
- **Epiloghi/Prologhi:** 500-800 parole

## 🎯 Vantaggi del Sistema

### Specializzazione
- Ogni agente ha expertise specifica
- Focus dedicato su aspetti diversi
- Qualità superiore per ogni componente

### Consistenza
- Workflow riproducibile
- Standard qualitativi uniformi
- Stile coerente per timeline

### Scalabilità
- Facile aggiungere nuovi agenti
- Workflow modificabile per esigenze diverse
- Parallelizzazione possibile per più capitoli

### Qualità
- Controlli multipli e specializzati
- Feedback loop tra agenti
- Risultato finale raffinato

## 🔄 Pattern di Orchestrazione

**Handoff Sequenziale:** Ogni agente completa il suo lavoro e passa al successivo
**Context Preservation:** Informazioni importanti mantenute attraverso i passaggi
**Quality Gates:** Ogni agente può rimandare indietro per correzioni
**Feedback Loops:** Possibilità di iterazioni per migliorare qualità

---

**Echoes Writer System** - Dove la creatività umana incontra l'orchestrazione intelligente ✨
