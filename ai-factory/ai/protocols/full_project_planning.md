# FULL PROJECT PLANNING PROTOCOL

PURPOSE:
This protocol defines the process for planning ALL sprints and tasks BEFORE starting any code development.
This ensures complete project visibility and planning from the start.

EXECUTED BY: Product Agent (coordination) + Architect Agent + Planner Agent

---

## OVERVIEW

When starting a NEW project, instead of planning sprints one-by-one as they complete, the system will:

1. **Product Agent:** Plan ALL sprints and create product.md for each sprint
2. **Architect Agent:** Create architecture.md for ALL sprints
3. **Planner Agent:** Create tasks/ for ALL sprints
4. **Only then:** Start code development for Sprint 001

This ensures:
- Complete project visibility from the start
- All dependencies are identified upfront
- No surprises during development
- Better resource planning
- Clear project roadmap

---

## WHEN TO USE

**Full Project Planning is used when:**
- Starting a NEW project (not adding features to existing project)
- Customer wants complete project plan before development starts
- Project scope is well-defined in root `/docs/` folder

**Full Project Planning is NOT used when:**
- Adding features to existing project (use normal sprint flow)
- Project scope is unclear or evolving
- Customer prefers iterative planning

---

## EXECUTION FLOW

### STEP 1: Product Agent - Full Sprint Planning

**Product Agent executes:**

1. **Read Project Documents:**
   - Read ALL files in root `/docs/` folder
   - Read `/ai/project.scope.md`
   - Read `/ai-factory/docs/` (if exists)

2. **Analyze Project Scope:**
   - Identify ALL features and requirements
   - Group features into logical sprints
   - Determine sprint count and goals
   - Identify dependencies between sprints

3. **Create Sprint Plan:**
   - Create `/runs/SPRINT_PLAN.md` file with:
     - Total sprint count
     - Sprint IDs (001, 002, 003, ...)
     - Sprint goals for each sprint
     - Feature assignments per sprint
     - Sprint dependencies
     - Estimated completion order

4. **Initialize ALL Sprint Workspaces:**
   - For each planned sprint:
     - Create `/runs/<SPRINT_ID>/` folder
     - Create sprint directory structure (api/, tasks/, etc.)
     - Create `/runs/<SPRINT_ID>/sprint.md`
     - Create `/runs/<SPRINT_ID>/product.md`

5. **Create Sprint Plan Summary:**
   - Document sprint breakdown in `/runs/SPRINT_PLAN.md`
   - List all sprints with goals and features
   - Show dependencies between sprints

**Output:**
- `/runs/SPRINT_PLAN.md` - Master plan for all sprints
- `/runs/001/sprint.md` - Sprint 001 definition
- `/runs/001/product.md` - Sprint 001 product requirements
- `/runs/002/sprint.md` - Sprint 002 definition
- `/runs/002/product.md` - Sprint 002 product requirements
- ... (for all planned sprints)

---

### STEP 2: Architect Agent - Full Architecture Planning

**Architect Agent executes:**

1. **Read Sprint Plan:**
   - Read `/runs/SPRINT_PLAN.md` to understand all sprints
   - Read all sprint product.md files

2. **Plan Architecture for All Sprints:**
   - Understand how architecture evolves across sprints
   - Identify shared components and contracts
   - Plan API contracts that span multiple sprints

3. **Create Architecture for Each Sprint:**
   - For each sprint in SPRINT_PLAN.md:
     - Read `/runs/<SPRINT_ID>/product.md`
     - Read `/runs/<SPRINT_ID>/sprint.md`
     - Create `/runs/<SPRINT_ID>/architecture.md`
     - Create `/runs/<SPRINT_ID>/api/contract.md` (if needed)

4. **Handle Cross-Sprint Dependencies:**
   - If Sprint B depends on Sprint A's architecture:
     - Reference Sprint A's architecture in Sprint B
     - Document dependencies clearly
     - Ensure contracts are compatible

**Output:**
- `/runs/001/architecture.md` - Sprint 001 architecture
- `/runs/001/api/contract.md` - Sprint 001 API contract (if needed)
- `/runs/002/architecture.md` - Sprint 002 architecture
- `/runs/002/api/contract.md` - Sprint 002 API contract (if needed)
- ... (for all planned sprints)

**Note:** Architect Agent can process sprints in parallel or sequentially, but must respect dependencies.

---

### STEP 3: Planner Agent - Full Task Planning

**Planner Agent executes:**

1. **Read Sprint Plan:**
   - Read `/runs/SPRINT_PLAN.md` to understand all sprints
   - Understand sprint dependencies

