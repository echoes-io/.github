# Configurazione Agenti Kiro per Echoes

Questo documento spiega la configurazione corretta degli agenti Kiro per le timeline Echoes.

## 📋 Struttura File

Ogni repository timeline deve avere questa struttura:

```
timeline-[nome]/
├── .kiro/
│   ├── agents/
│   │   └── writer.json         # Configurazione agente
│   └── prompts/
│       └── writer-prompt.md    # Prompt esterno
├── docs/
│   ├── characters/             # Character sheets
│   ├── episodes/               # Episode outlines
│   ├── locations/              # Location descriptions
│   └── timeline-steering.md    # Timeline-specific steering
└── content/                    # Capitoli markdown
```

## 🔧 Configurazione Agente

### File: `.kiro/agents/writer.json`

```json
{
  "name": "writer",
  "description": "Specialized writing agent for [TIMELINE] timeline",
  "prompt": "file://../prompts/writer-prompt.md",
  "mcpServers": {
    "echoes": {
      "command": "npx",
      "args": ["-y", "@echoes-io/mcp-server@latest"],
      "env": {
        "ECHOES_RAG_PROVIDER": "e5-large",
        "ECHOES_TIMELINE": "[timeline]"
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

### Placeholder da Sostituire

- `[TIMELINE]` → nome timeline uppercase (ANIMA, EROS, BLOOM, PULSE)
- `[timeline]` → nome timeline lowercase (anima, eros, bloom, pulse)

**Nota:** Il campo `name` è sempre `"writer"` per tutti gli agenti.

### Componenti Chiave

#### 1. Prompt Esterno
```json
"prompt": "file://./.kiro/prompts/writer-prompt.md"
```

Il prompt è in un file separato per:
- ✅ Migliore manutenibilità
- ✅ Prompt lunghi e dettagliati
- ✅ Facile aggiornamento
- ✅ Versioning separato

#### 2. MCP Server
```json
"mcpServers": {
  "echoes": {
    "command": "npx",
    "args": ["-y", "@echoes-io/mcp-server@latest"],
    "env": {
      "ECHOES_RAG_PROVIDER": "e5-large",
      "ECHOES_TIMELINE": "anima"
    }
  }
}
```

**Variabili ambiente:**
- `ECHOES_RAG_PROVIDER`: Provider per embeddings (e5-large)
- `ECHOES_TIMELINE`: Nome timeline per RAG filtering

#### 3. Tools
```json
"tools": [
  "read",           // Lettura file
  "write",          // Scrittura file
  "shell",          // Comandi bash
  "web_search",     // Ricerca web
  "web_fetch",      // Fetch URL
  "introspect",     // Introspezione
  "thinking",       // Reasoning
  "@echoes"         // MCP tools Echoes
]
```

**Tool `@echoes` fornisce:**
- `chapter-info`, `episode-info`, `words-count`
- `timeline-sync`, `chapter-refresh`
- `rag-search`, `rag-context`, `rag-characters`
- `stats`

#### 4. Tool Settings
```json
"toolsSettings": {
  "write": {
    "allowedPaths": [
      "content/**",    // Capitoli
      "docs/**",       // Planning docs
      ".kiro/**",      // Config
      "*.md",          // Markdown files
      "*.json"         // JSON files
    ]
  },
  "shell": {
    "autoAllowReadonly": true  // Comandi read-only automatici
  }
}
```

#### 5. Resources
```json
"resources": [
  "file://../../../.github/.kiro/steering/*.md",  // Documentazione base
  "file://../../docs/characters/*.md",            // Character sheets
  "file://../../docs/episodes/*.md",              // Episode outlines
  "file://../../docs/locations/*.md",             // Locations
  "file://../../docs/timeline-steering.md",       // Timeline steering
  "file://../../.kiro/specs/**/*.md"              // Specs (se presenti)
]
```

**Path relativi:**
- Da `timeline-anima/.kiro/agents/writer.json`
- `../../../.github/` → `.github/` (documentazione condivisa)
- `../../docs/` → `timeline-anima/docs/` (planning docs locali)

## 📝 Prompt File

### File: `.kiro/prompts/writer-prompt.md`

Il prompt contiene:

1. **Ruolo e responsabilità**
2. **Specifiche timeline** (tono, lunghezza, focus)
3. **Tone guidelines dettagliate**
4. **Accesso a risorse** (docs, MCP tools)
5. **Workflow completo** (7 step)
6. **Regole critiche** (Always/Never)
7. **Template frontmatter**
8. **Quality checklist**
9. **Esempio interazione**

### Template Disponibili

**In `template/.kiro/prompts/`:**

1. **`writer-prompt.md`** - Template generico
   - Usa per: personalizzazione custom
   - Richiede personalizzazione placeholder

2. **`anima-writer-prompt.md`** - Anima specifico
   - Usa per: Anima
   - Pre-configurato: 4000 parole, tenerezza, crescita
   - Nessuna personalizzazione necessaria

3. **`eros-writer-prompt.md`** - Eros specifico
   - Usa per: Eros
   - Pre-configurato: 2000-3000 parole, intensità, passione
   - Nessuna personalizzazione necessaria

4. **`bloom-writer-prompt.md`** - Bloom specifico
   - Usa per: Bloom
   - Pre-configurato: 2000-3000 parole, scoperta, fioritura
   - Protagonista: Ro
   - Nessuna personalizzazione necessaria

5. **`pulse-writer-prompt.md`** - Pulse specifico
   - Usa per: Pulse
   - Pre-configurato: 2000-3000 parole, diario, autenticità
   - POV: SEMPRE Nic
   - Nessuna personalizzazione necessaria

## 🚀 Setup Rapido

### 1. Copia Template

```bash
cd timeline-[nome]
mkdir -p .kiro/agents
mkdir -p .kiro/prompts

