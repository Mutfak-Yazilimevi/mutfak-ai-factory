SPRINT REPORT FORMAT

This format is used by the Docs Agent to generate sprint summary reports.

**CRITICAL:** This report is read by Product Agent when planning the next sprint. The "Known Issues", "Technical Debt", and "Next Sprint Suggestions" sections are automatically extracted and added to the next sprint's product.md and backlog.md.

Location: `/runs/<SPRINT_ID>/sprint_report.md`

**When Created:**
- After all documentation files are created
- After QA STATUS: PASSED
- After all execution tasks are DONE
- This is the LAST step before sprint completion

**Created By:** Docs Agent

**Read By:** Product Agent (for next sprint planning)

---

Structure:

# Sprint Report: <SPRINT_ID>

## Sprint Goal
<One sentence summary from sprint.md - read from /runs/<SPRINT_ID>/sprint.md>

## Delivered Features
- List of completed features (from DONE tasks)
- Reference to task IDs
- For each feature, list which tasks delivered it
- Group by feature area if applicable

## Known Issues
**CRITICAL:** This section is read by Product Agent for next sprint planning.

- Unresolved problems from QA report (if any)
- Blocked tasks (if any - list task IDs)
- Issues identified during development but not fixed
- Workarounds implemented (if any)
- Bugs or problems that need attention in next sprint

**Format:**
- Be specific and actionable
- List actual issues, not generic statements
- Reference task IDs where applicable
- Include workarounds or temporary solutions if any

## Technical Debt
**CRITICAL:** This section is read by Product Agent for next sprint planning.

- Deferred work (tasks that were planned but not implemented)
- Compromises made (shortcuts taken, technical decisions that need revisiting)
- TODO tasks that were deferred to future sprints
- Code quality issues that were noted but not addressed
- Refactoring needs identified during development

**Format:**
- Be specific about what was deferred and why
- List technical compromises that need to be addressed
- Reference original task IDs if applicable

## Risks
- Ongoing risks identified during sprint
- Dependencies on future work
- Technical risks that may impact future sprints
- External dependencies or blockers
- Architecture or design concerns

## Next Sprint Suggestions
**CRITICAL:** This section is read by Product Agent for next sprint planning.

- Recommended priorities for next sprint
- Suggested focus areas based on this sprint's outcomes
- Features or improvements that should be considered
- Technical improvements that would benefit the project
- Areas that need more attention

**Format:**
- Be specific and actionable
- Prioritize suggestions (HIGH/MEDIUM/LOW if possible)
- Explain why these suggestions are important

## Metrics
- Tasks completed: X/Y (count DONE tasks vs total tasks)
- QA status: PASSED/FAILED (from qa.md)
- Documentation status: COMPLETE/INCOMPLETE
- Sprint duration: <if available>
- Blocked tasks count: X (if any)
- Deferred tasks count: X (if any)