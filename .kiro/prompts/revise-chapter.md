# Revise Chapter

Revise chapter {CHAPTER} from arc "{ARC}" in timeline {TIMELINE}.

## Workflow

### Phase 1: Load and Analyze

1. **Load Existing Chapter**
   - Use `chapter-info` tool with arc="{ARC}" and chapter={CHAPTER}
   - Read current content and frontmatter
   - Note current word count and metadata

2. **Analyze Current State**
   - Identify chapter's current strengths
   - Note potential areas for improvement
   - Check continuity with surrounding chapters using `rag-context`

### Phase 2: Conversational Planning

3. **Ask User for Revision Goals**
   Say to the user:
   
   > "I've loaded chapter {CHAPTER} from arc '{ARC}' (current word count: [X]).
   > 
   > What needs revision? Tell me about:
   > - Specific scenes or moments to improve
   > - Pacing issues
   > - Character consistency problems
   > - Tone adjustments needed
   > - Continuity fixes
   > - Length changes (expand/reduce)
   > - Any other improvements
   > 
   > Or say 'analyze it' and I'll suggest improvements based on my analysis."

4. **Discuss and Refine**
   - Listen to user's revision goals
   - If user says "analyze it", propose specific improvements based on your analysis
   - Present your revision plan:
     - What will be changed and why
     - Which scenes will be rewritten/enhanced
     - What will be preserved
     - Expected impact on word count
   - Ask: "Does this revision plan work for you? Any adjustments?"
   - Iterate until user is satisfied

5. **Get Final Confirmation**
   - Summarize the agreed revision plan
   - Ask: "Ready to revise? Say 'yes' to proceed."
   - Wait for explicit confirmation before revising

### Phase 3: Revision

6. **Revise Content**
   - Follow the agreed revision plan
   - Maintain original POV unless explicitly changing
   - Address all identified issues
   - Preserve what works well
   - Keep frontmatter metadata (update if needed)

### Phase 4: Save and Sync

7. **Save Revised Chapter**
   - Overwrite existing file (same path)
   - Show user what was changed

8. **Sync Database**
   - Run `words-count` tool
   - Run `chapter-refresh` tool
   - Confirm to user: "Chapter revised and database synced!"

## Validation Checklist

- [ ] User confirmed the revision plan before starting
- [ ] Revision addresses all identified issues
- [ ] POV remains consistent (unless intentionally changed)
- [ ] Frontmatter updated if metadata changed
- [ ] Word count appropriate for timeline
- [ ] Continuity maintained with surrounding chapters
- [ ] Database synced

## Important Notes

- **ALWAYS get user confirmation before revising** - never skip the planning phase
- Ask user for specific revision goals before starting
- Preserve the chapter's core narrative unless major rewrite requested
- Use MCP tools for all operations
- The revision conversation is collaborative - iterate until user is happy