# Copia agent config
cp ../.github/template/kiro-agent.json .kiro/agents/writer.json

# Copia prompt (scegli quello appropriato)
cp ../.github/template/.kiro/prompts/anima-writer-prompt.md .kiro/prompts/writer-prompt.md
# oppure
cp ../.github/template/.kiro/prompts/eros-writer-prompt.md .kiro/prompts/writer-prompt.md
# oppure
cp ../.github/template/.kiro/prompts/writer-prompt.md .kiro/prompts/writer-prompt.md
```

### 2. Personalizza

**In `.kiro/agents/writer.json`:**
```bash
# Sostituisci placeholder (name rimane "writer")
sed -i 's/\[TIMELINE\]/ANIMA/g' .kiro/agents/writer.json
sed -i 's/\[timeline\]/anima/g' .kiro/agents/writer.json
```

**In `.kiro/prompts/writer-prompt.md`:**
- Se hai usato template generico, sostituisci placeholder
- Se hai usato template specifico (anima/eros), già pronto!

### 3. Verifica

```bash
# Verifica nome agente
jq '.name' .kiro/agents/writer.json

# Verifica timeline in env
jq '.mcpServers.echoes.env.ECHOES_TIMELINE' .kiro/agents/writer.json

# Verifica prompt file esiste
ls -la .kiro/prompts/writer-prompt.md

# Verifica nessun placeholder rimasto
grep -E '\[TIMELINE\]|\[timeline\]' .kiro/agents/writer.json .kiro/prompts/writer-prompt.md
```

### 4. Test

```bash
kiro chat
```

Verifica:
- ✅ Agente conosce Echoes
- ✅ MCP tools disponibili (`@echoes`)
- ✅ Legge planning docs
- ✅ Segue tono corretto

## 🔍 Troubleshooting

### Agente non trova prompt
**Errore:** "Cannot read prompt file"

**Fix:** Verifica path in `agents/writer.json`:
```json
"prompt": "file://./.kiro/prompts/writer-prompt.md"
```

### MCP tools non disponibili
**Errore:** Tools `@echoes` non trovati

**Fix:** Verifica:
```json
"tools": [..., "@echoes"],
"allowedTools": [..., "@echoes"],
"mcpServers": {
  "echoes": { ... }
}
```

### Resources non trovati
**Errore:** Cannot read steering files

**Fix:** Verifica path relativo:
```json
"resources": [
  "file://../../../.github/.kiro/steering/*.md",  // Corretto da .kiro/agents/writer.json
  ...
]
```

### RAG restituisce 0 risultati
**Problema:** `rag-search` non trova capitoli

**Fix:**
```bash
npx -y @echoes-io/mcp-server timeline-sync --timeline [timeline] --contentPath ./content
npx -y @echoes-io/mcp-server rag-index --timeline [timeline] --contentPath ./content
```

## 📚 Documentazione Completa

- [`.kiro/WALKTHROUGH.md`](.kiro/WALKTHROUGH.md) - Guida step-by-step completa
- [`.kiro/SETUP-CHECKLIST.md`](.kiro/SETUP-CHECKLIST.md) - Checklist per timeline
- [`template/README.md`](../template/README.md) - Documentazione template
- [`README.md`](../README.md) - Overview organizzazione

## 🎯 Best Practices

### Configurazione
✅ Usa template forniti (non creare da zero)  
✅ Mantieni naming consistente ([timeline]-writer)  
✅ Verifica path relativi corretti  
✅ Testa dopo ogni modifica

### Prompt
✅ Usa prompt esterni (non inline)  
✅ Usa template specifici quando disponibili  
✅ Personalizza solo se necessario  
✅ Mantieni prompt aggiornati con documentazione

### Manutenzione
✅ Aggiorna template quando cambia documentazione  
✅ Propaga modifiche a tutti gli agenti  
✅ Testa dopo aggiornamenti  
✅ Documenta customizzazioni specifiche

---

**Questa configurazione garantisce agenti consistenti, ben informati e facili da mantenere!** ✨
