# Create New Arc

Create new story arc "{NAME}" in timeline {TIMELINE}.

## Workflow

### Phase 1: Validation

1. **Validate Arc Name**
   - Check `docs/timeline-steering.md` for existing arcs
   - Ensure name is lowercase, no spaces (use hyphens if needed)
   - Verify name doesn't conflict with existing arcs
   - Use `stats` tool to see current arcs in the database

### Phase 2: Conversational Planning

2. **Ask User for Arc Concept**
   Say to the user:
   
   > "Let's create the new arc '{NAME}' for timeline {TIMELINE}.
   > 
   > Tell me about this arc:
   > - What's the main story/narrative?
   > - What themes will it explore?
   > - Who are the main characters?
   > - How many episodes do you envision?
   > - What are the narrative goals?
   > - How does it fit with the timeline's overall story?
   > 
   > Or say 'propose something' and I'll suggest based on the timeline's themes."

3. **Discuss and Refine**
   - Listen to user's arc concept
   - If user says "propose something", create arc concept based on timeline themes
   - Create arc overview draft with:
     - Status (Planning / In Progress / Complete)
     - Planned number of episodes
     - Overview (2-3 paragraph description)
     - Themes
     - Main characters and their roles
     - Narrative goals
   - Show draft to user
   - Ask: "Does this arc concept work? Any changes?"
   - Iterate until user is satisfied

4. **Get Final Confirmation**
   - Show final arc overview
   - Ask: "Ready to create the arc? Say 'yes' to proceed."
   - Wait for explicit confirmation before creating

### Phase 3: Create Arc

5. **Update Timeline Steering**
   Add arc section to `docs/timeline-steering.md`:
   
   ```markdown
   ## Arc: {NAME}
   
   **Status**: Planning  
   **Episodes**: [planned number]
   
   ### Overview
   [2-3 paragraph description of arc narrative]
   
   ### Themes
   - [Theme 1]
   - [Theme 2]
   - [Theme 3]
   
   ### Main Characters
   - [Character 1]: [role in arc]
   - [Character 2]: [role in arc]
   
   ### Narrative Goals
   - [Goal 1]
   - [Goal 2]
   - [Goal 3]
   ```

6. **Create Arc Directory**
   - Create: `content/{NAME}/`
   - Add `.gitkeep` if empty
   - Confirm to user: "Arc '{NAME}' created!"

7. **Suggest Next Steps**
   Say to user:
   
   > "Arc '{NAME}' is ready! Next steps:
   > - Use `@new-episode {NAME} 1` to create the first episode outline
   > - Create character sheets for new characters with `@new-character [name]`
   > - Start writing chapters when ready with `@new-chapter {NAME} 1`

## Validation Checklist

- [ ] User confirmed arc concept before creating
- [ ] Arc name is valid (lowercase, no spaces)
- [ ] Arc doesn't duplicate existing arc
- [ ] Overview added to timeline-steering.md
- [ ] Themes align with timeline
- [ ] Directory structure created
- [ ] Next steps communicated to user

## Important Notes

- **ALWAYS get user confirmation before creating** - never skip the planning phase
- Use `stats` tool to check existing arcs
- Arcs should have clear narrative purpose
- Consult timeline overview for thematic consistency
- Plan arc progression before writing chapters
- Update timeline-steering.md as arc develops
- The arc creation is collaborative - iterate until user is happy
