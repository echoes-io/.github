# Metadata e Frontmatter Echoes

## Schema Frontmatter Completo

Ogni capitolo DEVE iniziare con un blocco YAML frontmatter:

```yaml
---
pov: string          # Point of view character (required)
title: string        # Chapter title (required)
date: string         # Date with description (required, e.g. "2024-04-19, Friday")
timeline: string     # Timeline name (required)
arc: string          # Arc name (required)
episode: number      # Episode number (required)
part: number         # Part number (optional, nullable)
chapter: number      # Chapter number (required)
summary: string      # Chapter summary (required)
location: string     # Scene location (required)
outfit: string       # Main female characters' outfits (optional)
kink: string         # Content tags (optional, mainly Eros)
---
```

## Campi Obbligatori

### pov (string)

**Definizione:** Nome del personaggio punto di vista

**Regole:**
- Lowercase, no spazi
- Nome semplice (non nome completo)
- Consistente attraverso tutti i capitoli del personaggio

**Esempi Validi:**
```yaml
pov: marie
pov: nic
pov: ale
pov: gio
pov: angi
pov: vi
```

**Esempi NON Validi:**
```yaml
pov: Marie          # ❌ Uppercase
pov: marie-anne     # ❌ Nome composto (usa solo primo nome)
pov: Marie Dubois   # ❌ Nome completo
```

### title (string)

**Definizione:** Titolo del capitolo

**Regole:**
- Max 100 caratteri
- Descrittivo ma conciso
- Cattura l'essenza del capitolo
- Può essere poetico/evocativo

**Esempi Validi:**
```yaml
title: "Awakening"
title: "Morning Light"
title: "The Weight of Silence"
title: "Between Breaths"
title: "Reflection"
```

**Best Practices:**
- Evita titoli generici ("Chapter 1", "Untitled")
- Usa titoli che evocano atmosfera
- Può essere una parola singola o frase breve
- Consistente con tono della timeline

### date (string)

**Definizione:** Data con descrizione leggibile

**Formato:** Data ISO + descrizione (giorno della settimana, periodo, etc.)

**Esempi Validi:**
```yaml
date: "2024-04-19, Friday"
date: "2024-12-25, Christmas Day"
date: "2024-07-15, Mid-summer"
date: "2024-01-01, New Year"
```

**Componenti:**
- Data ISO: `YYYY-MM-DD`
- Virgola + spazio: `, `
- Descrizione: giorno settimana, festività, periodo

**⚠️ IMPORTANTE:**
- Sempre formato `YYYY-MM-DD, Description`
- La descrizione rende la data più evocativa
- Può includere contesto temporale narrativo

### timeline (string)

**Definizione:** Nome della timeline

**Valori Validi:**
```yaml
timeline: anima
timeline: eros
timeline: bloom
timeline: pulse
```

**⚠️ IMPORTANTE:**
- Lowercase
- Deve corrispondere al nome del repository
- Validato contro lista timelines esistenti

### arc (string)

**Definizione:** Nome dell'arc narrativo

**Regole:**
- Lowercase, no spazi
- Descrittivo della fase narrativa
- Consistente all'interno della timeline

**Esempi per Timeline:**

**Anima:**
```yaml
arc: matilde
arc: anima
```

**Eros:**
```yaml
arc: ale
arc: gio
arc: work
```

**Bloom:**
```yaml
arc: bloom
```

**Pulse:**
```yaml
arc: diary
arc: reflections
```

### episode (number)

**Definizione:** Numero dell'episodio

**Regole:**
- Intero positivo (1, 2, 3, ...)
- Progressivo all'interno dell'arc
- Corrisponde al numero in `ep{XX}` nel filename

**Esempi:**
```yaml
episode: 1    # corrisponde a ep01
episode: 3    # corrisponde a ep03
episode: 12   # corrisponde a ep12
```

**⚠️ IMPORTANTE:**
- Nel frontmatter: numero senza padding (1, 12)
- Nel filename: numero con padding (ep01, ep12)

### chapter (number)

**Definizione:** Numero del capitolo

**Regole:**
- Intero positivo (1, 2, 3, ...)
- Progressivo all'interno dell'episodio
- Corrisponde al numero in `ch{XXX}` nel filename

**Esempi:**
```yaml
chapter: 1     # corrisponde a ch001
chapter: 15    # corrisponde a ch015
chapter: 123   # corrisponde a ch123
```

**⚠️ IMPORTANTE:**
- Nel frontmatter: numero senza padding (1, 15)
- Nel filename: numero con padding (ch001, ch015)

### summary (string)

**Definizione:** Riassunto del capitolo

**Regole:**
- Riassunto conciso di cosa succede nel capitolo
- Non le prime frasi, ma una sintesi
- Cattura eventi principali e sviluppo emotivo
- Può contenere spoiler (è un riassunto)

