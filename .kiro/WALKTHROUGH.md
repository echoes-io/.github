# Echoes Setup Walkthrough

Guida pratica per configurare gli agenti Kiro per le timeline Echoes.

## 🎯 Obiettivo

Creare agenti Kiro ben informati che:
- Conoscono automaticamente tutta la base Echoes
- Hanno accesso ai planning docs della timeline
- Seguono workflow chiaro e consistente
- Scrivono capitoli di qualità

## 📋 Prerequisiti

- Repository `.github` con documentazione steering
- Repository timeline (es. `timeline-anima`)
- MCP server `@echoes-io/mcp-server` disponibile

## 🚀 Setup Timeline (Step-by-Step)

Faremo il setup insieme, timeline per timeline. Iniziamo con una e poi replichiamo.

### Step 1: Crea Configurazione Agente

```bash
cd timeline-[nome]
mkdir -p .kiro/agents
mkdir -p .kiro/prompts
```

**Copia il template agente:**
```bash
cp ../.github/template/kiro-agent.json .kiro/agents/writer.json
```

**Copia il template prompt:**
```bash
# Per Anima
cp ../.github/template/.kiro/prompts/anima-writer-prompt.md .kiro/prompts/writer-prompt.md

# Per Eros
cp ../.github/template/.kiro/prompts/eros-writer-prompt.md .kiro/prompts/writer-prompt.md

# Per Bloom
cp ../.github/template/.kiro/prompts/bloom-writer-prompt.md .kiro/prompts/writer-prompt.md

# Per Pulse
cp ../.github/template/.kiro/prompts/pulse-writer-prompt.md .kiro/prompts/writer-prompt.md
```

**Personalizza `.kiro/agents/writer.json`:**

Sostituisci i placeholder:
- `[TIMELINE]` → nome timeline uppercase (ANIMA, EROS, BLOOM, PULSE)
- `[timeline]` → nome timeline lowercase (anima, eros, bloom, pulse)

```json
{
  "name": "writer",
  "description": "Specialized writing agent for ANIMA timeline",
  "prompt": "file://../prompts/writer-prompt.md",
  "mcpServers": {
    "echoes": {
      "command": "npx",
      "args": ["-y", "@echoes-io/mcp-server@latest"],
      "env": {
        "ECHOES_RAG_PROVIDER": "e5-large",
        "ECHOES_TIMELINE": "anima"
      }
    }
  },
  "tools": [
    "read",
    "write",
    "shell",
    "web_search",
    "web_fetch",
    "introspect",
    "thinking",
    "@echoes"
  ],
  "toolAliases": {},
  "allowedTools": [
    "read",
    "shell",
    "web_search",
    "web_fetch",
    "introspect",
    "thinking",
    "@echoes"
  ],
  "toolsSettings": {
    "write": {
      "allowedPaths": [
        "content/**",
        "docs/**",
        ".kiro/**",
        "*.md",
        "*.json"
      ]
    },
    "shell": {
      "autoAllowReadonly": true
    }
  },
  "resources": [
    "file://../../../.github/.kiro/steering/*.md",
    "file://../../docs/characters/*.md",
    "file://../../docs/episodes/*.md",
    "file://../../docs/locations/*.md",
    "file://../../docs/timeline-steering.md",
    "file://../../.kiro/specs/**/*.md"
  ]
}
```

**Personalizza `.kiro/prompts/writer-prompt.md`:**

✅ **Se hai usato un template specifico** (anima, eros, bloom, pulse):
- Nessuna personalizzazione necessaria!
- Già pre-configurato con tono, lunghezza, focus corretti

⚠️ **Se hai usato il template generico** (`writer-prompt.md`):
- Sostituisci tutti i placeholder:
  - `[TIMELINE]` → nome timeline uppercase
  - `[timeline]` → nome timeline lowercase
  - `[TONE_DESCRIPTION]` → breve descrizione tono
  - `[LENGTH]` → lunghezza target (4000 per Anima, 2000-3000 per altre)
  - `[FOCUS_DESCRIPTION]` → focus narrativo
  - `[DETAILED_TONE_DESCRIPTION]` → descrizione dettagliata dal doc 02-writing-guidelines.md

### Step 2: Crea Timeline Steering

Crea `docs/timeline-steering.md` usando il template:

```bash
cp ../.github/template/timeline-steering-template.md docs/timeline-steering.md
```

Compila con informazioni specifiche della timeline:
- Personaggi principali
- Locations ricorrenti
- Arcs attivi
- Eventi chiave
- Stile distintivo

### Step 3: Organizza Planning Docs

```bash
mkdir -p docs/{characters,episodes,locations}
```

**Character Sheets:**
```bash
cp ../.github/template/docs/character-sheet.md docs/characters/[nome].md
```

Compila per ogni personaggio principale:
- Dati base (nome, età, ruolo)
- Aspetto fisico
- Personalità attuale
- Relazioni chiave
- Evoluzione attraverso episodi

**Episode Outlines:**
```bash
cp ../.github/template/docs/episode-outline.md docs/episodes/ep[XX]-[title].md
```

Compila per episodi pianificati:
- Overview e tema
- Personaggi coinvolti
- Struttura 3 atti
- Locations
- Note continuità

**Locations:**
Crea file per locations ricorrenti:
```bash
echo "# [Location Name]

## Descrizione Fisica
[descrizione]

## Atmosfera
[come si sente]

## Storia
[eventi passati qui]

## Note
[dettagli importanti]
" > docs/locations/[nome].md
```

### Step 4: Sync Database

Prima di usare l'agente, sync il database:

