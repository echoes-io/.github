# Revise Chapter

Revise chapter {CHAPTER} from arc "{ARC}" in timeline {TIMELINE}.

## Workflow

### Phase 1: Load and Analyze

1. **Load Existing Chapter**
   - Find the chapter file: `content/{ARC}/ep[NUM]-*/ep[NUM]-ch{CHAPTER}-*.md`
   - Read current content and frontmatter
   - Run `words-count` tool to get current statistics

2. **Analyze Current State**
   - Identify chapter's current strengths
   - Note potential areas for improvement
   - Use `search-semantic` to check continuity with surrounding chapters

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

### Phase 4: Save and Verify

7. **Save Revised Chapter**
   - Overwrite existing file (same path)
   - Show user what was changed

8. **Verify Changes**
   - Run `words-count` tool on the revised file
   - Confirm to user: "Chapter revised! New word count: [X] words"

## Validation Checklist

- [ ] User confirmed the revision plan before starting
- [ ] Revision addresses all identified issues
- [ ] POV remains consistent (unless intentionally changed)
- [ ] Frontmatter updated if metadata changed
- [ ] Word count appropriate for timeline
- [ ] Continuity maintained with surrounding chapters

## Important Notes

- **ALWAYS get user confirmation before revising** - never skip the planning phase
- Read the chapter file directly from the filesystem
- Use `words-count` tool to check statistics
- Use `search-semantic` to find related chapters for context
- Preserve the chapter's core narrative unless major rewrite requested
- The revision conversation is collaborative - iterate until user is happy
