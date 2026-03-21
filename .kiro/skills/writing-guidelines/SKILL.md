---
name: writing-guidelines
description: Narrative techniques, tone per timeline, sensory details, pacing, dialogue and message formatting, outfit descriptions, chapter structure, continuity checklist. Use when writing, revising, or expanding chapters.
---

# Linee Guida per la Scrittura Echoes

## Stile Narrativo Core

- **Letterario ma accessibile** — prosa curata senza essere pretenzioso
- **POV intimo in terza persona** — deep dive nei pensieri del POV, filtro percettivo costante, NO head-hopping
- **Show don't tell** — emozioni attraverso azioni fisiche, dettagli che rivelano stato d'animo
- **Ricchezza sensoriale** — coinvolgere almeno 3 sensi per scena (vista, udito, tatto, olfatto, gusto)

## Tono per Timeline

### 🌿 Anima — Crescita e Tenerezza
- Prosa morbida, avvolgente, ritmo contemplativo
- Focus su emozioni sottili, cura reciproca, vulnerabilità condivisa
- Temi: supporto reciproco, accettazione, guarigione emotiva, fiducia

> Marie sentì il calore della mano di Nic sulla sua, un gesto semplice che portava con sé la promessa silenziosa di presenza.

### ❤️ Eros — Passione e Intensità
- Prosa diretta, sensoriale, ritmo variabile (lento/intenso)
- Focus su sensazioni fisiche, linguaggio corporeo esplicito, tensione
- Temi: desiderio, potere e vulnerabilità, esplorazione, connessione attraverso il corpo

> Le dita di Ale tracciarono la linea della sua schiena con una lentezza deliberata, ogni centimetro un territorio conquistato.

### 🌸 Bloom — Scoperta e Fioritura
- Prosa poetica, evocativa, ritmo fluido, metafore naturali
- Focus su momenti di rivelazione, trasformazione positiva
- Protagonista: Ro
- Temi: scoperta di sé, cambiamento, equilibrio, sbocciare personale

> Ro sentì qualcosa dentro di lei schiudersi—non con violenza, ma con la naturalezza di un fiore che si apre al sole.

### 💫 Pulse — Diario Personale
- Prosa diretta, conversazionale, stream of consciousness
- POV: SEMPRE Nic, nessuna protagonista femminile fissa
- Temi: vita quotidiana, riflessioni personali, autenticità

> Oggi ho pensato a quanto sia strano il modo in cui le giornate si accumulano.

## Tecniche Narrative

### Monologo Interiore

```
❌ Marie era nervosa. Si chiedeva se Nic l'avrebbe capita.
✅ Le parole le si aggrovigliavano in gola. Come poteva spiegare qualcosa che lei stessa non capiva del tutto?
```

### Dettagli Sensoriali (almeno 3 per scena)

- **Vista** — luce, ombre, movimento, dettagli emotivi (mani che tremano)
- **Udito** — suoni ambientali, tono di voce, respiro, silenzio
- **Tatto** — texture, temperatura, pressione, contatto
- **Olfatto** — profumi che evocano memorie, odori di luoghi
- **Gusto** — sapori, sensazioni in bocca

### Pacing

- **Lento (contemplazione):** frasi lunghe, virgole, dettagli, riflessioni
- **Veloce (tensione):** frasi brevi, verbi d'azione, meno descrizioni

## Struttura Capitolo

| Timeline | Lunghezza |
|----------|-----------|
| Anima | 4000 parole |
| Eros/Bloom/Pulse | 2000-3000 parole |

- **Apertura (200-300w):** hook, stabilisce POV/location/atmosfera
- **Sviluppo (1500-2000w):** scena principale, dialoghi, monologo interiore
- **Chiusura (200-300w):** risoluzione, riflessione, immagine finale

## Descrizioni Outfit

⚠️ **FONDAMENTALE in TUTTE le timeline:** soffermarsi su come i personaggi femminili sono vestiti.

