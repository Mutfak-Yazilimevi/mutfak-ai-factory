# Feature Management Protocol

Feature ve özellik yönetimi için sistem protokolü.

---

## FEATURE REQUEST FLOW

### 1. Customer Creates Feature Request

**Customer Action:**
1. Create file: `runs/features/requests/feature-<NUMBER>.md`
2. Use `ai/features/feature-template.md` as template
3. Fill in feature details
4. Notify Product Agent

**Customer Prompt:**
```
I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog.
```

---

### 2. Product Agent Reviews Feature

**Product Agent Actions:**
1. Read feature request file
2. Validate completeness
3. Add to `runs/features/backlog.md`
4. Determine priority (HIGH, MEDIUM, LOW)
5. Decide: Add to current sprint OR add to backlog

**Product Agent Decision Criteria:**
- **Add to Current Sprint:**
  - Feature fits sprint goal
  - Sprint not yet in production phase
  - No breaking changes required
  
- **Add to Backlog:**
  - Feature doesn't fit current sprint goal
  - Sprint already in production
  - Requires new sprint planning

---

### 3. Feature Integration

#### Option A: Add to Current Sprint

**If sprint is in planning phase (Product/Architect/Planner):**

1. **Product Agent:**
   - Read current `/runs/<SPRINT_ID>/product.md`
   - Add feature to FUNCTIONAL REQUIREMENTS
   - Update product.md

2. **Architect Agent:**
   - Re-run if needed to update architecture
   - Consider feature impact on existing architecture

3. **Planner Agent:**
   - Re-run to create new tasks for feature
   - Add tasks with proper dependencies

**If sprint is in production phase:**

- **NOT RECOMMENDED** - Feature should go to backlog
- **EXCEPTION:** Critical bug fix or urgent requirement
- In this case, create new tasks and add to current sprint

#### Option B: Add to Backlog

1. **Product Agent:**
   - Add feature to `runs/features/backlog.md`
   - Set STATUS: PLANNED
   - Set PRIORITY
   - Leave SPRINT_ID as "TBD"

2. **Future Sprint Planning:**
   - When creating new sprint, Product Agent reviews backlog
   - Selects features based on priority and sprint goal
   - Includes selected features in new sprint

---

## FEATURE TO SPRINT INTEGRATION

### Adding Feature to New Sprint

**When starting new sprint:**

1. **Product Agent:**
   - Read `runs/features/backlog.md`
   - Select features based on:
     - Priority (HIGH first)
     - Sprint goal alignment
     - Dependencies
   - Include selected features in sprint's product.md
   - Update feature STATUS to IN_PROGRESS
   - Update feature SPRINT_ID

2. **Normal Sprint Flow:**
   - Architect → Planner → Production
   - Feature tasks are created and executed

3. **Feature Completion:**
   - When sprint is DONE, update feature STATUS to DONE
   - Update feature COMPLETED_DATE
   - Move feature from backlog to DONE section

---

## FEATURE MODIFICATION

### Updating Existing Feature

**Customer Action:**
1. Edit feature request file
2. Notify Product Agent

**Product Agent Action:**
1. Review changes
2. If feature is IN_PROGRESS:
   - Assess impact on current sprint
   - Update product.md if needed
   - Notify Planner if new tasks needed
3. If feature is PLANNED:
   - Update backlog entry
   - No immediate action needed

### Canceling Feature

**Customer Action:**
1. Update feature STATUS to DEFERRED
2. Add reason in feature file
3. Notify Product Agent

**Product Agent Action:**
1. Update `runs/features/backlog.md`
2. Move feature to DEFERRED section
3. If feature is IN_PROGRESS:
   - Assess impact on current sprint
   - May need to remove tasks or mark as cancelled

---

## FEATURE DEPENDENCIES

**When feature has dependencies:**

1. **Product Agent:**
   - Identify dependent features
   - Ensure dependencies are completed first
   - Plan feature order in sprint

2. **Planner Agent:**
   - Create tasks with proper dependencies
   - Ensure dependent feature tasks complete first

---

## BEST PRACTICES

1. **One Feature = One File**
   - Keep features atomic
   - One feature request per file

2. **Clear Acceptance Criteria**
   - Feature must have testable criteria
   - Product Agent validates criteria

3. **Priority Management**
   - Review backlog regularly
   - Re-prioritize based on business needs

4. **Sprint Alignment**
   - Features should align with sprint goal
   - Don't force unrelated features into sprint

5. **Documentation**
   - Update backlog regularly
   - Keep feature status current
   - Document decisions

---

## AGENT RESPONSIBILITIES

### Product Agent
- Review feature requests
- Manage backlog
- Integrate features into sprints
- Update feature status

### Architect Agent
- Assess technical impact of features
- Update architecture if needed

### Planner Agent
- Create tasks for features
- Manage feature task dependencies

### Lead Dev
- Review feature task structure
- Ensure feature tasks are properly scoped

### QA Agent
- Verify feature acceptance criteria
- Test feature implementation

### Docs Agent
- Document completed features
- Update feature documentation
