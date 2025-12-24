# Create New Episode

Create episode outline for episode {EPISODE} in arc "{ARC}".

## Workflow

### Phase 1: Research

1. **Check Arc Context**
   - Review `docs/episodes/` for existing episodes in arc
   - Check previous episode to ensure continuity
   - Use `search-semantic` to find recent narrative developments in arc {ARC}
   - Review `docs/timeline-steering.md` for arc overview

### Phase 2: Conversational Planning

2. **Ask User for Episode Concept**
   Say to the user:
   
   > "Let's create episode {EPISODE} for arc '{ARC}'.
   > 
   > Tell me about this episode:
   > - What's the main story/event?
   > - What themes should it explore?
   > - Which characters are involved?
   > - How does it fit in the arc progression?
   > - Rough idea of chapter breakdown?
   > 
   > Or say 'analyze arc' and I'll propose something based on the arc's progression."

3. **Discuss and Refine**
   - Listen to user's episode concept
   - If user says "analyze arc", propose episode based on arc context
   - Create episode outline draft with:
     - Overview (2-3 sentence summary)
     - Themes
     - Characters (POV and supporting)
     - 3-Act structure with chapter breakdown
     - Locations
     - Continuity notes
   - Show draft to user
   - Ask: "Does this episode structure work? Any changes?"
   - Iterate until user is satisfied

4. **Get Final Confirmation**
   - Show final episode outline
   - Ask: "Ready to save? Say 'yes' to proceed."
   - Wait for explicit confirmation before saving

### Phase 3: Save

5. **Save Episode Outline**
   - Save to: `docs/episodes/ep{EPISODE}-[slug].md`
   - Use 2-digit padding for episode number
   - Confirm to user: "Episode {EPISODE} outline saved!"

## Episode Outline Template

```markdown
# Episode {EPISODE}: [Title]

**Arc**: {ARC}  
**Timeline**: {TIMELINE}

## Overview
[2-3 sentence summary of the episode]

## Themes
- [Theme 1]
- [Theme 2]
- [Theme 3]

## Characters
- **POV**: [main POV character]
- **Supporting**: [other characters involved]

## Structure

### Act 1: Setup
- Chapter X: [brief description]
- Chapter Y: [brief description]

### Act 2: Development
- Chapter Z: [brief description]
- Chapter W: [brief description]

### Act 3: Resolution
- Chapter V: [brief description]

## Locations
- [Location 1]: [how it's used in episode]
- [Location 2]: [how it's used in episode]

## Continuity Notes
- [Important continuity points with previous episodes]
- [Setup for future episodes]
```

## Validation Checklist

- [ ] User confirmed episode outline before saving
- [ ] Episode number doesn't conflict with existing
- [ ] Themes align with arc and timeline
- [ ] Character development is logical
- [ ] Structure has clear 3-act progression
- [ ] Continuity with previous episodes maintained
- [ ] File saved with correct naming

## Important Notes

- **ALWAYS get user confirmation before saving** - never skip the planning phase
- Episode outlines guide chapter writing
- Update as episodes develop during writing
- Consult arc overview in `docs/timeline-steering.md`
- Use `search-semantic` to find relevant context from existing chapters
- The episode planning is collaborative - iterate until user is happy