**Esempi Validi:**
```yaml
summary: "Nic vola da Milano a Londra per incontrare la sua gilda di WoW per la prima volta. Ansioso e sudato all'aeroporto, arriva al Meltdown pub dove scopre che James, Tom e Marie sono persone reali, interessanti e accoglienti. Si sente finalmente a casa."

summary: "Marie si sveglia nell'appartamento di Nic. Riflette sulla notte passata insieme e su come si sente finalmente al sicuro. Decidono di passare la giornata insieme."

summary: "Ale e Gio hanno una conversazione intensa sul loro rapporto. La tensione fisica è palpabile ma decidono di prendersi tempo."
```

**Best Practices:**
- Riassumi gli eventi principali
- Includi sviluppo emotivo chiave
- Menziona personaggi coinvolti
- Cattura l'essenza del capitolo

### location (string)

**Definizione:** Luogo principale della scena

**Regole:**
- Specifico, non generico
- Consistente con descrizioni precedenti
- Nome proprio del luogo quando possibile

**Esempi Validi:**
```yaml
location: "Apartment"
location: "Office"
location: "Central Park"
location: "Marie's Bedroom"
location: "Coffee Shop on 5th Avenue"
```

**Esempi NON Validi:**
```yaml
location: "home"        # ❌ Troppo generico
location: "outside"     # ❌ Troppo vago
location: "somewhere"   # ❌ Non specifico
location: "a place"     # ❌ Inutile
```

**Best Practices:**
- Usa nomi propri quando disponibili
- Sii specifico (non "casa" ma "Apartment di Marie")
- Consistente attraverso i capitoli
- Consulta location docs per dettagli

## Campi Opzionali

### part (number, nullable)

