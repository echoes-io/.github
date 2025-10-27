# Echoes.io Organization Configuration

This repository contains shared configurations and resources for the [echoes.io](https://github.com/echoes-io) organization.

## Contents

- **`profile/README.md`** - Organization profile (visible on https://github.com/echoes-io)
- **`.amazonq/cli-agents/default.json`** - Main orchestrator agent for project-wide tasks
- **`.github/workflows/publish-content.yml`** - Shared workflow for timeline content publishing
- **`template/`** - Templates for repositories and planning documentation
- **`WRITING_WORKFLOW.md`** - Complete guide for writing timeline content
- **`EPISODE_PLANNING.md`** - Complete guide for planning new episodes

## Current Project Status

### ✅ Completed Repositories

**Core Libraries (4/4)**
- `@echoes-io/brand` - Visual identity and timeline color palettes
- `@echoes-io/utils` - Markdown parsing and text utilities
- `@echoes-io/models` - TypeScript types and Zod validation schemas
- `@echoes-io/tracker` - SQLite database with Kysely query builder

**Timeline Content (3/3)**
- `timeline-anima` - 55 chapters (matilde: 5, anima: 50)
- `timeline-eros` - 266 chapters (ale: 122, gio: 57, work: 87)
- `timeline-bloom` - 5 chapters (bloom: 5)

### 🚧 In Development

**AI Services (2/2)**
- `@echoes-io/mcp-server` - Model Context Protocol server for AI integration
- `@echoes-io/rag` - Semantic search and vector embeddings system

**Publishing Tools (1/1)**
- `@echoes-io/books-generator` - LaTeX book generation and compilation system

### 📋 Planned

**Applications**
- `echoes-web-app` - Frontend application

## Repository Template

The `template/` directory contains standardized configurations and planning templates for echoes.io repositories:

### Repository Setup (`template/repo/`)

```bash
# Copy template to new repository
cp -r template/repo/* /path/to/new-repo/
cd /path/to/new-repo

# Customize placeholders
sed -i 's/@echoes-io\/PACKAGE_NAME/@echoes-io\/your-package-name/g' package.json README.md
sed -i 's/PACKAGE_DESCRIPTION/Your package description/g' package.json README.md

# Initialize
npm install
git init
git add .
git commit -m "feat: initial repository setup"
```

### Planning Templates (`template/docs/`)

For timeline repositories, copy planning templates:

```bash
# Copy planning templates to timeline repository
cp -r template/docs/* timeline-anima/docs/templates/

# Create new character sheet
cp docs/templates/character-sheet.md docs/characters/new-character.md

# Create new episode outline  
cp docs/templates/episode-outline.md docs/episodes/ep03-title.md
```

#### Available Templates

**`character-sheet.md`** - Character development template with:
- Basic information and appearance
- Current personality and relationships  
- Character evolution across episodes
- Episode-specific notes

**`episode-outline.md`** - Episode planning template with:
- Overview and themes
- Character roles and development
- 3-act structure with chapter breakdown
- Locations and continuity notes

**`location.md`** - Location documentation template with:
- Physical description and atmosphere
- Usage history across episodes
- Character connections and symbolic meaning

### Included Files

- **`.github/workflows/release.yml`** - Automated testing, building, and NPM publishing
- **`.editorconfig`** - Editor configuration for consistent formatting
- **`.gitignore`** - Standard Node.js/TypeScript exclusions
- **`.lintstagedrc`** - Pre-commit hooks for quality checks
- **`biome.json`** - Linting and formatting configuration
- **`LICENSE`** - MIT license
- **`package.json`** - NPM package configuration with semantic release
- **`README.md`** - Documentation template
- **`tsconfig.json`** - TypeScript configuration
- **`vitest.config.ts`** - Testing configuration

### Features

✅ **TypeScript strict mode** with Node.js 22 target  
✅ **Automated testing** with Vitest and coverage reporting  
✅ **Linting** with Biome (replaces ESLint + Prettier)  
✅ **Pre-commit hooks** with lint-staged and husky  
✅ **Semantic versioning** with automated changelog generation  
✅ **NPM publishing** with provenance and access control  
✅ **GitHub Actions** for CI/CD pipeline  

## Content Migration Status

### Migration Completed ✅
- **324 chapters** migrated with structured frontmatter
- **Organized by arcs**: Timeline → Arc → Episode → Chapter hierarchy
- **Metadata validation**: POV, titles, dates, locations extracted
- **File naming**: Consistent `ep##-ch###-pov-title.md` convention

### Content Structure
```
timeline-{name}/content/
├── {arc-name}/
│   └── {ep##-episode-title}/
│       └── {ep##-ch###-pov-title}.md
```

### Frontmatter Schema
```yaml
---
pov: string          # Point of view character
title: string        # Chapter title  
date: string         # Publication date
timeline: string     # Timeline name
arc: string          # Arc name
episode: number      # Episode number
part: number         # Part number
chapter: number      # Chapter number
excerpt: string      # Brief description
location: string     # Scene location
outfit: string       # (optional) Character outfit
kink: string         # (optional) Content tags
---
```

## AI Integration

### Amazon Q CLI Agents
Each repository includes specialized agents:
- **Main orchestrator** (`/.amazonq/cli-agents/default.json`) - Project-wide coordination
- **Timeline agents** - Content-specific assistance with MCP server integration
- **Service agents** - Development assistance for core libraries

### MCP Server Tools
The `@echoes-io/mcp-server` provides:
- `words-count` - Chapter word counting
- `chapter-info` - Metadata and statistics
- `episode-info` - Episode overview
- `words-update` - Tracker database sync
- `chapter-add/update/delete` - Content CRUD operations
- `book-generate` - LaTeX compilation via @echoes-io/books-generator

### RAG System
The `@echoes-io/rag` system enables:
- **Vector embeddings** for all 324 chapters
- **Semantic search** across timelines and characters
- **Context retrieval** for AI interactions
- **Similarity matching** for narrative connections

---

**Echoes** - Multi-POV storytelling platform ✨
