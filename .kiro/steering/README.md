# Echoes Steering Documentation

Questa directory contiene la **documentazione base condivisa** per tutti gli agenti Echoes.

## 📚 Documenti Disponibili

### [00-echoes-overview.md](./00-echoes-overview.md)
**Panoramica generale del progetto Echoes**
- Cos'è Echoes e le sue timeline
- Architettura tecnica e repository structure
- Tech stack e filosofia di scrittura
- Convenzioni di naming e workflow base

**Quando consultare:**
- Prima volta che lavori su Echoes
- Per capire la struttura generale
- Per riferimento rapido su timeline e toni

### [01-content-structure.md](./01-content-structure.md)
**Struttura dettagliata dei contenuti**
- Gerarchia completa (Timeline → Arc → Episode → Chapter)
- Layout filesystem e naming conventions
- Schema frontmatter YAML completo
- Database sync e validazione

**Quando consultare:**
- Prima di creare nuovi file
- Per verificare naming conventions
- Per capire la struttura frontmatter
- Per troubleshooting organizzazione file

### [02-writing-guidelines.md](./02-writing-guidelines.md)
**Linee guida per la scrittura narrativa**
- Principi fondamentali dello stile Echoes
- Tono specifico per ogni timeline
- Tecniche narrative (monologo interiore, dettagli sensoriali, pacing)
- Struttura capitolo e dialoghi
- Checklist pre/post scrittura

**Quando consultare:**
- Prima di scrivere un capitolo
- Per verificare tono della timeline
- Per tecniche narrative specifiche
- Per auto-review qualità

### [03-metadata-frontmatter.md](./03-metadata-frontmatter.md)
**Guida completa a metadata e frontmatter**
- Schema YAML dettagliato
- Tutti i campi (required e optional)
- Regole di validazione
- Esempi per ogni timeline
- Generazione automatica

**Quando consultare:**
- Prima di creare frontmatter
- Per validare metadata
- Per troubleshooting errori Zod
- Per esempi specifici

### [04-mcp-tools-reference.md](./04-mcp-tools-reference.md)
**Reference completa degli MCP tools**
- Tutti i tools disponibili con parametri
- Esempi d'uso per ogni tool
- Workflow tipici
- Best practices per RAG e sync

**Quando consultare:**
- Prima di usare MCP tools
- Per capire quale tool usare
- Per esempi di query RAG
- Per troubleshooting sync

### [05-workflow-writing.md](./05-workflow-writing.md)
**Workflow step-by-step per scrivere capitoli**
- Processo completo dalla pianificazione alla pubblicazione
- Context gathering con MCP tools
- Validazione e continuità
- Metadata e sync database

**Quando consultare:**
- Prima di iniziare un nuovo capitolo
- Per seguire il processo corretto
- Per verificare di non saltare step
- Come checklist durante scrittura

---

## 🎯 Come Usare Questa Documentazione

### Per Agenti Timeline

Gli agenti Kiro delle singole timeline **ereditano automaticamente** questa documentazione:

```json
{
  "name": "anima-writer",
  "resources": [
    "file://../.github/.kiro/steering/*.md",
    "file://docs/characters/*.md",
    "file://docs/episodes/*.md"
  ]
}
```

Questo significa che ogni agente ha accesso a:
- ✅ Tutta la documentazione base Echoes
- ✅ Planning docs specifici della timeline
- ✅ Context completo per scrittura

### Per Sviluppatori

Quando aggiorni la documentazione:

1. **Modifica i file in `.github/.kiro/steering/`**
2. **Commit e push**
3. **Tutti gli agenti timeline ricevono automaticamente gli aggiornamenti**

Non serve modificare configurazioni degli agenti individuali!

### Per Nuove Timeline

Quando crei una nuova timeline:

1. Crea il repository timeline
2. Configura agente Kiro con reference a questi file
3. Aggiungi planning docs specifici
4. L'agente avrà automaticamente tutta la base knowledge

---

## 📖 Ordine di Lettura Consigliato

### Prima Volta (Setup Iniziale)
1. `00-echoes-overview.md` - Capire il progetto
2. `01-content-structure.md` - Capire l'organizzazione
3. `04-mcp-tools-reference.md` - Capire gli strumenti
4. `05-workflow-writing.md` - Capire il processo

### Prima di Scrivere un Capitolo
1. `05-workflow-writing.md` - Seguire il workflow
2. `02-writing-guidelines.md` - Verificare stile e tono
3. `04-mcp-tools-reference.md` - Usare MCP tools
4. `03-metadata-frontmatter.md` - Creare frontmatter

### Durante Troubleshooting
- **Errori frontmatter:** `03-metadata-frontmatter.md`
- **Problemi sync:** `04-mcp-tools-reference.md` (sezione Database Sync)
- **RAG restituisce 0 risultati:** `04-mcp-tools-reference.md` (Setup Iniziale)
- **Naming conventions:** `01-content-structure.md`
- **Stile/tono:** `02-writing-guidelines.md`

---

## 🔄 Aggiornamenti

Questa documentazione è **viva** e viene aggiornata regolarmente.

**Changelog:**
- 2025-12-02: Creazione iniziale con 6 documenti base
- Aggiunta timeline Pulse
- Workflow semplificato e chiarito

**Prossimi aggiornamenti pianificati:**
- [ ] Esempi completi per ogni timeline
- [ ] Troubleshooting guide estesa
- [ ] Video tutorials (opzionale)
- [ ] Template per planning docs

---

## 💡 Contribuire

Per suggerimenti o correzioni:

1. Apri issue su `.github` repository
2. Proponi modifiche via PR
3. Discuti nei commenti

**Principi per contributi:**
- Chiarezza sopra completezza
- Esempi pratici sempre
- Mantieni consistenza con documenti esistenti
- Testa le modifiche con agenti reali

---

## 🆘 Supporto

Se hai domande o problemi:

1. Consulta la documentazione pertinente
2. Cerca in `04-mcp-tools-reference.md` per problemi tecnici
3. Verifica `05-workflow-writing.md` per problemi di processo
4. Apri issue se il problema persiste

---

**Questa documentazione è il cuore della knowledge base Echoes. Mantienila aggiornata e accurata!** ✨
