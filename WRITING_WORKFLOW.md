# Writing Workflow for Echoes Timeline Repositories

This guide outlines the complete workflow for writing chapters in Echoes timeline repositories, from initial setup to content publishing.

## 🚀 Initial Setup (One-time)

### Repository Setup
```bash
# Clone your timeline repository
git clone https://github.com/echoes-io/timeline-anima.git
cd timeline-anima

# Activate Amazon Q with timeline-specific agent
q chat  # Loads timeline agent with @echoes-io/mcp-server integration
```

### Prerequisites
- Amazon Q CLI installed and configured
- Access to timeline repository
- MCP server integration active

## ✍️ Writing New Chapters

### Option A: AI-Assisted Creation (Recommended)
```bash
q chat "I want to write a new chapter for the anima arc, episode 1, from Nic's POV"
```

**MCP Tools Used:**
- `episode-info` - Gets episode metadata and existing chapters
- `chapter-insert` - Creates new chapter with proper frontmatter

The agent will:
- Suggest the next chapter number
- Create file with correct naming convention
- Generate pre-filled frontmatter template
- Open editor for content writing

### Option B: Manual Creation
```bash
# Navigate to episode directory
cd content/anima/ep01-new-life/

# Create file following naming convention
touch ep01-ch051-nic-new-chapter-title.md
```

## 📝 Chapter Structure

### Frontmatter Template
```yaml
---
pov: nic
title: "Chapter Title"
date: "2024-10-24"
timeline: anima
arc: anima
episode: 1
part: 1
chapter: 51
summary: "Brief chapter description"
location: "London, apartment"
---

# Chapter Title

Chapter content goes here...
```

### Naming Convention
- **Format**: `ep{episode}-ch{chapter}-{pov}-{title-slug}.md`
- **Episode**: 2-digit padding (ep01, ep02, ep12)
- **Chapter**: 3-digit padding (ch001, ch051, ch123)
- **POV**: Character name (nic, ale, gio, angi, vi)
- **Title**: Slugified chapter title (lowercase, hyphens)

## 🛠️ Writing Tools & Commands

### Real-time Word Counting
```bash
q chat "Count words in the current chapter"
```
**MCP Tool:** `words-count` - Counts words in specific file

### Episode Overview
```bash
q chat "Show me episode 1 overview"
```
**MCP Tool:** `episode-info` - Episode metadata and chapter list

### Timeline Statistics
```bash
q chat "Show anima timeline statistics"
```
**MCP Tool:** `stats` - Complete timeline/arc/episode statistics

### Content Validation
```bash
q chat "Validate and refresh this chapter's frontmatter"
```
**MCP Tool:** `chapter-refresh` - Updates chapter metadata

## 🔍 Content Discovery

Use Amazon Q's built-in search capabilities to find related content across your timeline.

## 📊 Chapter Management

### Chapter Information
```bash
q chat "Show info for chapter 45"
```
**MCP Tool:** `chapter-info` - Chapter metadata and statistics

### Chapter Deletion
```bash
q chat "Delete chapter 42 from episode 1"
```
**MCP Tool:** `chapter-delete` - Removes chapter from filesystem and tracker

### Episode Updates
```bash
q chat "Update episode 1 metadata"
```
**MCP Tool:** `episode-update` - Updates episode metadata

## 🔄 Database Synchronization

### Manual Sync
```bash
q chat "Sync all chapters with the database"
```
**MCP Tool:** `timeline-sync` - Complete timeline sync with tracker database

### Automatic Sync
Database synchronization happens automatically via:
- **Git hooks** (husky) on commit
- **GitHub Actions** on push to main branch

## 📚 Book Generation

### Generate Books
```bash
# Generate PDF for complete arc
q chat "Generate a PDF book for the anima arc"

# Generate specific episode
q chat "Generate PDF for episode 1 of anima timeline"
```

**MCP Tool:**
- `book-generate` - LaTeX compilation via @echoes-io/books-generator

## 🚀 Publishing Workflow

### Commit and Push
```bash
# Add new chapter
git add content/anima/ep01-new-life/ep01-ch051-nic-new-chapter.md

# Commit with conventional format
git commit -m "feat(anima): add ch051 - New Chapter Title"

# Push to trigger automation
git push origin main
```

### Automated Processing
On push to main branch, **GitHub Actions** automatically:
- Validates frontmatter structure
- Updates tracker database (via husky hooks)
- Processes content metadata
- Triggers web app updates
- Generates book previews (when available)

### Git Hooks (Husky)
Pre-commit hooks automatically:
- Validate chapter frontmatter
- Update word counts
- Sync with tracker database
- Run content validation

## 🎯 Available MCP Tools

### ✅ Currently Available (9 tools)
- `words-count` - Word counting for files
- `chapter-info` - Chapter metadata and statistics
- `chapter-insert` - Create new chapter with frontmatter
- `chapter-refresh` - Update chapter metadata
- `chapter-delete` - Remove chapter from filesystem and tracker
- `episode-info` - Episode metadata and chapter list
- `episode-update` - Update episode metadata
- `stats` - Timeline/arc/episode statistics
- `timeline-sync` - Database synchronization
- `book-generate` - LaTeX book compilation

## 💡 Best Practices

### Content Organization
- Follow consistent naming conventions
- Use descriptive chapter titles
- Fill all required frontmatter fields
- Keep summaries concise but informative

### Writing Workflow
- Use AI assistance for metadata management
- Leverage real-time word counting
- Validate content before committing
- Sync database regularly

### Version Control
- Commit frequently with descriptive messages
- Use conventional commit format
- Let automation handle publishing
- Review changes before pushing

## 🆘 Troubleshooting

### Common Issues
- **Invalid frontmatter**: Use `chapter-refresh` to fix
- **Missing chapters**: Check `episode-info` for gaps
- **Database sync issues**: Run `timeline-sync` manually
- **Word count discrepancies**: Use `words-count` to verify

### Getting Help
```bash
# Ask the timeline agent for assistance
q chat "Help me with [specific issue]"

# Check episode structure
q chat "Show me the current episode structure"

# Validate timeline consistency
q chat "Check timeline consistency"
```

---

**Focus on writing great stories - let the tools handle the rest!** ✨
