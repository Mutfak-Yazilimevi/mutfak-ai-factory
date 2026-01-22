# Sprint Plan Template

This template guides Product Agent in creating `/runs/SPRINT_PLAN.md` file.

**Location:** `/runs/SPRINT_PLAN.md` (created by Product Agent during project initialization)

**Purpose:** Master plan for all sprints in the project. Tracks planning mode, sprint breakdown, and dependencies.

---

## Template Format

```markdown
# PROJECT SPRINT PLAN

PROJECT: <PROJECT_NAME>
PLANNING_DATE: <YYYY-MM-DD>
PLANNING_MODE: FULL_PROJECT | ITERATIVE
# FULL_PROJECT: All sprints planned upfront before development starts
# ITERATIVE: Sprints planned one-by-one as they complete

TOTAL_SPRINTS: <NUMBER>
# For FULL_PROJECT mode: Total number of planned sprints
# For ITERATIVE mode: Number of sprints planned so far (increases as new sprints are added)

CURRENT_SPRINT: <SPRINT_ID>
# Current active sprint (for ITERATIVE mode tracking)
# For FULL_PROJECT mode: Usually 001 (first sprint to execute)
# For ITERATIVE mode: The sprint currently being planned/executed

## SPRINT BREAKDOWN

### Sprint 001
- SPRINT_ID: 001
- GOAL: <Sprint goal - what business/user goal this sprint serves>
- FEATURES:
  - Feature 1: <Brief description>
  - Feature 2: <Brief description>
  - FEATURE-001: <Feature ID if from backlog>
- DEPENDENCIES: None (first sprint)
- ESTIMATED_DURATION: <days/weeks>
- STATUS: PLANNED | IN_PROGRESS | COMPLETE
# PLANNED: Sprint planned but not started
# IN_PROGRESS: Sprint currently being executed
# COMPLETE: Sprint finished (all tasks done, QA passed, docs complete)

### Sprint 002
- SPRINT_ID: 002
- GOAL: <Sprint goal>
- FEATURES:
  - Feature 3: <Brief description>
  - Feature 4: <Brief description>
  - FEATURE-002: <Feature ID if from backlog>
- DEPENDENCIES: Sprint 001 (requires API contract from Sprint 001)
- ESTIMATED_DURATION: <days/weeks>
- STATUS: PLANNED | IN_PROGRESS | COMPLETE

... (for all sprints in FULL_PROJECT mode, or as sprints are added in ITERATIVE mode)

## DEPENDENCY GRAPH

Visual representation of sprint dependencies:

```
Sprint 001 → Sprint 002 → Sprint 003
Sprint 001 → Sprint 004 (parallel to 002)
```

Or in text format:
- Sprint 001: Foundation (no dependencies)
- Sprint 002: Depends on Sprint 001
- Sprint 003: Depends on Sprint 002
- Sprint 004: Depends on Sprint 001 (can run parallel with Sprint 002)

## NOTES

<Any additional notes about planning decisions, assumptions, or important considerations>

## CHANGELOG

### <YYYY-MM-DD>
- Initial plan created
- PLANNING_MODE: <FULL_PROJECT/ITERATIVE>

### <YYYY-MM-DD>
- Sprint 002 added (ITERATIVE mode)
- Updated CURRENT_SPRINT: 002
```

---

## Usage Guidelines

### For FULL_PROJECT Mode:

1. **Initial Creation:**
   - Product Agent creates SPRINT_PLAN.md with all sprints planned upfront
   - All sprints listed in SPRINT_BREAKDOWN section
   - DEPENDENCY_GRAPH shows all relationships
   - TOTAL_SPRINTS: Total number of planned sprints
   - CURRENT_SPRINT: 001 (first sprint to execute)
   - All sprints have STATUS: PLANNED initially

2. **During Sprint Execution:**
   - When sprint starts: Update STATUS to IN_PROGRESS
   - When sprint completes: Update STATUS to COMPLETE
   - Update CURRENT_SPRINT to next sprint ID (if next sprint exists)
   - Update CHANGELOG with sprint completion date

3. **Sprint Completion:**
   - Docs Agent updates SPRINT_PLAN.md after creating sprint_report.md
   - Update completed sprint's STATUS to COMPLETE
   - Update CURRENT_SPRINT to next sprint (if exists)
   - Document in CHANGELOG

