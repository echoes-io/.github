# Echoes Web Development Agents - CAO System

Sistema di agenti specializzati per lo sviluppo del sito web Echoes utilizzando CLI Agent Orchestrator (CAO).

## 🎯 Stack Tecnologico

- **Framework:** Next.js 16 (App Router) + TypeScript + React
- **Styling:** Tailwind CSS + shadcn/ui + @echoes-io/brand
- **Database:** PostgreSQL (Neon) + Drizzle ORM
- **Deploy:** Vercel (automatic)
- **Testing:** Vitest (unit) + Playwright (e2e)
- **CI/CD:** GitHub Actions (timeline repos → web app)

## 🤖 Workflow Multi-Agente

Il sistema implementa un workflow coordinato con specializzazioni diverse:

```
web_dev (orchestratore)
├── web_dev_database_engineer (schema + migrations)
├── web_dev_ui_ux_designer (wireframe + design system)
├── web_dev_component_developer (React components)
├── web_dev_integration_engineer (API + GitHub Actions)
├── web_dev_test_engineer (unit + e2e)
└── web_dev_performance_optimizer (Next.js optimization)
```

### 🏗️ web_dev
**Ruolo:** Coordina lo sviluppo e definisce l'architettura generale
- Analizza requisiti e definisce struttura Next.js
- Pianifica routes, layouts, data fetching strategy
- Coordina handoff agli altri agenti
- **Tools:** `fs_read`, `fs_write`, `execute_bash`, `@cao-mcp-server`

### 🗄️ web_dev_database_engineer
**Ruolo:** Gestisce schema database e migrations
- Definisce schema Drizzle per Postgres
- Crea e gestisce migrations
- Ottimizza query e indici
- **Tools:** `fs_read`, `fs_write`, `execute_bash`

### 🎨 web_dev_ui_ux_designer
**Ruolo:** Design system e user experience
- Crea wireframe e user flows
- Integra @echoes-io/brand con Tailwind
- Configura shadcn/ui con palette timeline
- Documenta design system
- **Tools:** `fs_read`, `fs_write`

### ⚛️ web_dev_component_developer
**Ruolo:** Implementa componenti React
- Sviluppa componenti TypeScript + React
- Customizza shadcn/ui components
- Implementa design system
- **Tools:** `fs_read`, `fs_write`, `execute_bash`

### 🔌 web_dev_integration_engineer
**Ruolo:** Integrazione content sync e API
- GitHub Actions per sync timeline → Postgres
- API routes Next.js per CRUD
- Server actions e data fetching
- **Tools:** `fs_read`, `fs_write`, `execute_bash`

### 🧪 web_dev_test_engineer
**Ruolo:** Testing completo dell'applicazione
- Unit tests con Vitest
- E2E tests con Playwright
- Accessibility testing
- **Tools:** `fs_read`, `fs_write`, `execute_bash`

### ⚡ web_dev_performance_optimizer
**Ruolo:** Ottimizzazione performance e SEO
- Next.js optimization (ISR, caching, streaming)
- Image optimization
- Lighthouse audits
- Core Web Vitals
- **Tools:** `fs_read`, `fs_write`, `execute_bash`

## 🚀 Come Usare il Sistema

### Prerequisiti
1. **CAO installato** e configurato
2. **Node.js 22+** installato
3. **Agenti installati** in CAO

### Installazione Agenti
```bash
# Installa tutti gli agenti web-dev da GitHub
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_database_engineer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_ui_ux_designer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_component_developer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_integration_engineer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_test_engineer.md
cao install https://raw.githubusercontent.com/echoes-io/.github/main/cao-agents/web-dev/web_dev_performance_optimizer.md
```

### Avvio Workflow
```bash
# Avvia CAO server
cao-server

# In altro terminale, lancia l'orchestratore
cao launch --agents web_dev

# Descrivi la feature da implementare
# Es: "Voglio la pagina timeline Anima con lista episodi e preview capitoli"
```

## 🎨 Design System - Timeline Palettes

### 🌿 Anima - Crescita e Tenerezza
```css
--anima-50: #f6f8f6
--anima-500: #7a9b76
--anima-900: #2d4a2a
```

