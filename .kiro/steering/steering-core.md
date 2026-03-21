# Echoes — Core Steering

Echoes è una piattaforma di storytelling multi-POV. Le voci dei personaggi risuonano attraverso narrative interconnesse in diverse timeline.

## Timeline

| Timeline | Tema | Tono | Lunghezza capitolo |
|----------|------|------|--------------------|
| 🌿 Anima | Crescita, tenerezza | Morbido, contemplativo | 4000 parole |
| ❤️ Eros | Passione, intensità | Diretto, sensoriale | 2000-3000 parole |
| 🌸 Bloom | Scoperta, fioritura | Poetico, evocativo (protagonista: Ro) | 2000-3000 parole |
| 💫 Pulse | Diario personale | Conversazionale (POV: sempre Nic) | 2000-3000 parole |

## Gerarchia Contenuti

```
Timeline → Arc → Episode → [Part (opzionale)] → Chapter (.md)
```

- Part è OPZIONALE, chapter dipende da episode (non da part)
- Un capitolo = un file markdown con frontmatter YAML

## Naming Conventions

- Episode directory: `ep{XX}-{title-slug}` (2 cifre: ep01, ep12)
- Chapter file: `ep{XX}-ch{XXX}-{pov}-{title-slug}.md` (3 cifre: ch001, ch015)
- POV nel filename: lowercase (marie, nic, ale)
- Arc directory: lowercase, no spazi

## Filesystem

```
timeline-{name}/
├── content/{arc}/{epXX-title}/{epXX-chXXX-pov-title}.md
├── docs/characters/    # Character sheets
├── docs/episodes/      # Episode outlines (frontmatter: chapters: N)
├── docs/locations/     # Location descriptions
└── docs/timeline-steering.md
```

## Frontmatter (campi required)

```yaml
---
pov: string          # lowercase (marie, nic, ale)
title: string        # max 100 char
date: string         # "YYYY-MM-DD, Description" (es. "2024-04-19, Friday")
timeline: string     # anima | eros | bloom | pulse
arc: string          # lowercase
episode: number      # intero positivo
chapter: number      # intero positivo
summary: string      # riassunto capitolo, max 300 char (NON le prime frasi)
location: string     # specifico ("Apartment", non "home")
---
```

Opzionali: `part` (number|null), `outfit` (string — tutti i personaggi femminili, non solo POV), `kink` (string — principalmente Eros).

## Regole Critiche

### SEMPRE
1. Un POV per capitolo — NO head-hopping mai
2. Show don't tell — emozioni attraverso azioni e dettagli fisici
3. Almeno 3 sensi per scena (vista, udito, tatto, olfatto, gusto)
4. Monologo interiore ricco — deep dive nei pensieri del POV
5. Descrizioni outfit personaggi femminili in TUTTE le timeline
6. Usare `words-count` MCP tool per conteggio parole (NON bash `wc`)
7. Sync database dopo ogni capitolo scritto
8. Consultare planning docs (characters, episodes, locations) prima di scrivere
9. Verificare continuità con capitoli precedenti via RAG

### MAI
1. Head-hopping (accedere ai pensieri di personaggi non-POV)
2. Location generiche ("home", "outside", "somewhere")
3. Summary = prime frasi del capitolo (deve essere un vero riassunto)
4. Saltare il context gathering prima della scrittura
5. Date in formato ISO timestamp (usare "YYYY-MM-DD, Description")

## Formato Messaggi

```markdown
**Nome 🦆:** Testo messaggio
**Io:** Risposta del POV
```

## Struttura Capitolo

- Apertura (200-300 parole): hook, stabilisce POV/location/atmosfera
- Sviluppo (1500-2000 parole): scena principale, dialoghi, monologo interiore
- Chiusura (200-300 parole): risoluzione, riflessione, immagine finale

## MCP Tools Disponibili

- Content: `chapter-info`, `episode-info`, `chapter-refresh`, `chapter-insert`, `chapter-delete`, `episode-update`, `words-count`
- Sync: `timeline-sync`
- RAG: `rag-index`, `rag-search`, `rag-context`, `rag-characters`
- Stats: `stats`, `timeline-overview`

## Workflow Rapido

```
1. IDENTIFICA → timeline, arc, episode, chapter, pov
2. CONTEXT    → sync db se necessario, episode-info, rag-context, planning docs
3. SCRIVI     → segui struttura apertura/sviluppo/chiusura, tono timeline
4. ANTIPATTERN → grep meccanico: "il tipo di" ≤2, "come se" ≤4, anglicismi (0 Nic, ≤2 Ale)
5. VALIDA     → continuità (RAG), checklist qualità, subagent checker
6. METADATA   → frontmatter completo, words-count
7. SYNC       → chapter-refresh o timeline-sync, rag-index
```

### Step 4 — Check Anti-pattern (OBBLIGATORIO prima dei subagent)
```bash
grep -c "il tipo di" capitolo.md    # ≤ 2
grep -c "come se" capitolo.md       # ≤ 4
grep -ci "basically\|obviously" capitolo.md  # 0 se Nic, ≤ 2 se Ale
```
Se sopra soglia, fixare PRIMA di lanciare i checker.

## Arc README

Ogni arc ha `content/{arc}/README.md`:
```yaml
---
status: planned | active | hiatus | complete
episodes:
  ep01-titolo: complete
---
```

Aggiornare quando si completa un episodio o arco.