2. **During Development:**
   - Update STATUS for each sprint as it progresses
   - CURRENT_SPRINT: Track which sprint is currently active
   - CHANGELOG: Document any changes to plan

3. **Modifications:**
   - If scope changes, update affected sprints
   - Document changes in CHANGELOG
   - Update DEPENDENCY_GRAPH if dependencies change

### For ITERATIVE Mode:

1. **Initial Creation:**
   - Product Agent creates SPRINT_PLAN.md with only first sprint
   - SPRINT_BREAKDOWN: Only Sprint 001 initially
   - TOTAL_SPRINTS: 1
   - CURRENT_SPRINT: 001

2. **Adding New Sprints:**
   - When starting new sprint, Product Agent adds it to SPRINT_BREAKDOWN
   - Increment TOTAL_SPRINTS
   - Update CURRENT_SPRINT
   - Update DEPENDENCY_GRAPH
   - Document in CHANGELOG

3. **Tracking:**
   - Update STATUS for each sprint
   - Keep CURRENT_SPRINT updated
   - Maintain DEPENDENCY_GRAPH as sprints are added

---

## Field Descriptions

### PROJECT
- Project name from `/ai/project.scope.md`
- Example: `MyProject`

### PLANNING_DATE
- Date when SPRINT_PLAN.md was created or last major update
- Format: `YYYY-MM-DD`
- Example: `2024-01-15`

### PLANNING_MODE
- **FULL_PROJECT:** All sprints planned upfront
- **ITERATIVE:** Sprints planned one-by-one
- Set by Product Agent based on customer choice
- Also stored in `/ai/project.scope.md` under `SPRINT_MANAGEMENT.PLANNING_MODE`

### TOTAL_SPRINTS
- For FULL_PROJECT: Total number of sprints in the plan
- For ITERATIVE: Number of sprints planned so far (increases over time)

### CURRENT_SPRINT
- Currently active sprint ID
- Used by agents to determine which sprint to work on
- Updated as sprints complete and new ones start

### SPRINT_BREAKDOWN
- Detailed information for each sprint
- Each sprint includes:
  - SPRINT_ID: Unique identifier (001, 002, etc.)
  - GOAL: Business/user goal for the sprint
  - FEATURES: List of features in this sprint
  - DEPENDENCIES: Other sprints this sprint depends on
  - ESTIMATED_DURATION: Estimated time to complete
  - STATUS: Current state of the sprint

### DEPENDENCY_GRAPH
- Visual or text representation of sprint dependencies
- Helps understand execution order
- Important for FULL_PROJECT mode to plan execution sequence

### NOTES
- Additional context, assumptions, or important information
- Planning decisions and rationale

### CHANGELOG
- History of changes to the sprint plan
- Document when sprints are added, modified, or completed
- Useful for tracking plan evolution

---

## Agent Responsibilities

### Product Agent
- Creates initial SPRINT_PLAN.md
- Updates SPRINT_BREAKDOWN when adding new sprints (ITERATIVE mode)
- Updates CURRENT_SPRINT
- Updates TOTAL_SPRINTS
- Documents changes in CHANGELOG

### Architect Agent
- Reads SPRINT_PLAN.md to understand all sprints (FULL_PROJECT mode)
- Reads CURRENT_SPRINT to know which sprint to work on (ITERATIVE mode)
- Does NOT modify SPRINT_PLAN.md

### Planner Agent
- Reads SPRINT_PLAN.md to understand all sprints (FULL_PROJECT mode)
- Reads CURRENT_SPRINT to know which sprint to work on (ITERATIVE mode)
- Does NOT modify SPRINT_PLAN.md

### Other Agents
- Read SPRINT_PLAN.md to understand project structure
- Read CURRENT_SPRINT to know which sprint they're working on
- Do NOT modify SPRINT_PLAN.md

---

## Related Files

- `/ai/project.scope.md` - Contains PLANNING_MODE setting
- `/runs/<SPRINT_ID>/sprint.md` - Individual sprint definition
- `/runs/<SPRINT_ID>/product.md` - Sprint product requirements
- `/runs/<SPRINT_ID>/architecture.md` - Sprint architecture
- `/runs/<SPRINT_ID>/tasks/` - Sprint tasks

---

## Notes

- SPRINT_PLAN.md should ALWAYS exist (created during project initialization)
- All agents read this file to understand project structure
- Only Product Agent modifies this file
- Keep file updated as project evolves
- Use CHANGELOG to track modifications
