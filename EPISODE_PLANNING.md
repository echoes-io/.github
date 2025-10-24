# Episode Planning Workflow for Echoes Timeline Repositories

This guide outlines the complete workflow for planning new episodes in Echoes timeline repositories, from initial concept to structured chapter outlines.

## 🎬 Overview

Episode planning is the creative phase before writing chapters. It involves character development, plot structuring, location planning, and creating detailed outlines that guide the actual writing process.

## 📁 Documentation Structure

Each timeline repository includes a `docs/` directory for planning and reference materials:

```
timeline-anima/
├── content/           # Published chapters
├── docs/             # Planning and documentation
│   ├── characters/   # Character sheets and development
│   ├── episodes/     # Episode outlines and planning
│   ├── locations/    # Location database and descriptions
│   └── timeline.md   # Overall timeline narrative arc
```

### Detailed Structure
```
docs/
├── characters/
│   ├── nic.md           # Main protagonist
│   ├── marie.md         # Recurring character
│   ├── sarah.md         # Episode-specific character
│   └── giogio.md        # Supporting character
├── episodes/
│   ├── ep01-new-life.md      # Completed episode outline
│   ├── ep02-london-growth.md # Current planning
│   └── ep03-challenges.md    # Future episode ideas
├── locations/
│   ├── london-apartment.md   # Recurring location
│   ├── canary-wharf.md      # Work setting
│   └── shoreditch-pub.md    # Social setting
└── timeline.md              # Overall narrative arc
```

## 🚀 Planning Workflow

### 1. Episode Initialization
```bash
q chat "I want to plan ep02-london-growth for anima timeline"
```

**Expected Actions:**
- Create `docs/episodes/ep02-london-growth.md` with template
- List existing characters from `docs/characters/`
- Suggest relevant locations from `docs/locations/`

**MCP Tools (To Be Implemented):**
- `episode-init` - Initialize episode planning structure
- `character-list` - Show available characters
- `location-list` - Show available locations

### 2. Character Development
```bash
q chat "Help me develop Sarah for ep02"
q chat "Create a new character sheet for Sarah"
```

**Expected Actions:**
- Create or update `docs/characters/sarah.md`
- Search existing content for character references
- Suggest character relationships and development arcs

**MCP Tools (To Be Implemented):**
- `character-create` - Create new character file
- `character-update` - Update existing character
- `character-search` - Find character references in content

### 3. Episode Structuring
```bash
q chat "Structure 15 chapters for ep02 based on the outline"
q chat "What themes should I explore in ep02?"
```

**Expected Actions:**
- Update episode outline with chapter structure
- Suggest thematic elements based on timeline
- Create chapter progression framework

**MCP Tools (To Be Implemented):**
- `episode-outline` - Update episode planning document
- `theme-suggest` - Suggest themes based on timeline
- `chapters-structure` - Create chapter framework

### 4. Research & Consistency
```bash
q chat "Find all references to Marie in previous episodes"
q chat "What locations have been used in anima timeline?"
```

**Expected Actions:**
- Search content for character mentions
- List location usage across episodes
- Check narrative consistency

**MCP Tools (Existing + Future):**
- `semantic-search` - Search existing content (RAG integration)
- `character-timeline` - Character appearance chronology
- `location-usage` - Location reference tracking

## 📝 Template Files

### Character Sheet Template
```markdown
# Character: [Name]

## Basic Info
- **Full Name**: [Full character name]
- **Age**: [Age]
- **Role**: [Protagonist/Supporting/Antagonist]
- **First Appearance**: [Episode and chapter]

## Personality
- **Core Traits**: [Key personality characteristics]
- **Motivations**: [What drives the character]
- **Conflicts**: [Internal and external conflicts]
- **Growth Arc**: [How character develops]

## Relationships
- **[Character Name]**: [Relationship description]
- **[Character Name]**: [Relationship description]

## Physical Description
- **Appearance**: [Physical characteristics]
- **Style**: [Clothing preferences, mannerisms]
- **Distinctive Features**: [Memorable characteristics]

## Background
- **History**: [Relevant backstory]
- **Occupation**: [Job/role in story world]
- **Living Situation**: [Where and how they live]

## Episode Notes
### [Episode Name]
- [Character development in this episode]
- [Key scenes and interactions]
- [Plot relevance and function]

## Future Development
- [Planned character growth]
- [Potential storylines]
- [Relationship evolution]
```