2. **Create Tasks for Each Sprint:**
   - For each sprint in SPRINT_PLAN.md:
     - Read `/runs/<SPRINT_ID>/product.md`
     - Read `/runs/<SPRINT_ID>/architecture.md`
     - Read `/runs/<SPRINT_ID>/api/contract.md` (if exists)
     - Create all tasks in `/runs/<SPRINT_ID>/tasks/`

3. **Handle Cross-Sprint Task Dependencies:**
   - If Sprint B tasks depend on Sprint A tasks:
     - Document dependencies in task files
     - Mark dependent tasks appropriately
     - Note: Tasks cannot have direct cross-sprint dependencies, but can reference outputs

**Output:**
- `/runs/001/tasks/` - All tasks for Sprint 001
- `/runs/002/tasks/` - All tasks for Sprint 002
- ... (for all planned sprints)

**Note:** Planner Agent processes sprints sequentially to respect dependencies.

---

### STEP 4: Verification and Approval

**After all planning is complete:**

1. **Product Agent creates summary:**
   - Total sprints planned
   - Total tasks created
   - Sprint dependencies
   - Estimated timeline

2. **Customer Review:**
   - Review `/runs/SPRINT_PLAN.md`
   - Review all sprint product.md files
   - Review all sprint architecture.md files
   - Review task breakdowns

3. **Customer Approval:**
   - Approve full plan
   - Or request adjustments

4. **Start Development:**
   - Only after full plan is approved
   - Start with Sprint 001
   - Follow normal sprint execution flow

---

## SPRINT PLAN FILE FORMAT

**Template:** See `/ai/protocols/sprint-plan-template.md` for complete template.

`/runs/SPRINT_PLAN.md` format:

```markdown
# PROJECT SPRINT PLAN

PROJECT: <PROJECT_NAME>
PLANNING_DATE: <DATE>
PLANNING_MODE: FULL_PROJECT | ITERATIVE
# FULL_PROJECT: All sprints planned upfront
# ITERATIVE: Sprints planned one-by-one as they complete

TOTAL_SPRINTS: <NUMBER>
# For FULL_PROJECT mode: Total number of planned sprints
# For ITERATIVE mode: Number of sprints planned so far (increases as new sprints are added)

CURRENT_SPRINT: <SPRINT_ID>
# Current active sprint (for ITERATIVE mode tracking)

## SPRINT BREAKDOWN

### Sprint 001
- SPRINT_ID: 001
- GOAL: <Sprint goal>
- FEATURES:
  - Feature 1
  - Feature 2
- DEPENDENCIES: None (first sprint)
- ESTIMATED_DURATION: <days/weeks>

### Sprint 002
- SPRINT_ID: 002
- GOAL: <Sprint goal>
- FEATURES:
  - Feature 3
  - Feature 4
- DEPENDENCIES: Sprint 001 (requires API contract)
- ESTIMATED_DURATION: <days/weeks>

... (for all sprints)

## DEPENDENCY GRAPH

Sprint 001 → Sprint 002 → Sprint 003
Sprint 001 → Sprint 004 (parallel to 002)

## NOTES

<Any additional notes about planning decisions>
```

---

## MODIFICATIONS DURING DEVELOPMENT

**If changes are needed during development:**

1. **Feature Changes:**
   - Update affected sprint's product.md
   - Update affected sprint's architecture.md (if needed)
   - Update affected sprint's tasks/ (if needed)
   - Update SPRINT_PLAN.md

2. **New Features:**
   - Add to backlog or create new sprint
   - Follow normal feature request flow

3. **Sprint Scope Changes:**
   - Update sprint's product.md
   - Re-run Architect Agent if architecture changes
   - Re-run Planner Agent if tasks need updates

---

## BEST PRACTICES

1. **Sprint Sizing:**
   - Keep sprints focused and manageable
   - Each sprint should have clear, achievable goals
   - Avoid overly large sprints

2. **Dependency Management:**
   - Clearly document all dependencies
   - Minimize cross-sprint dependencies when possible
   - Plan foundation sprints first

3. **Flexibility:**
   - Plan is a guide, not a contract
   - Allow adjustments as project evolves
   - Update plan when significant changes occur

4. **Communication:**
   - Keep customer informed of planning progress
   - Review plan together before starting development
   - Regular check-ins during development

---

## RELATED PROTOCOLS

- `new_project_initialization.md` - Project setup
- `sprint_initialization.md` - Sprint workspace creation
- `task_generation.md` - Task creation
- `sprint_flow.md` - Sprint execution flow
- `feature_management.md` - Feature tracking

---

## NOTES

- Full project planning requires well-defined project scope
- Planning time may be longer, but saves time during development
- All sprint files are created upfront, enabling better visibility
- Development starts only after full plan is approved
