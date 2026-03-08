# Indice Documentazione Echoes

Guida completa a tutta la documentazione disponibile.

## 📚 Documentazione Base (Steering)

Documentazione condivisa ereditata da tutti gli agenti.

| File | Scopo | Quando Usare |
|------|-------|--------------|
| [README.md](steering/README.md) | Guida all'uso della documentazione | Orientamento iniziale |
| [00-echoes-overview.md](steering/00-echoes-overview.md) | Panoramica progetto, timeline, architettura | Riferimento generale, prima volta |
| [01-content-structure.md](steering/01-content-structure.md) | Gerarchia, filesystem, frontmatter | Creare file, verificare struttura |
| [02-writing-guidelines.md](steering/02-writing-guidelines.md) | Stile, tono, tecniche narrative | Prima di scrivere, auto-review |
| [03-metadata-frontmatter.md](steering/03-metadata-frontmatter.md) | Schema YAML, validazione | Creare frontmatter, fix errori |
| [04-mcp-tools-reference.md](steering/04-mcp-tools-reference.md) | Tutti gli MCP tools con esempi | Usare tools, troubleshooting |
| [05-workflow-writing.md](steering/05-workflow-writing.md) | Workflow step-by-step completo | Scrivere capitoli, checklist |
| [QUICK-REFERENCE.md](steering/QUICK-REFERENCE.md) | Cheat sheet rapido | Riferimento durante scrittura |

## 🛠️ Guide di Setup

Documentazione per configurazione.

| File | Scopo | Quando Usare |
|------|-------|--------------|
| [WALKTHROUGH.md](WALKTHROUGH.md) | Guida setup completa step-by-step | Setup timeline, reference principale |
| [SETUP-CHECKLIST.md](SETUP-CHECKLIST.md) | Checklist interattiva per setup | Durante setup timeline |

## 📋 Template

Template per nuovi repository e documenti.

| File | Scopo | Quando Usare |
|------|-------|--------------|
| [../template/timeline-steering-template.md](../template/timeline-steering-template.md) | Template steering timeline-specific | Creare steering per nuova timeline |
| [../template/docs/character-sheet.md](../template/docs/character-sheet.md) | Template character sheet | Documentare personaggio |
| [../template/docs/episode-outline.md](../template/docs/episode-outline.md) | Template episode outline | Pianificare episodio |
| [../template/docs/location.md](../template/docs/location.md) | Template location | Documentare location |

## 📖 Documentazione Principale

Documentazione nel root del repository.

| File | Scopo | Quando Usare |
|------|-------|--------------|
| [../README.md](../README.md) | Documentazione principale repository | Overview generale |
| [../profile/README.md](../profile/README.md) | Profilo pubblico organizzazione | Info pubbliche Echoes |

## 🗂️ Organizzazione per Caso d'Uso

### 🆕 Primo Setup

1. [`SETUP-SUMMARY.md`](../SETUP-SUMMARY.md) - Leggi per overview
2. [`steering/00-echoes-overview.md`](steering/00-echoes-overview.md) - Capire Echoes
3. [`SETUP-COMPLETE.md`](SETUP-COMPLETE.md) - Guida dettagliata
4. [`SETUP-CHECKLIST.md`](SETUP-CHECKLIST.md) - Segui checklist

### ✍️ Scrivere un Capitolo

1. [`steering/05-workflow-writing.md`](steering/05-workflow-writing.md) - Workflow completo
2. [`steering/02-writing-guidelines.md`](steering/02-writing-guidelines.md) - Stile e tono
3. [`steering/04-mcp-tools-reference.md`](steering/04-mcp-tools-reference.md) - Usare MCP tools
4. [`steering/QUICK-REFERENCE.md`](steering/QUICK-REFERENCE.md) - Cheat sheet

### 🔧 Configurare Agente

1. [`../template/kiro-agent-example.json`](../template/kiro-agent-example.json) - Template
2. [`SETUP-COMPLETE.md`](SETUP-COMPLETE.md) - Istruzioni dettagliate
3. [`SETUP-CHECKLIST.md`](SETUP-CHECKLIST.md) - Checklist setup

### 📝 Creare Planning Docs

1. [`../template/docs/character-sheet.md`](../template/docs/character-sheet.md) - Template personaggio
2. [`../template/docs/episode-outline.md`](../template/docs/episode-outline.md) - Template episodio
3. [`../template/docs/location.md`](../template/docs/location.md) - Template location

### 🔍 Troubleshooting

1. [`steering/04-mcp-tools-reference.md`](steering/04-mcp-tools-reference.md) - MCP tools issues
2. [`SETUP-COMPLETE.md`](SETUP-COMPLETE.md) - Troubleshooting section
3. [`steering/QUICK-REFERENCE.md`](steering/QUICK-REFERENCE.md) - Quick fixes

### 🔄 Migrazione da CAO

