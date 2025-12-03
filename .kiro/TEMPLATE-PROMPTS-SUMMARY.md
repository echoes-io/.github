# Template Prompt - Riepilogo Completo

Tutti i template prompt per gli agenti Kiro delle timeline Echoes.

## 📁 Template Disponibili

### 1. Template Generico

**File:** `template/.kiro/prompts/writer-prompt.md`

**Quando usare:**
- Per personalizzazioni custom
- Quando nessun template specifico è disponibile

**Richiede personalizzazione:**
- ✅ Tutti i placeholder devono essere sostituiti
- `[TIMELINE]`, `[timeline]`, `[TONE_DESCRIPTION]`, etc.

---

### 2. Anima - Crescita e Tenerezza

**File:** `template/.kiro/prompts/anima-writer-prompt.md`

**Pre-configurato con:**
- **Tono:** Crescita, supporto, tenerezza
- **Lunghezza:** 4000 parole (più lunga per immersione profonda)
- **Focus:** Intimità emotiva, vulnerabilità condivisa
- **Stile:** Prosa morbida, contemplativa
- **Atmosfera:** Calore, connessione profonda

**Caratteristiche:**
- Ritmo contemplativo, mai affrettato
- Focus su emozioni sottili
- Monologo interiore ricco
- Dettagli che rivelano cura reciproca

**Esempio tono:**
> Marie sentì il calore della mano di Nic sulla sua, un gesto semplice che portava con sé la promessa silenziosa di presenza.

**Personalizzazione:** ❌ Non necessaria

---

### 3. Eros - Passione e Intensità

**File:** `template/.kiro/prompts/eros-writer-prompt.md`

**Pre-configurato con:**
- **Tono:** Passione, intensità, emozione cruda
- **Lunghezza:** 2000-3000 parole
- **Focus:** Desiderio palpabile, tensione fisica ed emotiva
- **Stile:** Diretto, sensoriale
- **Atmosfera:** Tensione, esplorazione senza filtri

**Caratteristiche:**
- Prosa diretta e sensoriale
- Focus su sensazioni fisiche
- Linguaggio corporeo esplicito ma elegante
- Ritmo variabile (lento/intenso)
- **Outfit field importante** nel frontmatter
- **Kink field** se rilevante

**Esempio tono:**
> Le dita di Ale tracciarono la linea della sua schiena con una lentezza deliberata, ogni centimetro un territorio conquistato.

**Personalizzazione:** ❌ Non necessaria

---

### 4. Bloom - Scoperta e Fioritura

**File:** `template/.kiro/prompts/bloom-writer-prompt.md`

**Pre-configurato con:**
- **Tono:** Scoperta, equilibrio, fioritura
- **Lunghezza:** 2000-3000 parole
- **Focus:** Trasformazione positiva, nuovi inizi
- **Stile:** Poetico, evocativo
- **Atmosfera:** Armonia emergente, possibilità
- **Protagonista:** Ro

**Caratteristiche:**
- Prosa poetica ed evocativa
- Metafore naturali (fiori, stagioni, crescita)
- Focus su momenti di rivelazione
- Ritmo fluido e armonioso
- Trasformazione sempre positiva

**Esempio tono:**
> Ro sentì qualcosa dentro di lei schiudersi—non con violenza, ma con la naturalezza di un fiore che si apre al sole.

**Personalizzazione:** ❌ Non necessaria

---

### 5. Pulse - Diario Personale

**File:** `template/.kiro/prompts/pulse-writer-prompt.md`

**Pre-configurato con:**
- **Tono:** Diario personale, autenticità
- **Lunghezza:** 2000-3000 parole
- **Focus:** Stream of consciousness, riflessioni quotidiane
- **Stile:** Conversazionale, diretto
- **Atmosfera:** Intimità autentica, vita senza filtri
- **POV:** SEMPRE Nic (caratteristica unica)

**Caratteristiche:**
- Stream of consciousness naturale
- Tono conversazionale (come parlare a un amico)
- Pensieri non filtrati
- Mix di profondo e quotidiano
- Nessuna protagonista femminile fissa
- Formato diario con date reali

