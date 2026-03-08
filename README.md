# Echoes.io Organization Configuration

This repository contains shared configurations and resources for the [echoes.io](https://github.com/echoes-io) organization.

## 🚀 Quick Start

**New to Echoes?** Start here:
1. Read [`.kiro/steering/00-echoes-overview.md`](.kiro/steering/00-echoes-overview.md) - Project overview
2. Follow [`.kiro/WALKTHROUGH.md`](.kiro/WALKTHROUGH.md) - Complete setup walkthrough
3. Use [`.kiro/SETUP-CHECKLIST.md`](.kiro/SETUP-CHECKLIST.md) - Checklist per timeline

**Setting up a timeline agent?** Use the automated setup script:

```bash
cd timeline-[nome]
bash ../.github/scripts/setup-timeline-agent.sh [timeline]
```

## 📁 Repository Contents

- **`.kiro/steering/`** - Shared documentation base for all Echoes agents
- **`profile/README.md`** - Organization profile (visible on https://github.com/echoes-io)
- **`template/`** - Templates for repositories and planning documentation

## 📋 Available Templates

### Repository Template (`template/repo/`)

Standard configurations for new echoes.io repositories:
- `.github/workflows/release.yml` - Automated testing, building, and NPM publishing
- `.editorconfig`, `.gitignore`, `.lintstagedrc` - Editor and quality configs
- `biome.json` - Linting and formatting
- `package.json` - NPM package with semantic release
- `tsconfig.json`, `vitest.config.ts` - TypeScript and testing

### Planning Templates (`template/docs/`)

- `character-sheet.md` - Character development template
- `episode-outline.md` - Episode planning with 3-act structure
- `location.md` - Location documentation

## 🤖 AI Integration Setup

### Kiro Agents

Each timeline repository uses a **Kiro agent** configured to inherit shared documentation from this repository.

**Shared Documentation Base** (`.kiro/steering/`):
- `00-echoes-overview.md` - Project overview and architecture
- `01-content-structure.md` - Content hierarchy and file organization
- `02-writing-guidelines.md` - Narrative style and techniques
- `03-metadata-frontmatter.md` - YAML frontmatter reference
- `04-mcp-tools-reference.md` - Complete MCP tools guide
- `05-workflow-writing.md` - Step-by-step writing workflow

**Timeline-specific prompt templates** in `template/.kiro/prompts/`:
- `anima-writer-prompt.md` - 4000 words, tenerezza
- `eros-writer-prompt.md` - 2000-3000 words, intensità
- `bloom-writer-prompt.md` - 2000-3000 words, scoperta
- `pulse-writer-prompt.md` - 2000-3000 words, diario

### MCP Server Integration

Timeline repositories integrate with `@echoes-io/mcp-server` for content operations.

**Initial Setup:**
```bash
# Sync filesystem → database
timeline-sync --timeline <timeline-name> --contentPath ./content

# Index for semantic search
rag-index --timeline <timeline-name> --contentPath ./content
```

**Available MCP Tools:**
- Content: `words-count`, `chapter-info`, `chapter-refresh`, `chapter-insert`, `chapter-delete`, `episode-info`, `episode-update`
- Sync: `timeline-sync`
- RAG: `rag-index`, `rag-search`, `rag-context`, `rag-characters`
- Stats: `stats`

See [`.kiro/steering/04-mcp-tools-reference.md`](.kiro/steering/04-mcp-tools-reference.md) for full documentation.

## 📖 Documentation

- [`.kiro/steering/`](.kiro/steering/) - Complete documentation base
- [`profile/README.md`](profile/README.md) - Organization overview

---

**For project overview and architecture, see the [organization profile](profile/README.md)** ✨