- Descrivi tessuti, colori, vestibilità, come i vestiti si muovono
- In Eros: enfasi sulla sensualità, vestiti più audaci
- L'abbigliamento rivela carattere e racconta la storia

**Anima:** "Un maglione verde morbido che le scivolava su una spalla — incredibilmente vulnerabile."
**Eros:** "Il vestito nero era una seconda pelle. Seta che seguiva ogni curva."
**Bloom:** "Un abito estivo color terracotta che danzava intorno alle sue gambe."

## Dialoghi e Messaggi

**Dialoghi parlati:**
```
"Io..." Marie si interruppe, le dita che giocherellavano con l'orlo della tazza. "Non so se ha senso."
Nic si avvicinò, la voce bassa. "Prova comunque."
```

**Messaggi (WhatsApp/Discord):**
```
**GioGio 🦆:** Papà ma sei già in aeroporto???
**Io:** Come ti conosco?
**GioGio 🦆:** Sei sempre 2 ore prima quando sei nervoso
```

Regole: emoji caratteristiche per personaggio, `**Io:**` per il POV, tono del personaggio nei messaggi.

## Continuità Narrativa

- **Personaggi:** tratti core consistenti, evoluzione graduale, quirks riconoscibili
- **Relazioni:** dinamiche evolvono naturalmente, riferimenti a eventi passati
- **Luoghi:** layout consistente, atmosfera riconoscibile, storia del luogo
- **Eventi:** sequenza logica, nessuna contraddizione, setup e payoff

## Anti-pattern — Limiti Quantitativi per Capitolo

⚠️ **Verificare con grep DOPO ogni capitolo scritto, PRIMA dei subagent checker.**

| Pattern | Max/capitolo | Note |
|---------|-------------|------|
| `il tipo di [noun] che` | 2 | Riscrivere con descrizione diretta |
| Tricolon `X, Y e Z` / `X. Y. Z.` | 5-6 | Alternare con coppie, liste lunghe, immagini singole |
| `come se` (simili) | 3-4 | Alternare con metafore dirette, paragoni senza "come" |
| `quello/a che` + em-dash | 4-5 | Alternare con relative, apposizioni, frasi separate |
| `il corpo [verb]` autonomo (sa/decide/risponde/ricorda) | 2 | Mostrare il corpo che agisce senza commentarlo |
| Tag fisici ricorrenti (fossetta, neo, ecc.) | 1 | Max 5-6 per episodio intero |
| Oggetti-ambiente ricorrenti (candela, divano, palo) | 1 con dettaglio, illimitati senza | Non ripetere il materiale/marca ogni volta |

### Verifica meccanica post-scrittura
```bash
grep -c "il tipo di" capitolo.md    # ≤ 2
grep -c "come se" capitolo.md       # ≤ 4
grep -c "il corpo" capitolo.md      # controllare quanti sono autonomi
```

### Differenziazione strutturale POV

I due POV devono suonare diversi NON solo nel vocabolario ma nella **struttura dei paragrafi**:

| Aspetto | Nic | Ale |
|---------|-----|-----|
| Frasi | Più lunghe, analitiche, con incisi | Più corte, sensoriali, frammentate |
| Pensiero | A lista (enumera, cataloga, calcola) | Per immagini (corpo, vestiti, spazi) |
| Metafore | IT (server, deploy, Excel, bug, ping) | Fashion/finance, corpo come territorio |
| Anglicismi | **ZERO** (usa "praticamente", "in pratica") | 1-2/capitolo (basically, obviously) |
| Paragrafi | Più densi, meno frammentati | Più ritmici, con stacchi netti |
| Riflessione | Analizza cause ed effetti | Sente prima, capisce dopo |

## Checklist

**Pre-scrittura:** capitoli precedenti letti? Character sheet consultato? Episode outline letto? Obiettivi chiari?

**Post-scrittura:** POV consistente? Dialoghi naturali? 3+ sensi? Tono timeline? Show don't tell? Lunghezza corretta? Anti-pattern sotto soglia? POV strutturalmente distinto?
