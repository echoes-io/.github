# Revise Arc

Review and fix arc "{ARC}" in timeline {TIMELINE}.

## Context

This prompt helps systematically review an entire arc for:
1. **Missing or incomplete documentation**
2. **Chapters below target word count**
3. **Narrative quality issues**

## Workflow

### 1. Documentation Setup

**Check docs structure:**
```
docs/characters/{ARC}/     <- Character sheets for this arc
docs/episodes/             <- Episode outlines
```

**If docs/characters/{ARC}/ is missing:**
- Create folder: `docs/characters/{ARC}/`
- Create character sheets for main characters in this arc
- Include: appearance, personality, relationships, current state

**If episode outline is missing:**
- Create `docs/episodes/{ARC}-ep{XX}-{title}.md`
- Include: concept, narrative structure, themes, locations, POV dynamics

### 2. Episode Analysis

**For each episode in arc {ARC}:**

**Check statistics:**
- Use `stats` tool with arc="{ARC}"
- Use `search-semantic` to find chapters in each episode

**Identify problematic chapters:**
- Word count below timeline target
- Missing narrative depth
- Continuity issues

### 3. Review Process

**For each problematic chapter:**

1. **Read the chapter completely**
2. **Analyze issues:**
   - Word count adequate? 
   - Character voice consistent?
   - Narrative adds value?
   - Continuity maintained?
3. **Create mini-summary** (3-4 bullet points)
4. **Update episode outline** with detailed summaries
5. **Propose solutions** if needed

### 4. Solutions for Short Chapters

**For chapters below target word count:**
- Add sensory details (all 5 senses)
- Enhance POV introspection
- Expand descriptions
- Increase emotional depth

### 5. Quality Enhancement

**Elements to verify/add:**
- **Character voice:** Distinct and consistent
- **Sensory details:** Sight, sound, smell, taste, touch
- **Emotional depth:** Internal thoughts and feelings
- **Scene grounding:** Clear setting and atmosphere

## Available MCP Tools

- `stats` - Episode/arc statistics
- `search-semantic` - Semantic chapter search
- `search-entities` - Find characters and locations
- `search-relations` - Explore character relationships
- `words-count` - Accurate word count for files

## Expected Output

### 1. Complete Documentation
- Character sheets in `docs/characters/{ARC}/`
- Episode outlines in `docs/episodes/`

### 2. Problem Analysis
- List of chapters below word count target
- List of chapters with quality issues
- Continuity problems identified

### 3. Action Plan
- Priority order for fixes
- Specific solutions for each problem
- Implementation timeline

## Important Notes

- **Always read chapters completely** before judging
- **Focus on narrative value**, not just word count
- **Use MCP tools** for statistics (not bash commands)
- **Update documentation** as you progress
- **Maintain timeline tone** throughout revisions
