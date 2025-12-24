# Expand Chapter

Expand chapter {CHAPTER} from arc "{ARC}" to reach {TARGET} words.

## Workflow

### Phase 1: Load and Analyze

1. **Load Current Chapter**
   - Find the chapter file: `content/{ARC}/ep[NUM]-*/ep[NUM]-ch{CHAPTER}-*.md`
   - Read current content
   - Run `words-count` tool to get current word count
   - Calculate words needed: {TARGET} - current

2. **Analyze Expansion Opportunities**
   - Identify scenes that feel rushed
   - Find moments for deeper emotional exploration
   - Look for sensory details to enhance
   - Consider internal monologue opportunities
   - Check for relationship dynamics to develop

### Phase 2: Conversational Planning

3. **Ask User for Expansion Focus**
   Say to the user:
   
   > "I've loaded chapter {CHAPTER} from arc '{ARC}'.
   > Current word count: [X]
   > Target: {TARGET} words
   > Need to add: [Y] words
   > 
   > Where should I focus the expansion? Tell me about:
   > - Specific scenes to deepen
   > - Emotional moments to explore more
   > - Sensory details to add
   > - Character thoughts/feelings to develop
   > - Relationship dynamics to enhance
   > 
   > Or say 'analyze it' and I'll suggest the best expansion opportunities."

4. **Discuss and Refine**
   - Listen to user's expansion preferences
   - If user says "analyze it", propose specific expansion points based on your analysis
   - Present your expansion plan:
     - Which scenes will be expanded and how
     - What new content will be added
     - How it enhances the narrative
     - Estimated word count per expansion
   - Ask: "Does this expansion plan work? Any changes?"
   - Iterate until user is satisfied

5. **Get Final Confirmation**
   - Summarize the agreed expansion plan
   - Ask: "Ready to expand? Say 'yes' to proceed."
   - Wait for explicit confirmation before expanding

### Phase 3: Expansion

6. **Expand Content**
   - Follow the agreed expansion plan
   - Add depth, not filler
   - Maintain pacing and tone
   - Keep POV consistent
   - Enhance existing scenes rather than adding new ones (unless agreed)
   - Use timeline's narrative style (check your agent prompt)

7. **Verify Target**
   - Run `words-count` tool
   - Ensure target {TARGET} words reached
   - Adjust if needed

### Phase 4: Save

8. **Save Expanded Chapter**
   - Overwrite existing file
   - Run `words-count` tool to confirm final count
   - Tell user: "Chapter expanded to [X] words!"

## Validation Checklist

- [ ] User confirmed the expansion plan before starting
- [ ] Target word count {TARGET} reached
- [ ] Expansion adds depth, not filler
- [ ] POV and tone consistent with original
- [ ] Pacing remains appropriate
- [ ] Continuity maintained

## Important Notes

- **ALWAYS get user confirmation before expanding** - never skip the planning phase
- Quality over quantity - expansion should enhance, not dilute
- Stay true to the chapter's original purpose and themes
- Use `words-count` tool to verify word counts
- The expansion conversation is collaborative - iterate until user is happy