**Definizione:** Numero della part (se l'episodio usa parts)

**Regole:**
- Intero positivo se presente
- `null` o omesso se l'episodio non ha parts
- La maggior parte dei capitoli NON avrà questo campo

**Quando Usare:**
```yaml
# Episodio con parts
part: 1
part: 2

# Episodio senza parts (default)
part: null
# oppure ometti il campo completamente
```

**⚠️ IMPORTANTE:**
- Part è OPZIONALE
- Default: non usare parts
- Solo per episodi molto lunghi o complessi

### outfit (string, optional)

**Definizione:** Descrizione dell'abbigliamento dei personaggi femminili principali

**⚠️ IMPORTANTE:** Non solo del POV, ma di TUTTI i personaggi femminili principali nella scena

**Regole:**
- Descrizione degli outfit dei personaggi femminili
- Conciso ma evocativo
- Solo se rilevante per la scena
- Può includere più personaggi

**Esempi Validi:**
```yaml
outfit: "Marie: green sweater and jeans; Angi: black dress"
outfit: "Ale: silk robe, black"
outfit: "Gio: white t-shirt and shorts; Vi: summer dress"
outfit: "Marie: light blue cotton pajamas"
```

**Quando Usare:**
- Outfit significativi per la scena
- Prima apparizione in un episodio
- Descrizioni importanti per l'atmosfera
- Quando l'abbigliamento è parte della narrazione

**Quando NON Usare:**
- Outfit non menzionati nel capitolo
- Dettagli completamente irrilevanti

### kink (string, optional)

**Definizione:** Tag di contenuto (principalmente per timeline Eros)

**Regole:**
- Comma-separated tags
- Descrittivi, non espliciti
- Principalmente per Eros, raramente per altre timeline

**Esempi Validi:**
```yaml
kink: "intimacy, tenderness"
kink: "intensity, passion"
kink: "vulnerability, trust"
kink: "exploration, discovery"
```

**Timeline Usage:**
- **Eros:** Usato frequentemente
- **Anima:** Raramente (solo per momenti intimi)
- **Bloom:** Occasionalmente
- **Pulse:** Raramente

## Validazione

### Zod Schema

Il frontmatter è validato con Zod schema da `@echoes-io/models`:

```typescript
import { chapterFrontmatterSchema } from '@echoes-io/models'

try {
  const validated = chapterFrontmatterSchema.parse(frontmatter)
  console.log('✅ Frontmatter valido')
} catch (error) {
  console.error('❌ Errore validazione:', error.message)
}
```

### Regole di Validazione

**Campi Obbligatori:**
- Tutti i campi required devono essere presenti
- Nessun campo required può essere null o vuoto
- Tipi devono corrispondere (string, number)

**Lunghezze:**
- `title`: max 100 caratteri
- `excerpt`: max 300 caratteri
- `pov`: non vuoto
- `location`: non vuoto

**Formati:**
- `date`: ISO 8601 valido
- `timeline`: uno dei valori validi (anima, eros, bloom, pulse)
- `episode`: intero positivo
- `chapter`: intero positivo

**Coerenza Filename:**
- `ep{episode}` nel filename = `episode` nel frontmatter
- `ch{chapter}` nel filename = `chapter` nel frontmatter
- `{pov}` nel filename = `pov` nel frontmatter

### Errori Comuni

```yaml
# ❌ ERRORE: date non ISO 8601
date: "2025-12-02"  # manca timestamp

# ✅ CORRETTO
date: "2025-12-02T10:30:00.000Z"

# ❌ ERRORE: timeline non valida
timeline: "anima-special"

# ✅ CORRETTO
timeline: "anima"

# ❌ ERRORE: excerpt troppo lungo
excerpt: "Una descrizione lunghissima che supera i 300 caratteri e continua per molto tempo descrivendo ogni singolo dettaglio della scena in modo eccessivamente verboso e ridondante fino a superare ampiamente il limite massimo consentito per questo campo che dovrebbe essere conciso e catturare solo l'essenza del capitolo."

# ✅ CORRETTO
excerpt: "Marie si svegliò con il sole negli occhi. Per un momento non ricordò dove fosse."

# ❌ ERRORE: location generica
location: "home"

# ✅ CORRETTO
location: "Apartment"
```

## Generazione Automatica

### Excerpt da Contenuto

```typescript
function generateExcerpt(content: string): string {
  // Prendi prime 2-3 frasi
  const sentences = content.match(/[^.!?]+[.!?]+/g) || []
  const excerpt = sentences.slice(0, 2).join(' ')
  
  // Tronca a 300 caratteri se necessario
  if (excerpt.length > 300) {
    return excerpt.substring(0, 297) + '...'
  }
  
  return excerpt
}
```

### Location da Contenuto

```typescript
function extractLocation(content: string): string | null {
  // Cerca pattern comuni
  const patterns = [
    /location:\s*([^.\n]+)/i,
    /in (?:the\s+)?([A-Z][a-z]+(?:\s+[A-Z][a-z]+)*)/,
    /at (?:the\s+)?([A-Z][a-z]+(?:\s+[A-Z][a-z]+)*)/
  ]
  
  for (const pattern of patterns) {
    const match = content.match(pattern)
    if (match) return match[1].trim()
  }
  
  return null
}
```

### Outfit da Contenuto

```typescript
function extractOutfit(content: string): string | null {
  // Cerca menzioni di abbigliamento
  const patterns = [
    /wearing\s+([^.]+)/i,
    /dressed in\s+([^.]+)/i,
    /outfit:\s*([^.\n]+)/i
  ]
  
  for (const pattern of patterns) {
    const match = content.match(pattern)
    if (match) return match[1].trim()
  }
  
  return null
}
```

## Esempio Completo

### Frontmatter Minimo (Solo Required)

```yaml
---
pov: marie
title: "Awakening"
date: "2025-12-02T10:30:00.000Z"
timeline: anima
arc: matilde
episode: 1
chapter: 3
excerpt: "Marie si svegliò con il sole negli occhi. Per un momento non ricordò dove fosse."
location: "Apartment"
---
```

### Frontmatter Completo (Con Optional)

```yaml
---
pov: marie
title: "Awakening"
date: "2025-12-02T10:30:00.000Z"
timeline: anima
arc: matilde
episode: 1
part: null
chapter: 3
excerpt: "Marie si svegliò con il sole negli occhi. Per un momento non ricordò dove fosse, poi sentì il calore accanto a lei e tutto tornò a posto."
location: "Apartment"
outfit: "Light blue cotton pajamas"
---
```

### Frontmatter Eros (Con Kink)

```yaml
---
pov: ale
title: "Intensity"
date: "2025-12-02T10:30:00.000Z"
timeline: eros
arc: ale
episode: 12
chapter: 45
excerpt: "Le dita di Ale tracciarono la linea della sua schiena con una lentezza deliberata."
location: "Bedroom"
outfit: "Black silk robe"
kink: "intensity, passion, vulnerability"
---
```

## Best Practices

### Compilazione Frontmatter

✅ **Compila tutti i campi required**
- Non lasciare campi vuoti
- Valida prima di salvare

✅ **Usa date ISO 8601 corrette**
- Sempre UTC timezone
- Timestamp completo

✅ **Excerpt conciso ma informativo**
- Prime frasi del capitolo
- Max 300 caratteri
- Cattura atmosfera

✅ **Location specifica**
- Non generica
- Consistente con capitoli precedenti
- Consulta location docs

✅ **Optional solo quando serve**
- `outfit` solo se rilevante
- `kink` principalmente per Eros
- `part` solo se episodio usa parts

### Validazione

✅ **Valida con Zod prima di salvare**
```typescript
chapterFrontmatterSchema.parse(frontmatter)
```

✅ **Verifica coerenza filename**
- Numeri corrispondono
- POV corrisponde
- Naming convention rispettata

✅ **Sync database dopo salvataggio**
```bash
timeline-sync --timeline <timeline>
```

---

**Frontmatter corretto garantisce integrità dei dati e automazione efficace.**
