# Echoes Quick Reference Card

Riferimento rapido per agenti Echoes. Per dettagli completi, consulta i documenti specifici.

## 🎯 Timeline Toni

| Timeline | Tema | Atmosfera | Stile |
|----------|------|-----------|-------|
| 🌿 **Anima** | Crescita, supporto, tenerezza | Intimità emotiva, calore | Morbido, contemplativo |
| ❤️ **Eros** | Passione, intensità, emozione cruda | Desiderio, tensione | Diretto, sensoriale |
| 🌸 **Bloom** | Scoperta, equilibrio, fioritura | Trasformazione, armonia | Poetico, evocativo |
| 💫 **Pulse** | Diario personale, riflessioni | Autenticità, intimità | Conversazionale, diretto |

## 📁 Struttura Gerarchia

```
Timeline → Arc → Episode → Chapter
                    ↓
                  Part (opzionale)
```

**Naming:**
- Episode: `ep01`, `ep02`, `ep12` (2 cifre)
- Chapter: `ch001`, `ch015`, `ch123` (3 cifre)
- File: `ep01-ch001-marie-title.md`

## 📝 Frontmatter Essenziale

```yaml
---
pov: marie                    # required, lowercase
title: "Chapter Title"        # required, max 100 char
date: "2024-04-19, Friday"    # required, date + description
timeline: anima               # required
arc: matilde                  # required
episode: 1                    # required, number
chapter: 3                    # required, number
summary: "Chapter summary..."  # required, riassunto capitolo
location: "Apartment"         # required, specific
outfit: "Marie: green sweater; Angi: black dress"  # optional, female chars
kink: "intimacy, tenderness"  # optional (mainly Eros)
---
```

## 🔧 MCP Tools Essenziali

### Context Gathering
```typescript
// Info episodio
episode-info({ timeline, arc, episode })

// Info capitolo
chapter-info({ timeline, arc, episode, chapter })

// Context narrativo
rag-context({ timeline, query, topK: 5 })

// Ricerca scene simili
rag-search({ timeline, query, topK: 3 })

// Interazioni personaggio
rag-characters({ timeline, character })
```

### Database Sync
```typescript
// Sync completo (PRIMA di RAG!)
timeline-sync({ timeline, contentPath })

// Index per RAG
rag-index({ timeline, contentPath })

// Refresh singolo capitolo
chapter-refresh({ timeline, arc, episode, chapter, filePath })
```

### Statistiche
```typescript
// Stats timeline/arc/episode
stats({ timeline, arc?, episode? })
```

## 🚀 Workflow Rapido

```
1. IDENTIFICA
   timeline, arc, episode, chapter, pov

2. CONTEXT
   - Sync database (se necessario)
   - episode-info
   - rag-context
   - Leggi planning docs

3. SCRIVI
   - Apertura (200-300w)
   - Sviluppo (1500-2000w)
   - Chiusura (200-300w)

4. VALIDA
   - Auto-review
   - Verifica continuità (RAG)

5. METADATA
   - Genera frontmatter
   - Valida con Zod

6. SYNC
   - Salva file
   - timeline-sync
   - rag-index
```

## ✅ Checklist Scrittura

**Prima:**
- [ ] Context gathering completo
- [ ] Planning docs letti
- [ ] Obiettivi chiari

**Durante:**
- [ ] POV consistente (no head-hopping)
- [ ] 3+ sensi coinvolti
- [ ] Show don't tell
- [ ] Tono timeline corretto

**Dopo:**
- [ ] Lunghezza corretta (Anima: 4000w; altre: 2000-3000w)
- [ ] Continuità verificata
- [ ] Frontmatter completo
- [ ] Database synced

## 🎨 Tecniche Narrative

**Monologo Interiore:**
```
❌ Marie era nervosa.
✅ Le parole le si aggrovigliavano in gola.
```

**Show Don't Tell:**
```
❌ Nic era felice di vederla.
✅ Il sorriso di Nic si allargò quando la vide.
```

**Dettagli Sensoriali:**
```
Vista + Udito + Tatto + Olfatto + Gusto
Almeno 3 per scena!
```

**Pacing:**
```
Lento: frasi lunghe, virgole, dettagli
Veloce: frasi brevi, verbi d'azione
```

## 🔍 RAG Search Tips

**Background generale:**
```typescript
rag-context({
  timeline: 'anima',
  query: 'sviluppo emotivo Marie',
  topK: 5
})
```

**Scene specifiche:**
```typescript
rag-search({
  timeline: 'anima',
  query: 'momenti di intimità mattutina',
  topK: 3
})
```

**Interazioni tra personaggi:**
```typescript
rag-search({
  timeline: 'anima',
  query: 'conversazione profonda',
  characters: ['marie', 'nic'],
  allCharacters: true  // entrambi presenti
})
```

## 🚨 Troubleshooting Rapido

| Problema | Soluzione |
|----------|-----------|
| RAG → 0 risultati | `timeline-sync` + `rag-index` |
| Frontmatter invalido | Verifica con Zod, controlla ISO 8601 date |
| Location generica | Usa nome specifico ("Apartment" non "home") |
| POV inconsistente | Un POV per capitolo, no head-hopping |
| Excerpt troppo lungo | Max 300 char, prime 2-3 frasi |

## 📚 Documenti Completi

- `00-echoes-overview.md` - Panoramica progetto
- `01-content-structure.md` - Struttura dettagliata
- `02-writing-guidelines.md` - Linee guida complete
- `03-metadata-frontmatter.md` - Reference frontmatter
- `04-mcp-tools-reference.md` - Tutti gli MCP tools
- `05-workflow-writing.md` - Workflow step-by-step

---

**Stampa questa pagina per riferimento rapido durante la scrittura!** 📋