### Episode Outline Template
```markdown
# Episode: [Episode Name]

## Overview
- **Timeline**: [Timeline name]
- **Arc**: [Story arc]
- **Theme**: [Central theme or message]
- **Setting**: [Primary time and place]
- **Tone**: [Emotional tone and atmosphere]

## Characters
### Main Characters
- **[Character]**: [Role and development in episode]
- **[Character]**: [Role and development in episode]

### Supporting Characters
- **[Character]**: [Function in episode]
- **[Character]**: [Function in episode]

### New Characters
- **[Character]**: [Introduction and purpose]

## Plot Structure
### Act 1: Setup (Chapters 1-5)
- **ch001**: [Chapter summary and purpose]
- **ch002**: [Chapter summary and purpose]
- **ch003**: [Chapter summary and purpose]
- **ch004**: [Chapter summary and purpose]
- **ch005**: [Chapter summary and purpose]

### Act 2: Development (Chapters 6-10)
- **ch006**: [Chapter summary and purpose]
- **ch007**: [Chapter summary and purpose]
- **ch008**: [Chapter summary and purpose]
- **ch009**: [Chapter summary and purpose]
- **ch010**: [Chapter summary and purpose]

### Act 3: Resolution (Chapters 11-15)
- **ch011**: [Chapter summary and purpose]
- **ch012**: [Chapter summary and purpose]
- **ch013**: [Chapter summary and purpose]
- **ch014**: [Chapter summary and purpose]
- **ch015**: [Chapter summary and purpose]

## Themes & Motifs
- **Primary Theme**: [Main thematic element]
- **Secondary Themes**: [Supporting themes]
- **Recurring Motifs**: [Symbolic elements]
- **Character Growth**: [How themes manifest in character development]

## Locations
### Primary Locations
- **[Location]**: [Usage and significance]
- **[Location]**: [Usage and significance]

### Secondary Locations
- **[Location]**: [Brief appearances]
- **[Location]**: [Brief appearances]

### New Locations
- **[Location]**: [Introduction and purpose]

## Continuity Notes
- **From Previous Episodes**: [References and connections]
- **Setup for Future**: [Elements that will pay off later]
- **Character Arcs**: [Ongoing development threads]

## Writing Notes
- [Creative ideas and inspiration]
- [Specific scenes to highlight]
- [Dialogue or interaction notes]
- [Pacing considerations]

## Research Needed
- [Topics to research]
- [Details to verify]
- [Consistency checks required]
```

### Location Template
```markdown
# Location: [Location Name]

## Basic Information
- **Type**: [Home/Office/Public/etc.]
- **Address**: [Specific location if relevant]
- **First Appearance**: [Episode and chapter]

## Description
- **Physical**: [Layout, appearance, atmosphere]
- **Atmosphere**: [Mood, feeling, ambiance]
- **Significance**: [Why this location matters]

## Usage History
### [Episode Name]
- [How location was used]
- [Scenes that took place here]
- [Character interactions]

## Character Connections
- **[Character]**: [Relationship to location]
- **[Character]**: [Relationship to location]

## Symbolic Meaning
- [What this location represents]
- [Thematic significance]
- [Emotional associations]

## Future Potential
- [Planned future scenes]
- [Development possibilities]
- [Story potential]
```

## 🛠️ Required MCP Tools

### Episode Planning Tools (To Be Implemented)
- `episode-init` - Initialize new episode planning structure
- `episode-outline` - Create/update episode outline
- `chapters-structure` - Generate chapter framework from outline
- `theme-suggest` - Suggest themes based on timeline and content

### Character Management Tools (To Be Implemented)
- `character-create` - Create new character sheet
- `character-update` - Update existing character information
- `character-list` - List all characters in timeline
- `character-search` - Find character references in content
- `character-timeline` - Show character appearance chronology

### Location Management Tools (To Be Implemented)
- `location-create` - Create new location entry
- `location-update` - Update location information
- `location-list` - List all locations in timeline
- `location-usage` - Show location usage across episodes

### Research Tools (Future RAG Integration)
- `semantic-search` - Search content for themes, characters, locations
- `consistency-check` - Verify narrative consistency
- `reference-find` - Find all references to specific elements

## 🔄 Integration with Writing Workflow

### From Planning to Writing
1. **Complete Episode Outline** - Finish `docs/episodes/[episode].md`
2. **Generate Chapter Structure** - Create empty chapter files with frontmatter
3. **Begin Writing** - Use chapter-by-chapter writing workflow
4. **Reference Planning** - Consult character sheets and location notes during writing

### Maintaining Documentation
- Update character sheets as characters develop
- Add new locations as they're introduced
- Revise episode outlines based on writing discoveries
- Keep timeline.md updated with overall narrative progress

## 💡 Best Practices

### Planning Phase
- Start with broad themes and narrow down to specific scenes
- Develop characters before plotting their actions
- Consider location significance beyond just setting
- Plan character arcs across multiple episodes

### Documentation
- Keep character sheets updated as writing progresses
- Use consistent formatting across all planning documents
- Reference existing content to maintain continuity
- Plan ahead but remain flexible for creative discoveries

### Collaboration
- Use clear, descriptive file names
- Include context in planning documents
- Cross-reference between characters, locations, and episodes
- Maintain version control for planning documents

---

**Plan thoroughly, write freely, publish confidently!** ✨