### ❤️ Eros - Passione e Intensità
```css
--eros-50: #faf5f5
--eros-500: #8b3a3a
--eros-900: #4a1f1f
```

### 🌸 Bloom - Scoperta e Equilibrio
```css
--bloom-50: #faf7f5
--bloom-500: #c17a5f
--bloom-900: #5a3628
```

## 🔄 Content Sync Architecture

```
Timeline Repository (push to main)
  ↓
GitHub Action (parse markdown + frontmatter)
  ↓
POST to Next.js API Route (/api/content/sync)
  ↓
Drizzle ORM → Insert/Update Postgres (Neon)
  ↓
Revalidate Next.js Pages (ISR)
  ↓
Updated Content Live on Site
```

## 📁 Next.js 16 App Structure

```
echoes-web-app/
├── app/
│   ├── (timelines)/
│   │   ├── anima/
│   │   │   ├── page.tsx
│   │   │   └── [arc]/
│   │   │       └── [episode]/
│   │   │           └── [chapter]/
│   │   │               └── page.tsx
│   │   ├── eros/
│   │   └── bloom/
│   ├── api/
│   │   └── content/
│   │       └── sync/
│   │           └── route.ts
│   └── layout.tsx
├── components/
│   ├── ui/ (shadcn)
│   └── timeline/
├── lib/
│   ├── db/ (Drizzle)
│   └── utils/
└── drizzle/
    ├── schema.ts
    └── migrations/
```

## 🧪 Testing Strategy

### Unit Tests (Vitest)
- Componenti React
- Utility functions
- API route handlers

### E2E Tests (Playwright)
- User flows completi
- Navigation tra timeline
- Content rendering
- Responsive design

### Accessibility Tests
- ARIA labels
- Keyboard navigation
- Screen reader compatibility

## ⚡ Performance Targets

- **Lighthouse Score:** 95+ su tutte le metriche
- **First Contentful Paint:** < 1.5s
- **Time to Interactive:** < 3s
- **Cumulative Layout Shift:** < 0.1

## 🎯 Workflow Tipici

### Scenario 1: Nuova Pagina Timeline
```
web_dev → definisce route structure
  ↓
web_dev_ui_ux_designer → wireframe + design system
  ↓
web_dev_database_engineer → verifica schema
  ↓
web_dev_component_developer → implementa componenti
  ↓
web_dev_integration_engineer → data fetching
  ↓
web_dev_test_engineer → e2e tests
  ↓
web_dev_performance_optimizer → ottimizzazioni
```

### Scenario 2: Content Sync Setup
```
web_dev → definisce API structure
  ↓
web_dev_database_engineer → schema per content
  ↓
web_dev_integration_engineer → GitHub Action + API route
  ↓
web_dev_test_engineer → integration tests
```

### Scenario 3: Design System Component
```
web_dev_ui_ux_designer → design specs
  ↓
web_dev_component_developer → implementazione
  ↓
web_dev_test_engineer → component tests
```

## 🔧 Integrazione con Echoes Ecosystem

### Dipendenze NPM
- `@echoes-io/brand` - Design system e palette
- `@echoes-io/models` - TypeScript types per content
- `@echoes-io/utils` - Utility functions (markdown parsing, etc.)

### Content Structure
Il web app consuma la stessa struttura gerarchica:
```
Timeline → Arc → Episode → Part → Chapter
```

Ogni chapter ha frontmatter validato con `@echoes-io/models`.

## 🎨 shadcn/ui Customization

shadcn components vengono customizzati con le palette timeline:

```tsx
// components/ui/button.tsx
const buttonVariants = cva(
  "base-styles",
  {
    variants: {
      timeline: {
        anima: "bg-anima-500 hover:bg-anima-600",
        eros: "bg-eros-500 hover:bg-eros-600",
        bloom: "bg-bloom-500 hover:bg-bloom-600",
      }
    }
  }
)
```

## 📚 Risorse

- [Next.js 16 Docs](https://nextjs.org/docs)
- [Drizzle ORM Docs](https://orm.drizzle.team)
- [shadcn/ui Docs](https://ui.shadcn.com)
- [Playwright Docs](https://playwright.dev)
- [Vercel Docs](https://vercel.com/docs)

---

**Echoes Web Development System** - Dove il codice incontra la narrativa ✨