1. [`MIGRATION-CAO-TO-KIRO.md`](MIGRATION-CAO-TO-KIRO.md) - Guida completa
2. [`VISUAL-STRUCTURE.md`](VISUAL-STRUCTURE.md) - Capire differenze
3. [`SETUP-CHECKLIST.md`](SETUP-CHECKLIST.md) - Checklist migrazione

## 📊 Mappa Concettuale

```
ECHOES DOCUMENTATION
│
├─ 🎯 QUICK START
│  ├─ SETUP-SUMMARY.md
│  ├─ steering/00-echoes-overview.md
│  └─ SETUP-CHECKLIST.md
│
├─ 📚 CORE DOCUMENTATION (steering/)
│  ├─ 00-echoes-overview.md      [Fondamenta]
│  ├─ 01-content-structure.md    [Organizzazione]
│  ├─ 02-writing-guidelines.md   [Stile]
│  ├─ 03-metadata-frontmatter.md [Metadata]
│  ├─ 04-mcp-tools-reference.md  [Tools]
│  ├─ 05-workflow-writing.md     [Processo]
│  └─ QUICK-REFERENCE.md         [Cheat Sheet]
│
├─ 🛠️ SETUP & MIGRATION
│  ├─ SETUP-COMPLETE.md
│  ├─ SETUP-CHECKLIST.md
│  ├─ MIGRATION-CAO-TO-KIRO.md
│  └─ VISUAL-STRUCTURE.md
│
├─ 📋 TEMPLATES
│  ├─ kiro-agent-example.json
│  └─ docs/
│     ├─ character-sheet.md
│     ├─ episode-outline.md
│     └─ location.md
│
└─ 📖 REFERENCE
   ├─ README.md
   ├─ profile/README.md
   └─ INDEX.md (questo file)
```

## 🔗 Link Rapidi

### Per Sviluppatori
- [Setup Completo](SETUP-COMPLETE.md)
- [Migrazione CAO→Kiro](MIGRATION-CAO-TO-KIRO.md)
- [Struttura Visuale](VISUAL-STRUCTURE.md)

### Per Scrittori
- [Workflow Scrittura](steering/05-workflow-writing.md)
- [Linee Guida](steering/02-writing-guidelines.md)
- [Quick Reference](steering/QUICK-REFERENCE.md)

### Per Agenti
- [Overview Echoes](steering/00-echoes-overview.md)
- [Struttura Contenuti](steering/01-content-structure.md)
- [MCP Tools](steering/04-mcp-tools-reference.md)

## 📏 Dimensioni Documenti

| Documento | Righe | Complessità | Tempo Lettura |
|-----------|-------|-------------|---------------|
| 00-echoes-overview.md | ~400 | Media | 10-15 min |
| 01-content-structure.md | ~600 | Alta | 15-20 min |
| 02-writing-guidelines.md | ~500 | Media | 12-18 min |
| 03-metadata-frontmatter.md | ~550 | Alta | 15-20 min |
| 04-mcp-tools-reference.md | ~700 | Alta | 20-25 min |
| 05-workflow-writing.md | ~650 | Media | 18-22 min |
| QUICK-REFERENCE.md | ~200 | Bassa | 5-8 min |

**Tempo totale lettura completa:** ~2-3 ore

## 🎓 Percorsi di Apprendimento

### Percorso Rapido (30 min)
1. SETUP-SUMMARY.md (5 min)
2. steering/00-echoes-overview.md (10 min)
3. steering/QUICK-REFERENCE.md (5 min)
4. SETUP-CHECKLIST.md (10 min)

### Percorso Completo (3 ore)
1. SETUP-SUMMARY.md
2. Tutti i file steering/ in ordine
3. SETUP-COMPLETE.md
4. VISUAL-STRUCTURE.md

### Percorso Scrittore (1 ora)
1. steering/00-echoes-overview.md
2. steering/02-writing-guidelines.md
3. steering/05-workflow-writing.md
4. steering/QUICK-REFERENCE.md

### Percorso Tecnico (1.5 ore)
1. steering/01-content-structure.md
2. steering/03-metadata-frontmatter.md
3. steering/04-mcp-tools-reference.md
4. SETUP-COMPLETE.md

## 🔄 Aggiornamenti

**Ultima revisione:** 2025-12-02

**Changelog:**
- 2025-12-02: Creazione iniziale documentazione completa
- Aggiunta timeline Pulse
- Migrazione da CAO a Kiro
- Workflow semplificato

**Prossimi aggiornamenti:**
- [ ] Esempi video/screenshot
- [ ] FAQ estesa
- [ ] Troubleshooting guide avanzata
- [ ] Case studies per timeline

## 📞 Supporto

**Documentazione non chiara?**
- Apri issue su `.github` repository
- Suggerisci miglioramenti via PR
- Chiedi chiarimenti nei commenti

**Bug o problemi tecnici?**
- Consulta troubleshooting in documenti pertinenti
- Verifica SETUP-COMPLETE.md
- Apri issue con dettagli

---

**Usa questo indice come punto di partenza per navigare tutta la documentazione Echoes!** 📚
