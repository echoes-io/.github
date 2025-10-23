# Echoes.io Organization Configuration

This repository contains shared configurations and resources for the [echoes.io](https://github.com/echoes-io) organization.

## Contents

- **`profile/README.md`** - Organization profile (visible on https://github.com/echoes-io)
- **`.amazonq/cli-agents/default.json`** - Main orchestrator agent for project-wide tasks
- **`.github/workflows/publish-content.yml`** - Shared workflow for timeline content publishing
- **`template/`** - Repository template with standard configurations

## Repository Template

The `template/` directory contains standardized configurations for new echoes.io repositories:

### Usage

```bash
# Copy template to new repository
cp -r template/* /path/to/new-repo/
cd /path/to/new-repo

# Customize placeholders
sed -i 's/PACKAGE_NAME/your-package-name/g' package.json README.md
sed -i 's/PACKAGE_DESCRIPTION/Your package description/g' package.json README.md

# Initialize
npm install
git init
git add .
git commit -m "feat: initial repository setup"
```

### Included Files

- **`.github/workflows/release.yml`** - Automated testing, building, and NPM publishing
- **`.editorconfig`** - Editor configuration for consistent formatting
- **`.gitignore`** - Standard Node.js/TypeScript exclusions
- **`.lintstagedrc`** - Pre-commit hooks for quality checks
- **`biome.json`** - Linting and formatting configuration
- **`LICENSE`** - MIT license
- **`package.json`** - NPM package configuration with placeholders
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

---

**Echoes** - Multi-POV storytelling platform