```bash
npx -y @echoes-io/mcp-server timeline-sync --timeline [timeline] --contentPath ./content
npx -y @echoes-io/mcp-server rag-index --timeline [timeline] --contentPath ./content
```

Questo permette all'agente di usare RAG search.

### Step 5: Test Agente

```bash
kiro chat
```

**Test 1 - Verifica Context:**
```
> Cos'è Echoes?
> Quali sono le linee guida per [timeline]?
> Qual è la lunghezza target dei capitoli?
```

**Test 2 - Verifica MCP Tools:**
```
> Mostrami la struttura dell'episodio 1
> Cerca capitoli con [personaggio]
```

**Test 3 - Verifica Planning Docs:**
```
> Parlami del personaggio [nome]
> Qual è il tema dell'episodio 1?
```

**Test 4 - Scrittura:**
```
> Scrivi il prossimo capitolo dell'episodio 1
```

Verifica che:
- ✅ Segua il workflow corretto
- ✅ Raccolga context prima di scrivere
- ✅ Rispetti tono della timeline
- ✅ Generi frontmatter completo
- ✅ Usi `words-count` tool (non bash)
- ✅ Lunghezza corretta (4000 per Anima, 2000-3000 per altre)

### Step 6: Itera e Perfeziona

Dopo il primo capitolo test:
- Raccogli feedback
- Aggiorna `docs/timeline-steering.md` se necessario
- Aggiorna prompt in `agent.toml` se serve
- Testa nuovamente

## 📊 Checklist Completa per Timeline

### Configurazione
- [ ] `.kiro/agents/writer.json` creato e personalizzato
- [ ] `.kiro/prompts/writer-prompt.md` copiato
- [ ] `docs/timeline-steering.md` compilato

### Planning Docs
- [ ] Character sheets per personaggi principali
- [ ] Episode outlines per episodi pianificati
- [ ] Location docs per luoghi ricorrenti

### Database
- [ ] `timeline-sync` eseguito
- [ ] `rag-index` eseguito
- [ ] RAG restituisce risultati (non 0)

### Test
- [ ] Agente conosce Echoes
- [ ] Agente conosce tono timeline
- [ ] MCP tools funzionano
- [ ] Planning docs accessibili
- [ ] Scrittura test completata
- [ ] Lunghezza corretta
- [ ] Frontmatter valido
- [ ] Database synced

## 🔄 Workflow Quotidiano

Una volta setup completato:

1. **Apri agente:** `kiro chat` nella directory timeline
2. **Chiedi di scrivere:** "Scrivi il prossimo capitolo"
3. **L'agente:**
   - Identifica timeline, arc, episode, chapter
   - Sync database se necessario
   - Raccoglie context (RAG + planning docs)
   - Scrive seguendo guidelines
   - Genera frontmatter
   - Salva e sync
4. **Tu:** Review e feedback

## 🆘 Troubleshooting

### Agente non conosce Echoes
**Problema:** Risponde come se non sapesse cos'è Echoes

**Fix:** Verifica `resources` in `.kiro/agents/writer.json`:
```json
"resources": [
  "file://../../../.github/.kiro/steering/*.md",
  ...
]
```

### MCP tools non funzionano
**Problema:** `chapter-info`, `rag-search` non disponibili

**Fix:** Verifica `mcpServers` in `.kiro/agents/writer.json`:
```json
"mcpServers": {
  "echoes": {
    "command": "npx",
    "args": ["-y", "@echoes-io/mcp-server@latest"],
    "env": {
      "ECHOES_RAG_PROVIDER": "e5-large",
      "ECHOES_TIMELINE": "[timeline]"
    }
  }
}
```

Verifica anche che `"@echoes"` sia in `tools` e `allowedTools`.

### RAG restituisce 0 risultati
**Problema:** `rag-search` non trova capitoli

**Fix:**
```bash
npx -y @echoes-io/mcp-server timeline-sync --timeline [timeline] --contentPath ./content
npx -y @echoes-io/mcp-server rag-index --timeline [timeline] --contentPath ./content
```

### Planning docs non trovati
**Problema:** Agente non legge character sheets

**Fix:** Verifica che esistano:
```bash
ls docs/characters/*.md
ls docs/episodes/*.md
```

E che siano in `[context.resources]`.

### Agente usa bash invece di MCP tool
**Problema:** Usa `wc` invece di `words-count`

**Fix:** Verifica che il prompt in `.kiro/prompts/writer-prompt.md` includa:
```markdown
### Always
...
6. ✅ Use `words-count` MCP tool (NOT bash commands like `wc`)
...
```

## 📚 Documentazione Completa

Per dettagli completi, consulta:
- `.kiro/steering/00-echoes-overview.md` - Panoramica progetto
- `.kiro/steering/01-content-structure.md` - Struttura contenuti
- `.kiro/steering/02-writing-guidelines.md` - Linee guida scrittura
- `.kiro/steering/03-metadata-frontmatter.md` - Reference frontmatter
- `.kiro/steering/04-mcp-tools-reference.md` - Guida MCP tools
- `.kiro/steering/05-workflow-writing.md` - Workflow step-by-step
- `.kiro/steering/QUICK-REFERENCE.md` - Cheat sheet

## 🎉 Prossimi Step

Una volta completato setup per una timeline:
1. Scrivi alcuni capitoli test
2. Raccogli feedback
3. Perfeziona configurazione
4. Replica per altre timeline

**Ogni timeline è indipendente ma condivide la stessa base knowledge!**

---

**Domande? Problemi? Apri issue su `.github` repository o chiedi durante il setup!**
