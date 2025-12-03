# Setup Checklist Echoes

Usa questa checklist per configurare gli agenti Kiro per ogni timeline.

## ✅ Setup Globale (Una Volta)

- [x] Documentazione base creata in `.github/.kiro/steering/`
- [x] Template agente creato in `.github/template/`
- [x] README aggiornato con nuova struttura
- [x] Timeline Pulse aggiunta alla documentazione

## 📋 Setup Per Timeline

Completa questa checklist per ogni timeline (Anima, Eros, Bloom, Pulse).

### Timeline: ________________

#### 1. Configurazione Agente

- [ ] Creata directory `.kiro/prompts/` nel repository timeline
- [ ] Copiato `template/kiro-agent.json` in `.kiro/agent.json`
- [ ] Copiato template prompt appropriato in `.kiro/prompts/writer-prompt.md`
  - [ ] Anima: usa `anima-writer-prompt.md`
  - [ ] Altre: usa `writer-prompt.md` generico e personalizza
- [ ] Personalizzato `name` in agent.json (es. "anima-writer")
- [ ] Personalizzato `description` in agent.json
- [ ] Personalizzato `ECHOES_TIMELINE` in `mcpServers.echoes.env`
- [ ] Personalizzato prompt con tono specifico timeline
- [ ] Verificato `resources` punta a `../../.github/.kiro/steering/*.md`
- [ ] Verificato `resources` include `docs/` locali
- [ ] Verificato `tools` include `"@echoes"`
- [ ] Verificato `allowedTools` include `"@echoes"`

#### 2. Planning Documents

- [ ] Creata struttura `docs/` directory
  - [ ] `docs/characters/`
  - [ ] `docs/episodes/`
  - [ ] `docs/locations/`

**Character Sheets:**
- [ ] Identificati personaggi POV principali
- [ ] Copiato template per ogni personaggio
- [ ] Compilato character sheet per personaggio 1: ________________
- [ ] Compilato character sheet per personaggio 2: ________________
- [ ] Compilato character sheet per personaggio 3: ________________
- [ ] (Aggiungi altri se necessario)

**Episode Outlines:**
- [ ] Identificati episodi da documentare
- [ ] Copiato template per ogni episodio
- [ ] Compilato outline per episodio 1: ________________
- [ ] Compilato outline per episodio 2: ________________
- [ ] Compilato outline per episodio 3: ________________
- [ ] (Aggiungi altri se necessario)

**Locations:**
- [ ] Identificate location ricorrenti
- [ ] Documentata location 1: ________________
- [ ] Documentata location 2: ________________
- [ ] Documentata location 3: ________________
- [ ] (Aggiungi altre se necessario)

#### 3. Database Sync

- [ ] Eseguito `timeline-sync` per sync filesystem → tracker
  ```bash
  timeline-sync --timeline ________ --contentPath ./content
  ```
- [ ] Eseguito `rag-index` per indexing RAG
  ```bash
  rag-index --timeline ________ --contentPath ./content
  ```
- [ ] Verificato che RAG restituisce risultati (non 0)

#### 4. Test Agente

**Test Context:**
- [ ] Agente risponde correttamente a "Cos'è Echoes?"
- [ ] Agente conosce le 4 timeline
- [ ] Agente conosce il tono specifico di questa timeline
- [ ] Agente sa spiegare il workflow di scrittura

**Test MCP Tools:**
- [ ] `episode-info` funziona
  ```
  > "Mostrami la struttura dell'episodio 1"
  ```
- [ ] `chapter-info` funziona
  ```
  > "Dammi info sul capitolo 1 dell'episodio 1"
  ```
- [ ] `rag-search` funziona
  ```
  > "Cerca capitoli con [personaggio]"
  ```
- [ ] `rag-context` funziona
  ```
  > "Dammi context su [tema]"
  ```

**Test Planning Docs:**
- [ ] Agente legge character sheets
  ```
  > "Parlami del personaggio [nome]"
  ```
- [ ] Agente legge episode outlines
  ```
  > "Qual è il tema dell'episodio 1?"
  ```
- [ ] Agente legge location descriptions
  ```
  > "Descrivi [location]"
  ```

**Test Scrittura:**
- [ ] Agente segue workflow corretto
- [ ] Agente raccoglie context prima di scrivere
- [ ] Agente rispetta tono della timeline
- [ ] Agente genera frontmatter completo
- [ ] Agente valida continuità
- [ ] Agente sync database dopo scrittura

#### 5. Scrittura Test Capitolo

- [ ] Scritto capitolo test con agente
- [ ] Verificata lunghezza (2000-3000 parole)
- [ ] Verificato POV consistente
- [ ] Verificato tono appropriato
- [ ] Verificato frontmatter valido
- [ ] Verificato database synced
- [ ] Verificato file salvato correttamente

#### 6. Iterazione e Perfezionamento

- [ ] Raccolto feedback su capitolo test
- [ ] Identificate aree di miglioramento
- [ ] Aggiornato prompt se necessario
- [ ] Aggiornati planning docs se necessario
- [ ] Testato nuovamente

#### 7. Documentazione

- [ ] Documentate customizzazioni specifiche timeline
- [ ] Documentati quirks o particolarità
- [ ] Aggiunte note per futuri aggiornamenti

---

## 🎯 Checklist Rapida

Usa questa per verifiche veloci:

### Pre-Scrittura
- [ ] Database synced
- [ ] Planning docs aggiornati
- [ ] Agente testato recentemente

### Durante Scrittura
- [ ] Context gathering fatto
- [ ] Planning brief preparato
- [ ] Tono timeline rispettato

### Post-Scrittura
- [ ] Continuità verificata
- [ ] Frontmatter completo
- [ ] Database synced
- [ ] File salvato correttamente

---

## 📊 Progress Tracker

| Timeline | Agente | Planning Docs | DB Sync | Test | Scrittura Test | Status |
|----------|--------|---------------|---------|------|----------------|--------|
| 🌿 Anima | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| ❤️ Eros  | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| 🌸 Bloom | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |
| 💫 Pulse | ⬜ | ⬜ | ⬜ | ⬜ | ⬜ | Not Started |

**Legend:**
- ⬜ Not Started
- 🟨 In Progress
- ✅ Complete

---

## 🆘 Troubleshooting Checklist

Se qualcosa non funziona, verifica:

### Agente non conosce Echoes
- [ ] Verificato `resources` in agent.json
- [ ] Path a `.github/.kiro/steering/*.md` corretto
- [ ] File steering esistono e sono leggibili

### MCP Tools non funzionano
- [ ] Verificato `mcpServers` in agent.json
- [ ] `@echoes-io/mcp-server` installabile
- [ ] `allowedTools` include `@echoes-mcp`

### RAG restituisce 0 risultati
- [ ] Eseguito `timeline-sync`
- [ ] Eseguito `rag-index`
- [ ] Verificato che capitoli esistono in `content/`

### Planning docs non trovati
- [ ] Directory `docs/` esiste
- [ ] File `.md` esistono nelle subdirectory
- [ ] Glob pattern in `resources` corretto

### Agente non segue workflow
- [ ] `05-workflow-writing.md` in resources
- [ ] Prompt include reminder di seguire workflow
- [ ] Agente testato con query semplici prima

---

## 📝 Note

Usa questo spazio per note specifiche per timeline:

**Anima:**
```
[Note qui]
```

**Eros:**
```
[Note qui]
```

**Bloom:**
```
[Note qui]
```

**Pulse:**
```
[Note qui]
```

---

**Completa questa checklist per ogni timeline per garantire setup corretto!** ✅
