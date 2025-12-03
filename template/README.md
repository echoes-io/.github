# Echoes Timeline Agent Templates

Questo directory contiene i template per configurare gli agenti Kiro per le timeline Echoes.

## 📁 File Disponibili

### `kiro-agent.json`
Template di configurazione per l'agente Kiro.

**Placeholder da sostituire:**
- `[timeline]` → nome timeline lowercase (anima, eros, bloom, pulse)
- `[TIMELINE]` → nome timeline uppercase (ANIMA, EROS, BLOOM, PULSE)

**Cosa configura:**
- Nome e descrizione agente
- Riferimento al prompt esterno
- MCP server per tools Echoes
- Tools disponibili (read, write, shell, MCP tools)
- Permessi di scrittura
- Resources (documentazione steering + planning docs)

### `.kiro/prompts/writer-prompt.md`
Template generico di prompt per agenti timeline.

**Placeholder da sostituire:**
- `[TIMELINE]` → nome timeline uppercase
- `[timeline]` → nome timeline lowercase
- `[TONE_DESCRIPTION]` → breve descrizione tono
- `[LENGTH]` → lunghezza target capitoli
- `[FOCUS_DESCRIPTION]` → focus narrativo
- `[DETAILED_TONE_DESCRIPTION]` → descrizione dettagliata tono

**Usa questo per:** Eros, Bloom, Pulse

### `.kiro/prompts/anima-writer-prompt.md`
Prompt specifico pre-configurato per timeline Anima.

**Già configurato con:**
- Tono: Crescita, supporto, tenerezza
- Lunghezza: 4000 parole
- Focus: Intimità emotiva, vulnerabilità condivisa
- Stile: Prosa morbida, contemplativa

**Usa questo per:** Anima (nessuna personalizzazione necessaria)

### `.kiro/prompts/eros-writer-prompt.md`
Prompt specifico pre-configurato per timeline Eros.

**Già configurato con:**
- Tono: Passione, intensità, sensorialità
- Lunghezza: 2000-3000 parole
- Focus: Desiderio, tensione fisica ed emotiva
- Stile: Diretto, sensoriale

**Usa questo per:** Eros (nessuna personalizzazione necessaria)

### `.kiro/prompts/bloom-writer-prompt.md`
Prompt specifico pre-configurato per timeline Bloom.

**Già configurato con:**
- Tono: Scoperta, equilibrio, fioritura
- Lunghezza: 2000-3000 parole
- Focus: Trasformazione positiva, nuovi inizi
- Stile: Poetico, evocativo
- Protagonista: Ro

**Usa questo per:** Bloom (nessuna personalizzazione necessaria)

### `.kiro/prompts/pulse-writer-prompt.md`
Prompt specifico pre-configurato per timeline Pulse.

**Già configurato con:**
- Tono: Diario personale, autenticità
- Lunghezza: 2000-3000 parole
- Focus: Stream of consciousness, riflessioni quotidiane
- Stile: Conversazionale, diretto
- POV: SEMPRE Nic (caratteristica unica)

**Usa questo per:** Pulse (nessuna personalizzazione necessaria)

## 🚀 Come Usare

### Setup Automatico (Consigliato)

```bash
cd timeline-[nome]
bash ../.github/scripts/setup-timeline-agent.sh [timeline]
```

Esempio:
```bash
cd timeline-anima
bash ../.github/scripts/setup-timeline-agent.sh anima
```

Lo script:
- ✅ Crea directory `.kiro/agents/` e `.kiro/prompts/`
- ✅ Copia configurazione agente
- ✅ Copia prompt appropriato (specifico o generico)
- ✅ Sostituisce placeholder automaticamente
- ✅ Crea struttura planning docs
- ✅ Verifica setup

### Setup Manuale

1. **Crea directory nel repository timeline:**
   ```bash
   cd timeline-[nome]
   mkdir -p .kiro/agents
   mkdir -p .kiro/prompts
   ```

2. **Copia template agente:**
   ```bash
   cp ../.github/template/kiro-agent.json .kiro/agents/writer.json
   ```

3. **Copia template prompt:**
   
   **Per Anima:**
   ```bash
   cp ../.github/template/.kiro/prompts/anima-writer-prompt.md .kiro/prompts/writer-prompt.md
   ```
   
   **Per Eros:**
   ```bash
   cp ../.github/template/.kiro/prompts/eros-writer-prompt.md .kiro/prompts/writer-prompt.md
   ```
   
   **Per Bloom:**
   ```bash
   cp ../.github/template/.kiro/prompts/bloom-writer-prompt.md .kiro/prompts/writer-prompt.md
   ```
   
   **Per Pulse:**
   ```bash
   cp ../.github/template/.kiro/prompts/pulse-writer-prompt.md .kiro/prompts/writer-prompt.md
   ```

