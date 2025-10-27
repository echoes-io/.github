# Echoes.io Organization Configuration

This repository contains shared configurations and resources for the [echoes.io](https://github.com/echoes-io) organization.

## 📁 Repository Contents

- **`profile/README.md`** - Organization profile (visible on https://github.com/echoes-io)
- **`.amazonq/cli-agents/default.json`** - Main orchestrator agent for project-wide tasks
- **`.github/workflows/publish-content.yml`** - Shared workflow for timeline content publishing
- **`template/`** - Templates for repositories and planning documentation
- **`WRITING_WORKFLOW.md`** - Complete guide for writing timeline content
- **`EPISODE_PLANNING.md`** - Complete guide for planning new episodes

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

Timeline repositories integrate with `@echoes-io/mcp-server` for content operations:
- Chapter creation and management
- Word counting and statistics
- Database synchronization
- Book generation

## 📖 Documentation Guides

- **`WRITING_WORKFLOW.md`** - Step-by-step guide for writing chapters
- **`EPISODE_PLANNING.md`** - Complete episode planning workflow
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
