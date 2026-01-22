# Git Integration Protocol

## Purpose
Define Git conventions for task-based development in AI Software Factory.

**This protocol is only active when `GIT: ACTIVE` in `project.scope.md`.**

---

## Configuration

### project.scope.md Setting
```yaml
GIT:
  STATUS: ACTIVE | NONE
  # ACTIVE: Git integration rules apply, agents must follow Git conventions
  # NONE: Git integration disabled, agents work without Git constraints
```

**When GIT: ACTIVE:**
- All developer agents must follow Git conventions
- Branch naming, commit messages, and PR format are enforced
- Task completion includes Git operations

**When GIT: NONE:**
- Agents work without Git constraints
- No branch naming or commit message requirements
- Code is written directly without Git operations

---

## Branch Naming Convention

### Format
```
<SPRINT_ID>/<TASK_ID>-<short-description>
```

### Rules
- Use lowercase for description
- Use hyphens for word separation
- Keep description short (max 50 characters)
- Remove special characters
- Match TASK_ID exactly from task file

### Examples
- `001/BACKEND-001-create-user-entity`
- `001/FRONTEND-005-login-page`
- `001/DATABASE-002-user-migration`
- `001/TEST-DEV-010-user-entity-tests`

### Agent Responsibilities
- **Before starting task:** Create branch with correct naming
- **Branch name source:** Read TASK_ID from task file
- **If branch exists:** Checkout existing branch (for IN_PROGRESS tasks)

---

## Commit Message Format

### Standard Format
```
<TASK_ID>: <SHORT_DESCRIPTION>

<DETAILED_DESCRIPTION>

FILES:
- <file1>
- <file2>

RELATED:
- Sprint: <SPRINT_ID>
- Task: <TASK_ID>
```

### Rules
- First line: `<TASK_ID>: <SHORT_DESCRIPTION>` (max 72 characters)
- Empty line after first line
- Detailed description (optional but recommended)
- FILES section: List all changed files
- RELATED section: Sprint and Task references

### Examples

**Simple commit:**
```
BACKEND-001: Create User domain entity

Implemented User entity with email and password fields.
Added validation rules and domain constraints.

FILES:
- src/Domain/Entities/User.cs
- src/Domain/ValueObjects/Email.cs

RELATED:
- Sprint: 001
- Task: BACKEND-001
```

**Complex commit:**
```
FRONTEND-005: Implement login page

Created login page with email/password form.
Added form validation and error handling.
Integrated with authentication API.

FILES:
- src/components/Login.tsx
- src/components/LoginForm.tsx
- src/hooks/useAuth.ts

RELATED:
- Sprint: 001
- Task: FRONTEND-005
```

### Agent Responsibilities
- **Commit message must include TASK_ID** in first line
- **List all changed files** in FILES section
- **Include Sprint and Task references** in RELATED section
- **One commit per task** (unless task is split into multiple commits)

---

## Pull Request (PR) Format

### PR Title Format
```
[<SPRINT_ID>] <TASK_ID>: <TITLE>
```

### PR Description Template
```markdown
## Task Information
- **Sprint:** <SPRINT_ID>
- **Task ID:** <TASK_ID>
- **Role:** <ROLE>
- **Task File:** `/runs/<SPRINT_ID>/tasks/<role>/task-XXX.md`

## Description
<TASK_DESCRIPTION from task file>

## Acceptance Criteria
- [ ] <Criterion 1>
- [ ] <Criterion 2>
- [ ] <Criterion 3>

## Files Changed
- <file1>
- <file2>

## Related Tasks
- **Depends on:** <TASK_ID> (if any)
- **Blocks:** <TASK_ID> (if any)

## Testing
- [ ] Unit tests pass
- [ ] Integration tests pass
- [ ] Manual testing completed

## Notes
<Any additional notes or context>
```

### Agent Responsibilities
- **PR title must follow format:** `[<SPRINT_ID>] <TASK_ID>: <TITLE>`
- **PR description must include task information**
- **Link PR to task file** (if supported by Git platform)
- **Mark acceptance criteria** as checklist items

---

## Git Workflow

### When GIT: ACTIVE

#### 1. Task Start (STATUS: TODO → IN_PROGRESS)
1. Read task file to get TASK_ID
2. Create branch: `<SPRINT_ID>/<TASK_ID>-<short-description>`
3. Checkout branch
4. Update task STATUS to IN_PROGRESS
5. Log branch creation to execution log

#### 2. During Task Execution
1. Make code changes
2. Stage changes: `git add <files>`
3. Commit with proper message format
4. Continue until task is complete

#### 3. Task Completion (STATUS: IN_PROGRESS → DONE)
1. Ensure all changes are committed
2. Push branch to remote (if applicable)
3. Create PR with proper format (if REQUIRE_PR: YES)
4. Update task STATUS to DONE
5. Log PR creation to execution log

