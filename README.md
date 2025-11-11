# Echoes.io Organization Configuration

This repository contains shared configurations and resources for the [echoes.io](https://github.com/echoes-io) organization.

## 📁 Repository Contents

- **`profile/README.md`** - Organization profile (visible on https://github.com/echoes-io)
- **`.amazonq/cli-agents/default.json`** - Main orchestrator agent for project-wide tasks
- **`.github/workflows/publish-content.yml`** - Shared workflow for timeline content publishing
- **`cao-agents/writer/`** - CAO agents for content creation workflow
- **`cao-agents/web-dev/`** - CAO agents for web application development
- **`template/`** - Templates for repositories and planning documentation
- **`WRITING_WORKFLOW.md`** - Complete guide for writing timeline content

## 🚀 How to Use This Repository

### Creating New Repositories

Use the repository template for consistent setup:

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

### Setting Up Timeline Content Planning

For timeline repositories, copy planning templates:

```bash
# Copy planning templates to timeline repository
cp -r template/docs/* timeline-anima/docs/templates/

# Create new character sheet
cp docs/templates/character-sheet.md docs/characters/marie.md

# Create new episode outline  
cp docs/templates/episode-outline.md docs/episodes/ep03-growth.md
```

### Using Shared Workflows

Timeline repositories can use the shared content publishing workflow:

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

## 📋 Available Templates

### Repository Template (`template/repo/`)

Standard configurations for new echoes.io repositories:

**Included Files:**
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

**Features:**
- ✅ TypeScript strict mode with Node.js 22 target  
- ✅ Automated testing with Vitest and coverage reporting  
- ✅ Linting with Biome (replaces ESLint + Prettier)  
- ✅ Pre-commit hooks with lint-staged and husky  
- ✅ Semantic versioning with automated changelog generation  
- ✅ NPM publishing with provenance and access control  
- ✅ GitHub Actions for CI/CD pipeline  

### Planning Templates (`template/docs/`)

Templates for content planning in timeline repositories:

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

## 🤖 AI Integration Setup

### CLI Agent Orchestrator (CAO)

The project uses [CLI Agent Orchestrator](https://github.com/awslabs/cli-agent-orchestrator) for multi-agent workflows.

#### Echoes Agents (`cao-agents/`)

**Orchestrators (2):**
- **`echoes_writer`** - Coordinates chapter writing workflow, gathers narrative context via MCP, delegates to specialized agents
- **`echoes_web_dev`** - Coordinates web app development, discovers architecture dynamically, delegates to specialized agents

**Specialized Agents (2):**
- **`echoes_continuity`** - Validates narrative continuity across timelines (characters, locations, events, relationships)
- **`echoes_metadata`** - Generates YAML frontmatter, calculates statistics, syncs tracker database via MCP

**Philosophy:** Lightweight orchestrators with dynamic context + minimal specialized agents. Generic tasks delegated to reusable Zweer agents.

#### Zweer Agents (reused from `~/dev/agents/`)

Echoes orchestrators delegate to generic Zweer agents for common tasks:

**Writing:** `zweer_write_narrative`, `zweer_write_style`, `zweer_write_warmth`  
**Web Dev:** `zweer_web_frontend`, `zweer_web_database`, `zweer_web_api_integration`  
**Design:** `zweer_ui_designer`, `zweer_ui_ux`  
**Quality:** `zweer_qa_testing`, `zweer_qa_performance`, `zweer_qa_security`, `zweer_qa_documentation`

#### Installation

**Automated Installation (Recommended):**

```bash
# Install CAO prerequisites and all agents automatically
make install
```

The Makefile installs:
1. **Prerequisites:** tmux configuration, uv package manager, CAO tool
2. **All agents:** Dynamically discovers and installs all agents from `cao-agents/` directory

**Manual Installation:**

```bash
# Install Echoes agents
cao install cao-agents/echoes_writer.md
cao install cao-agents/echoes_web_dev.md
cao install cao-agents/echoes_continuity.md
cao install cao-agents/echoes_metadata.md

# Install Zweer agents (from ~/dev/agents/)
npx @zweer/dev@latest cao install
# ... other agents as needed
```

**Usage:**

```bash
# Launch orchestrators
cao chat echoes_writer      # For chapter writing
cao chat echoes_web_dev     # For web development
```

### Amazon Q CLI Agents

Each repository should include a specialized agent configuration:

```json
{
  "$schema": "https://raw.githubusercontent.com/aws/amazon-q-developer-cli/refs/heads/main/schemas/agent-v1.json",
  "name": "default",
  "description": "Agent for [repository-name]",
  "prompt": "[Repository-specific prompt]",
  "tools": ["fs_read", "fs_write", "execute_bash"],
  "resources": ["file://README.md"]
}
```

### MCP Server Integration

Timeline repositories integrate with `@echoes-io/mcp-server` for content operations.

#### Initial Setup - IMPORTANT

**Before using RAG tools, the tracker database MUST be synchronized:**

1. **First time setup** or **after adding new chapters:**
   ```bash
   # Sync filesystem → tracker database
   timeline-sync --timeline <timeline-name> --contentPath ./content
   ```

2. **Then index for semantic search:**
   ```bash
   # Index tracker → RAG database  
   rag-index --timeline <timeline-name> --contentPath ./content
   ```

#### Available MCP Tools

**Content Operations:**
- `words-count` - Count words in chapter files
- `chapter-info` - Get chapter metadata and statistics
- `chapter-refresh` - Refresh chapter metadata from file
- `chapter-insert` - Insert new chapter with auto-renumbering
- `chapter-delete` - Remove chapter from tracker
- `episode-info` - Get episode metadata and chapters list
- `episode-update` - Update episode metadata

**Database Sync:**
- `timeline-sync` - Sync filesystem → tracker (REQUIRED FIRST!)

**Semantic Search (RAG):**
- `rag-index` - Index chapters for search (requires sync first!)
- `rag-search` - Search by semantic similarity (supports `characters`, `allCharacters` filters)
- `rag-context` - Get relevant context for AI (supports `characters`, `allCharacters` filters)
- `rag-characters` - Discover character interactions (NEW in v1.2.0)

**Character-Based Filtering (NEW in v1.2.0):**
- Automatic character extraction via NER during indexing
- Filter searches by character names: `characters: ["Name1", "Name2"]`
- Use `allCharacters: true` to find chapters where ALL characters appear together (AND)
- Use `allCharacters: false` (default) to find chapters with AT LEAST ONE character (OR)
- Example: Find chapters where both Alice AND Bob appear: `rag-search --query "romantic moment" --characters ["Alice", "Bob"] --allCharacters true`

**Statistics:**
- `stats` - Get aggregate statistics with filters

**Book Generation:**
- `book-generate` - Compile LaTeX book

#### Troubleshooting

**RAG indexing returns 0 chapters?**
- Run `timeline-sync` first to populate the tracker database
- The tracker must contain chapters before RAG can index them

**Chapter not found in database?**
- Run `timeline-sync` to sync filesystem changes
- Or use `chapter-refresh` for a single chapter

## 📖 Documentation Guides

- **`WRITING_WORKFLOW.md`** - Step-by-step guide for writing chapters
- **`profile/README.md`** - Organization overview and project structure

## 🔧 Maintenance

### Updating Templates

When updating templates, ensure changes are propagated to existing repositories:

1. Update templates in this repository
2. Create migration guide for existing repositories
3. Update documentation to reflect changes
4. Notify team of template updates

### Shared Workflow Updates

Changes to shared workflows affect all repositories using them. Test thoroughly before merging.

---

**For project overview and architecture, see the [organization profile](profile/README.md)** ✨
