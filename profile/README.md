# Echoes.io

**Multi-POV storytelling platform** where characters' voices echo through interconnected narratives across different timelines.

## 🎭 What is Echoes?

Echoes is a platform for telling rich, layered stories from multiple perspectives. Each timeline represents a different narrative universe, with characters whose experiences resonate and connect across the stories.

### Timelines

- **🌿 Anima** - Stories of growth, support, and tenderness
- **❤️ Eros** - Tales of passion, intensity, and raw emotion  
- **🌸 Bloom** - Narratives of discovery, balance, and blossoming

## 🏗️ Architecture

Echoes is built as a modular, multi-repository system organized around content hierarchies and specialized services.

### Content Structure

```
Timeline (story universe)
├── Arc (story phase)
│   ├── Episode (story event)
│   │   ├── Part (optional subdivision)
│   │   │   └── Chapter (individual .md file)
```

Each chapter is a markdown file with structured frontmatter, enabling flexible organization and rich storytelling across ~200 existing chapters ready for migration.

### Core Libraries (✅ Complete)

- **[@echoes-io/brand](https://github.com/echoes-io/brand)** - Visual identity with timeline-specific color palettes and typography system
- **[@echoes-io/utils](https://github.com/echoes-io/utils)** - Markdown parsing, text statistics, and path generation utilities
- **[@echoes-io/models](https://github.com/echoes-io/models)** - TypeScript interfaces and Zod validation schemas for content hierarchy
- **[@echoes-io/tracker](https://github.com/echoes-io/tracker)** - SQLite database with type-safe queries for content management

### Content Repositories (🚧 In Progress)

- **echoes-timeline-anima** - Anima timeline content with markdown chapters
- **echoes-timeline-eros** - Eros timeline content with markdown chapters
- **echoes-timeline-bloom** - Bloom timeline content with markdown chapters

### Services (🚧 Planned)

- **echoes-mcp-server** - AI integration via Model Context Protocol for content operations
- **echoes-rag** - Semantic search and context retrieval with vector embeddings
- **echoes-web-app** - Frontend application consuming all services
- **echoes-latex** - Book generation and compilation system

## 🛠️ Tech Stack

- **Language**: TypeScript with strict type safety
- **Runtime**: Node.js ecosystem
- **Database**: SQLite with Kysely query builder
- **Validation**: Zod schemas for runtime type checking
- **Testing**: Vitest with comprehensive coverage
- **AI Integration**: Model Context Protocol (MCP)

## 📚 Content Management

Stories are organized using a hierarchical file structure with consistent naming conventions:

- **Episodes**: 2-digit padding (`ep01`, `ep02`)
- **Chapters**: 3-digit padding (`ch001`, `ch005`)
- **Files**: `content/<arc-name>/<ep01-episode-title>/<ep01-ch001-pov-title>.md`

Each chapter includes structured metadata for character POV, timeline placement, location, and content statistics.

## 🤖 AI-Powered Development

All repositories include pre-configured [Amazon Q CLI](https://aws.amazon.com/q/developer/) agents for intelligent assistance with repository-specific tasks and cross-project coordination.

## 🔄 Shared Workflows

The organization provides reusable GitHub Actions workflows for common tasks:

### Content Publishing

Timeline repositories can use the shared workflow for processing and publishing content:

```yaml
# .github/workflows/publish.yml
name: Publish Timeline Content

on:
  push:
    branches: [main]
    paths: ['content/**/*.md']

jobs:
  publish:
    uses: echoes-io/.github/.github/workflows/publish-content.yml@main
    with:
      timeline-name: 'anima'  # Change for each timeline
      content-path: 'content/'
      web-app-url: 'https://app.echoes.io'
    secrets:
      WEB_APP_TOKEN: ${{ secrets.WEB_APP_TOKEN }}
```

The workflow automatically:
- Processes markdown files with frontmatter
- Extracts metadata and calculates text statistics
- Uploads processed content to the web application
- Handles error reporting and artifacts

## 🎨 Design Philosophy

- **Literary yet accessible** - Reflects the storytelling nature while remaining technically robust
- **Type-safe** - Strict TypeScript throughout for reliability
- **Modular** - Each package serves a single, well-defined purpose
- **Tested** - Comprehensive test coverage ensures quality
- **Consistent** - Unified structure and conventions across all repositories

## 🌟 Current Status

**Active Development** - Core libraries complete and published to NPM. Content migration and service development in progress.

The project focuses on creating a robust foundation for multi-perspective storytelling with modern web technologies and AI-assisted content management.

---

*Echoes: where stories resonate across timelines* ✨