### When GIT: NONE
- No branch creation required
- No commit message format required
- Code is written directly
- No PR creation required

---

## Agent-Specific Rules

### All Developer Agents (Backend, Frontend, React Native, Database, Test Dev, Security, OPS, AI/ML, Designer, Custom Agents)

**When GIT: ACTIVE:**
1. **Before starting task:**
   - Check `project.scope.md` for `GIT: STATUS`
   - If ACTIVE, create branch with correct naming
   - If NONE, proceed without Git operations

2. **During task execution:**
   - Make code changes
   - Commit changes with proper message format
   - Include TASK_ID in commit message

3. **When completing task:**
   - Ensure all changes are committed
   - Create PR if `REQUIRE_PR: YES` in project.scope.md
   - Update task STATUS to DONE

**When GIT: NONE:**
- Work without Git constraints
- No branch or commit requirements
- Code is written directly

---

## Error Handling

### Branch Already Exists
- **If branch exists and task is IN_PROGRESS:** Checkout existing branch
- **If branch exists and task is TODO:** Delete old branch and create new one
- **If branch exists for different task:** Create branch with unique suffix

### Commit Message Validation
- **If TASK_ID missing:** Add TASK_ID to commit message
- **If format incorrect:** Fix commit message format
- **If files not listed:** Add FILES section to commit message

### PR Creation Issues
- **If PR creation fails:** Log error and continue
- **If PR format incorrect:** Fix PR title/description
- **If PR already exists:** Link to existing PR

---

## Integration with Task System

### Task File Updates
When GIT: ACTIVE, task COMPLETION section should include:
```markdown
COMPLETION:
  SUMMARY:
    - What was implemented
  FILES:
    - List of created/modified files
  GIT:
    - Branch: <branch-name>
    - Commits: <number-of-commits>
    - PR: <PR-number or URL> (if created)
```

### Execution Log
When GIT: ACTIVE, execution log should include:
```
[<timestamp>] [<agent>] [GIT] Branch created: <branch-name>
[<timestamp>] [<agent>] [GIT] Commit: <commit-hash> - <TASK_ID>: <description>
[<timestamp>] [<agent>] [GIT] PR created: <PR-number>
```

---

## Best Practices

### Branch Management
- **One branch per task** (unless task is split)
- **Delete branch after PR merge** (if applicable)
- **Keep branch names descriptive but short**

### Commit Strategy
- **One commit per logical change** (not necessarily one per task)
- **Commit frequently** (don't wait until task completion)
- **Use meaningful commit messages**

### PR Strategy
- **Create PR when task is DONE** (if REQUIRE_PR: YES)
- **Link PR to task file** (if supported)
- **Include all relevant information** in PR description

---

## Configuration Options

### project.scope.md Git Settings
```yaml
GIT:
  STATUS: ACTIVE | NONE
  
  # When ACTIVE, additional settings:
  BRANCH_NAMING: SPRINT_TASK | TASK_ONLY | CUSTOM
  # SPRINT_TASK: 001/BACKEND-001-create-user-entity (default)
  # TASK_ONLY: BACKEND-001-create-user-entity
  # CUSTOM: Define custom format
  
  COMMIT_MESSAGE_FORMAT: STANDARD | CONVENTIONAL | CUSTOM
  # STANDARD: <TASK_ID>: <description> (default)
  # CONVENTIONAL: feat(<TASK_ID>): <description>
  # CUSTOM: Define custom format
  
  REQUIRE_PR: YES | NO
  # YES: All tasks must go through PR (default: NO)
  # NO: Direct commits allowed
  
  AUTO_LINK_TASK: YES | NO
  # YES: Automatically link commits/PRs to task files (default: NO)
  # NO: Manual linking required
```

---

## Examples

### Example 1: Backend Task with Git
**Task:** BACKEND-001
**Sprint:** 001
**GIT: ACTIVE**

1. Create branch: `001/BACKEND-001-create-user-entity`
2. Implement User entity
3. Commit: `BACKEND-001: Create User domain entity`
4. Create PR: `[001] BACKEND-001: Create User domain entity`
5. Mark task DONE

### Example 2: Frontend Task without Git
**Task:** FRONTEND-005
**Sprint:** 001
**GIT: NONE**

1. Implement login page
2. Write code directly (no branch/commit)
3. Mark task DONE

---

## Related Documents

- `ai/project.scope.md` - Git configuration
- `ai/protocols/task_format.md` - Task file format
- `ai/protocols/execution_log.md` - Execution logging
- `guides/BEST_PRACTICES.md` - Git best practices

---

**Last Updated:** 2024