**Esempio tono:**
> Oggi ho pensato a quanto sia strano il modo in cui le giornate si accumulano. Non succede niente di particolare, eppure alla fine della settimana ti ritrovi diverso.

**Personalizzazione:** ❌ Non necessaria

---

## 📊 Confronto Rapido

| Timeline | Lunghezza | Tono | Stile | POV | Caratteristica Unica |
|----------|-----------|------|-------|-----|---------------------|
| 🌿 Anima | 4000 | Tenerezza | Contemplativo | Vari | Più lunga, immersione profonda |
| ❤️ Eros | 2000-3000 | Intensità | Sensoriale | Vari | Outfit/kink fields importanti |
| 🌸 Bloom | 2000-3000 | Scoperta | Poetico | Ro (principalmente) | Metafore naturali |
| 💫 Pulse | 2000-3000 | Autenticità | Conversazionale | Nic (sempre) | Stream of consciousness, diario |

## 🚀 Come Scegliere

### Usa template specifico se:
- ✅ Stai configurando Anima, Eros, Bloom, o Pulse
- ✅ Vuoi setup veloce senza personalizzazione
- ✅ Vuoi garantire tono corretto

### Usa template generico se:
- ⚠️ Stai creando una nuova timeline
- ⚠️ Vuoi personalizzazione custom
- ⚠️ Nessun template specifico disponibile

## 📝 Setup Rapido

### Per Anima
```bash
cp ../.github/template/.kiro/prompts/anima-writer-prompt.md .kiro/prompts/writer-prompt.md
# ✅ Fatto! Nessuna personalizzazione necessaria
```

### Per Eros
```bash
cp ../.github/template/.kiro/prompts/eros-writer-prompt.md .kiro/prompts/writer-prompt.md
# ✅ Fatto! Nessuna personalizzazione necessaria
```

### Per Bloom
```bash
cp ../.github/template/.kiro/prompts/bloom-writer-prompt.md .kiro/prompts/writer-prompt.md
# ✅ Fatto! Nessuna personalizzazione necessaria
```

### Per Pulse
```bash
cp ../.github/template/.kiro/prompts/pulse-writer-prompt.md .kiro/prompts/writer-prompt.md
# ✅ Fatto! Nessuna personalizzazione necessaria
```

## ✅ Verifica

Dopo aver copiato il prompt:

```bash
# Verifica file esiste
ls -la .kiro/prompts/writer-prompt.md

# Verifica nessun placeholder rimasto (solo per template generico)
grep -E '\[TIMELINE\]|\[timeline\]|\[LENGTH\]' .kiro/prompts/writer-prompt.md
# → Nessun output se template specifico (corretto!)
# → Output se template generico (devi personalizzare)

# Test agente
kiro chat
```

## 🎯 Best Practices

### Manutenzione
✅ Usa sempre template specifici quando disponibili  
✅ Non modificare template dopo copia (usa versione originale)  
✅ Aggiorna da template quando cambia documentazione  
✅ Testa dopo ogni aggiornamento

### Personalizzazione
✅ Solo se usi template generico  
✅ Sostituisci TUTTI i placeholder  
✅ Verifica con grep che nessun placeholder rimanga  
✅ Consulta `02-writing-guidelines.md` per dettagli tono

### Troubleshooting
✅ Se agente non segue tono: verifica prompt corretto  
✅ Se placeholder visibili: hai dimenticato di sostituire  
✅ Se lunghezza sbagliata: verifica template usato  
✅ Se POV sbagliato (Pulse): verifica template pulse

## 📚 Documentazione Correlata

- [`.kiro/AGENT-CONFIGURATION.md`](.kiro/AGENT-CONFIGURATION.md) - Configurazione completa
- [`.kiro/WALKTHROUGH.md`](.kiro/WALKTHROUGH.md) - Guida step-by-step
- [`template/README.md`](../template/README.md) - Documentazione template
- [`.kiro/steering/02-writing-guidelines.md`](.kiro/steering/02-writing-guidelines.md) - Linee guida tono

---

**Tutti i template sono pronti all'uso! Scegli quello giusto per la tua timeline e inizia subito.** ✨
