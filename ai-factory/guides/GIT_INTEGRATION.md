# Git Integration Guide

How to use Git integration with AI Factory agents.

---

## 🎯 Overview

AI Factory supports optional Git integration for version control. When enabled, agents automatically create branches, commit changes, and create pull requests following consistent conventions.

---

## ⚙️ Configuration

### Enable Git Integration

Edit `ai-factory/ai/project.scope.md`:

```yaml
GIT:
  STATUS: ACTIVE | NONE
  # ACTIVE: Agents follow Git conventions
  # NONE: No Git constraints (default)
  
  # When ACTIVE, configure these:
  BRANCH_NAMING: SPRINT_TASK | TASK_ONLY | CUSTOM
  # SPRINT_TASK: 001/BACKEND-001-create-user-entity (default)
  # TASK_ONLY: BACKEND-001-create-user-entity
  # CUSTOM: Define custom format
  
  COMMIT_MESSAGE_FORMAT: STANDARD | CONVENTIONAL | CUSTOM
  # STANDARD: <TASK_ID>: <description> (default)
  # CONVENTIONAL: feat(<TASK_ID>): <description>
  # CUSTOM: Define custom format
  
  REQUIRE_PR: YES | NO
  # YES: All tasks must have PR before DONE
  # NO: Direct commits allowed (default)
  
  AUTO_LINK_TASK: YES | NO
  # YES: Auto-link commits/PRs to tasks (default: NO)
  # NO: Manual linking required
```

---

## 🔀 Git Workflow

### When GIT: ACTIVE

#### 1. Task Start
- Agent creates branch: `<SPRINT_ID>/<TASK_ID>-<description>`
- Example: `001/BACKEND-001-create-user-entity`
- Agent checks out branch before starting work

#### 2. During Task
- Agent commits changes with proper format
- Commit message includes TASK_ID
- Files changed are listed in commit message

#### 3. Task Completion
- All changes committed
- Branch pushed to remote (if applicable)
- PR created (if REQUIRE_PR: YES)
- Task marked DONE

### When GIT: NONE

- No branch creation
- No commit requirements
- Code written directly
- No PR creation

---

## 📝 Branch Naming

### Format
```
<SPRINT_ID>/<TASK_ID>-<short-description>
```

### Rules
- Use lowercase for description
- Use hyphens for word separation
- Keep description short (max 50 characters)
- Match TASK_ID exactly from task file

### Examples
- `001/BACKEND-001-create-user-entity`
- `001/FRONTEND-005-login-page`
- `001/DATABASE-002-user-migration`
- `001/REACT-010-user-profile-component`

---

## 💬 Commit Messages

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
- First line must include TASK_ID
- List all changed files in FILES section
- Include Sprint and Task references
- Keep first line under 72 characters

### Examples

**Simple commit:**
```
BACKEND-001: Create User domain entity

Implemented User entity with email and password fields.

FILES:
- src/api/MyProject.Domain/Entities/User.cs

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
- src/web/components/Login.tsx
- src/web/components/LoginForm.tsx
- src/web/hooks/useAuth.ts

RELATED:
- Sprint: 001
- Task: FRONTEND-005
```

---

## 🔗 Pull Requests

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
```

### Examples
- `[001] BACKEND-001: Create User domain entity`
- `[001] FRONTEND-005: Implement login page`
- `[002] DATABASE-002: Create user migration`

---

## ✅ Best Practices

### Branch Management
- ✅ One branch per task
- ✅ Delete branch after PR merge
- ✅ Keep branch names descriptive but short
- ❌ Don't reuse branches for different tasks

### Commit Strategy
- ✅ Commit frequently (logical units)
- ✅ Use meaningful commit messages
- ✅ Include TASK_ID in every commit
- ❌ Don't wait until task completion to commit

### PR Strategy
- ✅ Create PR when task is DONE (if REQUIRE_PR: YES)
- ✅ Include all task information in PR
- ✅ Link PR to task file (if supported)
- ❌ Don't skip PR creation when required

---

## 🚨 Common Issues

### Branch Already Exists
**Problem:** Agent cannot create branch because it exists.

**Solutions:**
- If task is IN_PROGRESS: Checkout existing branch
- If task is TODO: Delete old branch and create new
- If branch is for different task: Create with unique suffix

### Commit Message Missing TASK_ID
**Problem:** Commit message doesn't include TASK_ID.

**Solutions:**
- Amend commit message to include TASK_ID
- Follow standard format from protocol

### PR Not Created When Required
**Problem:** Task marked DONE without PR when REQUIRE_PR: YES.

**Solutions:**
- Create PR manually
- Update task COMPLETION section with PR info
- Re-run agent to create PR if task still IN_PROGRESS

---

## 📊 Task Completion with Git

When GIT: ACTIVE, task COMPLETION section includes:

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

---

## 🔍 Verification

### Check Git Status
```
Check project.scope.md for GIT: STATUS setting.

If GIT: ACTIVE:
- Agents must follow Git conventions
- Branch naming: <SPRINT_ID>/<TASK_ID>-<description>
- Commit format: <TASK_ID>: <description>
- PR format: [<SPRINT_ID>] <TASK_ID>: <TITLE>

If GIT: NONE:
- No Git constraints
- Work directly without branches/commits
```

### Verify Agent Followed Git Rules
1. Check task COMPLETION section for GIT info
2. Verify branch name matches convention
3. Check commit messages include TASK_ID
4. Verify PR created (if REQUIRE_PR: YES)

---

## 📚 Related Documents

- `ai/protocols/git_integration.md` - Detailed Git integration protocol
- `ai/project.scope.md` - Git configuration settings
- `guides/BEST_PRACTICES.md` - Git best practices
- `guides/AGENT_PROMPTS.md` - Agent prompts with Git

---

## 💡 Tips

1. **Enable Git for production projects:** Better version control and collaboration
2. **Use REQUIRE_PR: YES for critical tasks:** Ensures code review
3. **Keep branch names short:** Easier to read and manage
4. **Commit frequently:** Better change tracking
5. **Link PRs to tasks:** Better traceability

---

**Last Updated:** 2024
