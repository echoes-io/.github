# Create New Character

Create character sheet for "{NAME}" in timeline {TIMELINE}.

## Workflow

### Phase 1: Research

1. **Check Existing Characters**
   - Review `docs/characters/` directory
   - Ensure character doesn't already exist
   - Check for similar names to avoid confusion

2. **Gather Context**
   - Use `rag-search` to find mentions of {NAME} in existing chapters
   - Identify relationships with existing characters
   - Note timeline and arc context

### Phase 2: Conversational Planning

3. **Ask User for Character Details**
   Say to the user:
   
   > "Let's create the character sheet for '{NAME}' in timeline {TIMELINE}.
   > 
   > Tell me about {NAME}:
   > - Who are they? (age, appearance, personality)
   > - What role do they play in the story?
   > - Relationships with other characters?
   > - Current emotional state or situation?
   > - Any specific traits or quirks?
   > 
   > Or say 'search chapters' and I'll gather info from existing mentions."

4. **Discuss and Refine**
   - Listen to user's character description
   - If user says "search chapters", present findings from RAG search
   - Create character sheet draft with:
     - Basic information (name, age, appearance, personality)
     - Current state (emotional, relationships, arc)
     - Character evolution notes (if applicable)
   - Show draft to user
   - Ask: "Does this capture {NAME} well? Any additions or changes?"
   - Iterate until user is satisfied

5. **Get Final Confirmation**
   - Show final character sheet
   - Ask: "Ready to save? Say 'yes' to proceed."
   - Wait for explicit confirmation before saving

### Phase 3: Save

6. **Save Character Sheet**
   - Save to: `docs/characters/{NAME}.md`
   - Use lowercase, hyphenated filename if multi-word name
   - Confirm to user: "Character sheet saved for {NAME}!"

## Character Sheet Template

```markdown
# {NAME}

## Basic Information
- **Full Name**: [full name]
- **Age**: [age]
- **Appearance**: [physical description]
- **Personality**: [personality traits]

## Current State (as of latest chapter)
- **Emotional state**: [current emotional state]
- **Key relationships**: [relationships with other characters]
- **Current arc**: [which arc they're in]

## Character Evolution

### [Arc Name]
- Episode X: [development notes]
- Episode Y: [development notes]

## Notes
- [Any additional notes, quirks, important details]
```

## Validation Checklist

- [ ] User confirmed character details before saving
- [ ] Character doesn't duplicate existing character
- [ ] Basic information complete
- [ ] Relationships with existing characters noted
- [ ] File saved to correct location
- [ ] Consistent with timeline tone and themes

## Important Notes

- **ALWAYS get user confirmation before saving** - never skip the planning phase
- Consult existing chapters for character consistency
- Link to related characters in relationships section
- Update as character develops across episodes
- The character creation is collaborative - iterate until user is happy
