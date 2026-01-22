# Multi-Sprint Support Protocol

## Purpose
Define protocols for managing multiple concurrent sprints when `CONCURRENT_SPRINTS: ALLOWED` in project.scope.md.

---

## Configuration

### project.scope.md Setting
```
SPRINT_MANAGEMENT:
  CONCURRENT_SPRINTS: ALLOWED | SINGLE_ONLY
```

- **ALLOWED:** Multiple sprints can run simultaneously
- **SINGLE_ONLY:** Only one sprint active at a time (recommended for beginners)

---

## Sprint Identification

### Sprint ID Format
- **Sequential:** `001`, `002`, `003` (for single project)
- **Project-Prefixed:** `{PROJECT_NAME}-001`, `{PROJECT_NAME}-002`
- **Feature-Prefixed:** `FEATURE-001`, `FEATURE-002` (for feature-specific sprints)
- **Platform-Prefixed:** `REACT_NATIVE-001`, `API-001` (for platform-specific sprints)

### Sprint Naming Convention
Each sprint must have a unique SPRINT_ID that:
- Matches folder name: `/runs/<SPRINT_ID>/`
- Is consistent across all sprint files
- Does not conflict with existing sprints

---

## Sprint Isolation

### File System Isolation
- Each sprint has its own folder: `/runs/<SPRINT_ID>/`
- Sprint files are completely isolated
- No shared files between sprints (except project.scope.md and templates)

### Agent Execution Isolation
- Agents must specify SPRINT_ID explicitly
- Agents only read/write within their sprint folder
- No cross-sprint file access allowed

### Task Isolation
- Tasks belong to one sprint only
- Task IDs are unique within sprint (can repeat across sprints)
- No cross-sprint task dependencies

---

## Cross-Sprint Dependencies

### When Needed
Cross-sprint dependencies are needed when:
- Sprint B depends on output from Sprint A
- Feature sprint depends on foundation sprint
- Platform sprint depends on API sprint

### Dependency Declaration
In sprint planning, explicitly declare cross-sprint dependencies:

```markdown
CROSS_SPRINT_DEPENDENCIES:
- SPRINT_ID: 001
  OUTPUT: api/contract.md
  STATUS: DONE
  REQUIRED_BY: Sprint 002 Frontend tasks
```

### Dependency Verification
Before starting dependent sprint:
1. Verify source sprint is COMPLETE
2. Verify required outputs exist
3. Copy required files to dependent sprint (if needed)
4. Document dependency in sprint files

---

## Resource Conflict Management

### File Conflicts
- **No conflicts possible:** Each sprint has isolated folder
- **Shared resources:** Only project.scope.md and templates are shared (read-only)

### Agent Conflict
- **Serial execution recommended:** Run one agent at a time per sprint
- **Parallel execution:** Possible if agents work on different sprints
- **Coordination:** Use execution logs to track agent activity

### Code Conflicts
- **Root /src/ conflicts:** Possible when multiple sprints modify same files
- **Resolution:** Use feature branches or coordinate file ownership
- **Best practice:** Assign file ownership per sprint in architecture.md

---

## Sprint Priority

### Priority Levels
- **HIGH:** Critical path, blocking other work
- **MEDIUM:** Important but not blocking
- **LOW:** Nice-to-have, can be deferred

### Priority Assignment
Set in sprint.md:
```markdown
PRIORITY: HIGH | MEDIUM | LOW
```

### Execution Order
- High priority sprints execute first
- Medium priority sprints execute after high
- Low priority sprints execute last or in parallel

---

## Sprint Status Tracking

### Active Sprints
List all active sprints in `/runs/ACTIVE_SPRINTS.md`:
```markdown
ACTIVE_SPRINTS:
- SPRINT_ID: 001
  STATUS: IN_PROGRESS
  PRIORITY: HIGH
  START_DATE: 2024-01-15
  EXPECTED_COMPLETION: 2024-01-22
  
- SPRINT_ID: 002
  STATUS: PLANNING
  PRIORITY: MEDIUM
  DEPENDS_ON: 001
```

### Status Values
- **PLANNING:** Sprint being planned (Product/Architect/Planner)
- **IN_PROGRESS:** Tasks being executed
- **REVIEW:** QA or Lead Dev review
- **COMPLETE:** All tasks done, QA passed, docs complete
- **BLOCKED:** Blocked by dependency or issue

---

## Multi-Sprint Workflow

### Starting New Sprint
1. **Check Active Sprints:**
   - Read `/runs/ACTIVE_SPRINTS.md`
   - Verify no conflicts
   - Check dependencies