4. **Personalizza `.kiro/agents/writer.json`:**
   
   Sostituisci i placeholder:
   ```json
   {
     "name": "anima-writer",  // [timeline]-writer
     "description": "Specialized writing agent for ANIMA timeline",  // [TIMELINE]
     ...
     "mcpServers": {
       "echoes": {
         ...
         "env": {
           "ECHOES_TIMELINE": "anima"  // [timeline]
         }
       }
     }
   }
   ```

5. **Personalizza `.kiro/prompts/writer-prompt.md`:**
   
   **Se hai usato un template specifico** (anima, eros, bloom, pulse):
   - ✅ Nessuna personalizzazione necessaria!
   - Già pre-configurato con tono, lunghezza, focus corretti
   
   **Se hai usato il template generico** (`writer-prompt.md`):
   - Sostituisci tutti i placeholder:
   - `[TIMELINE]` → nome timeline uppercase
   - `[timeline]` → nome timeline lowercase
   - `[TONE_DESCRIPTION]` → dal doc `02-writing-guidelines.md`
   - `[LENGTH]` → lunghezza target
   - `[FOCUS_DESCRIPTION]` → tema principale
   - `[DETAILED_TONE_DESCRIPTION]` → copia da `02-writing-guidelines.md`

6. **Verifica configurazione:**
   ```bash
   cat .kiro/agents/writer.json | grep -E "name|ECHOES_TIMELINE"
   # Dovrebbe mostrare nome corretto e timeline
   ```

7. **Test agente:**
   ```bash
   kiro chat
   ```
   
   Verifica che:
   - Conosca Echoes
   - Abbia accesso a MCP tools
   - Legga planning docs
   - Segua il tono corretto

## 📋 Checklist Setup

- [ ] Directory `.kiro/agents/` creata
- [ ] Directory `.kiro/prompts/` creata
- [ ] `agents/writer.json` copiato e personalizzato
- [ ] `writer-prompt.md` copiato e personalizzato
- [ ] Placeholder sostituiti correttamente
- [ ] Timeline name consistente in tutti i file
- [ ] Resources path corretti
- [ ] MCP server configurato
- [ ] Tools `@echoes` abilitato
- [ ] Agente testato

## 🔍 Verifica Configurazione

### Verifica agent.json

```bash
# Nome agente
jq '.name' .kiro/agents/writer.json
# → "anima-writer"

# Timeline in env
jq '.mcpServers.echoes.env.ECHOES_TIMELINE' .kiro/agents/writer.json
# → "anima"

# Resources include steering
jq '.resources[]' .kiro/agents/writer.json | grep steering
# → "file://../../../.github/.kiro/steering/*.md"

# Tools include @echoes
jq '.tools[]' .kiro/agents/writer.json | grep echoes
# → "@echoes"
```

### Verifica prompt

```bash
# Prompt file esiste
ls -la .kiro/prompts/writer-prompt.md

# Prompt referenziato in agent.json
jq '.prompt' .kiro/agents/writer.json
# → "file://./.kiro/prompts/writer-prompt.md"

# Nessun placeholder rimasto (se personalizzato)
grep -E '\[TIMELINE\]|\[timeline\]|\[LENGTH\]' .kiro/prompts/writer-prompt.md
# → (nessun output se tutto ok)
```

## 🆘 Troubleshooting

### Agente non trova il prompt
**Errore:** "Cannot read prompt file"

**Fix:** Verifica path in `agents/writer.json`:
```json
"prompt": "file://./.kiro/prompts/writer-prompt.md"
```

Path deve essere relativo a dove si trova `writer.json`.

### MCP tools non disponibili
**Errore:** Tools `@echoes` non trovati

**Fix:** Verifica in `agents/writer.json`:
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
  "file://../../../.github/.kiro/steering/*.md",  // Tre livelli su
  ...
]
```

Da `timeline-anima/.kiro/agents/writer.json` → `../../../.github/` porta a `.github/`

## 📚 Documentazione Completa

Per dettagli completi sul setup:
- [`.kiro/WALKTHROUGH.md`](../.kiro/WALKTHROUGH.md) - Guida step-by-step
- [`.kiro/SETUP-CHECKLIST.md`](../.kiro/SETUP-CHECKLIST.md) - Checklist completa
- [`README.md`](../README.md) - Overview organizzazione

---

**Questi template garantiscono configurazione consistente per tutti gli agenti timeline!** ✨
