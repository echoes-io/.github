# Write New Chapter

Write chapter {CHAPTER} for arc "{ARC}" in timeline {TIMELINE}.

## Workflow

### Phase 1: Conversational Planning

1. **Gather Context First**
   - Use `rag-context` tool with query: "arc {ARC} recent chapters and character development"
   - Check `docs/episodes/` for episode structure and themes
   - Review previous chapters in arc for continuity

2. **Ask User for Chapter Idea**
   Say to the user:
   
   > "Perfect! Let's plan chapter {CHAPTER} for arc '{ARC}'.
   > 
   > Tell me what should happen in this chapter:
   > - Key events or scenes
   > - Character moments or development
   > - Emotional beats or themes
   > 
   > Or say 'propose something' and I'll suggest based on the context I gathered."

3. **Discuss and Refine**
   - Listen to user's idea
   - If user says "propose something", create outline based on context
   - Present your proposed outline:
     - Scene breakdown (3-5 scenes)
     - Key narrative moments
     - POV character (determined from episode/arc pattern)
     - Location(s)
     - Emotional arc
     - Continuity points with previous chapters
   - Ask: "What do you think? Any changes?"
   - Iterate until user is satisfied

4. **Get Final Confirmation**
   - Show final outline summary
   - Ask: "Ready to write? Say 'yes' to proceed."
   - Wait for explicit confirmation before writing

### Phase 2: Writing

5. **Write Chapter**
   - Follow the agreed outline
   - Maintain consistent POV throughout (no head-hopping)
   - Follow timeline's narrative tone (already in your agent prompt)
   - Include sensory details and emotional depth
   - Ensure continuity with previous chapters

6. **Generate Frontmatter**
   Create complete YAML frontmatter:
   ```yaml
   ---
   pov: [character name from outline]
   title: [chapter title]
   date: [YYYY-MM-DD]
   timeline: {TIMELINE}
   arc: {ARC}
   episode: [episode number]
   chapter: {CHAPTER}
   excerpt: [2-3 sentence description]
   location: [scene location from outline]
   outfit: [optional - character outfit description]
   kink: [optional - content tags if relevant]
   ---
   ```

### Phase 3: Save and Sync

7. **Save Chapter**
   - Determine file path: `content/{ARC}/ep[NUM]-[slug]/ep[NUM]-ch{CHAPTER}-[pov]-[slug].md`
   - Save chapter with frontmatter
   - Show user the file path where it was saved

8. **Sync Database**
   - Run `words-count` tool (NOT bash `wc` command)
   - Run `chapter-refresh` tool to sync tracker database
   - Confirm to user: "Chapter saved and database synced!"

## Validation Checklist

Before completing, verify:
- [ ] User confirmed the outline before writing
- [ ] Frontmatter is complete and valid YAML
- [ ] Word count matches timeline target (check your agent prompt)
- [ ] POV is consistent throughout chapter
- [ ] Outline was followed accurately
- [ ] File saved to correct path with proper naming
- [ ] Database synced with `chapter-refresh` tool

## Important Notes

- **ALWAYS get user confirmation before writing** - never skip the planning phase
- Use MCP tools (`words-count`, `chapter-refresh`, `rag-context`) NOT bash commands
- Check your agent prompt for timeline-specific tone and word count
- Consult `docs/characters/`, `docs/episodes/`, `docs/locations/` for reference
- Maintain narrative consistency across the arc
- The planning conversation is collaborative - iterate until user is happy