2. **Determine Priority:**
   - Set priority in sprint.md
   - Update ACTIVE_SPRINTS.md

3. **Initialize Sprint:**
   - Product Agent creates sprint folder
   - Follow normal sprint initialization

4. **Track Status:**
   - Update ACTIVE_SPRINTS.md regularly
   - Update status as sprint progresses

### Managing Dependencies
1. **Identify Dependencies:**
   - List required outputs from other sprints
   - Document in sprint.md

2. **Wait for Dependencies:**
   - Monitor source sprint status
   - Wait until source sprint COMPLETE

3. **Copy Required Files:**
   - Copy outputs from source sprint
   - Verify file integrity
   - Document in sprint files

4. **Resume Sprint:**
   - Continue normal sprint execution
   - Update ACTIVE_SPRINTS.md

### Completing Sprint
1. **Verify Completion:**
   - All tasks DONE
   - QA PASSED
   - Docs complete

2. **Update Status:**
   - Mark sprint COMPLETE in ACTIVE_SPRINTS.md
   - Update dependent sprints

3. **Archive:**
   - Move sprint to archive (optional)
   - Keep for reference

---

## Best Practices

### For Beginners (SINGLE_ONLY)
- Start with one sprint at a time
- Complete sprint before starting next
- Learn system before using multi-sprint

### For Advanced (ALLOWED)
- Use clear sprint naming
- Document all dependencies
- Track status regularly
- Coordinate file ownership in /src/

### General
- Always specify SPRINT_ID explicitly
- Use full paths in agent prompts
- Check ACTIVE_SPRINTS.md before starting
- Update status regularly

---

## Conflict Resolution

### File Conflicts in /src/
If multiple sprints modify same files:

1. **Identify Conflict:**
   - Check execution logs
   - Identify conflicting files

2. **Resolve:**
   - **Option A:** Assign file ownership to one sprint
   - **Option B:** Split file into sprint-specific versions
   - **Option C:** Sequence sprints (complete one before starting other)

3. **Document:**
   - Update architecture.md with file ownership
   - Document resolution in sprint files

### Priority Conflicts
If sprints have same priority:

1. **Assess Impact:**
   - Which sprint blocks more work?
   - Which sprint is closer to completion?

2. **Adjust Priority:**
   - Increase priority of more critical sprint
   - Defer less critical sprint

3. **Document:**
   - Update sprint.md with new priority
   - Update ACTIVE_SPRINTS.md

---

## Monitoring Multi-Sprint System

### Status Dashboard
Use `scripts/sprint_status.sh` or `scripts/sprint_status.ps1` for each sprint:
```bash
./sprint_status.sh 001
./sprint_status.sh 002
```

### Active Sprint Summary
Create summary script to show all active sprints:
- List all active sprints
- Show progress for each
- Highlight blockers
- Show dependencies

---

## Limitations

### Current Limitations
- No automated dependency resolution
- Manual coordination required
- File conflicts in /src/ must be managed manually

### Future Enhancements
- Automated dependency resolution
- Conflict detection and prevention
- Automated sprint sequencing
- Cross-sprint task dependencies

---

## Example: Two Concurrent Sprints

### Sprint 001: API Foundation
- **SPRINT_ID:** 001
- **PRIORITY:** HIGH
- **GOAL:** Create API foundation
- **OUTPUTS:** api/contract.md, backend endpoints

### Sprint 002: Frontend Implementation
- **SPRINT_ID:** 002
- **PRIORITY:** MEDIUM
- **GOAL:** Implement frontend
- **DEPENDS_ON:** Sprint 001 (api/contract.md)
- **STATUS:** Waiting for Sprint 001

### Workflow
1. Start Sprint 001 (HIGH priority)
2. Sprint 002 waits (depends on 001)
3. Sprint 001 completes, produces api/contract.md
4. Copy api/contract.md to Sprint 002
5. Start Sprint 002 execution
6. Both sprints can run in parallel (if no other conflicts)

---

## Summary

Multi-sprint support enables:
- ✅ Parallel development streams
- ✅ Feature-specific sprints
- ✅ Platform-specific sprints
- ✅ Faster delivery (when dependencies allow)

But requires:
- ⚠️ Careful dependency management
- ⚠️ Explicit coordination
- ⚠️ Status tracking
- ⚠️ Conflict resolution

**Recommendation:** Start with SINGLE_ONLY, move to ALLOWED when comfortable with system.
