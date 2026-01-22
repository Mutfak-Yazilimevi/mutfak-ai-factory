# Dashboard Protocol

## Purpose
Define dashboard format and update mechanism for sprint status visualization.

---

## Dashboard Location

**File:** `/runs/<SPRINT_ID>/dashboard.md`

**Created by:** Orchestrator Agent (during sprint initialization)

**Updated by:** Orchestrator Agent (continuously during sprint execution)

---

## Dashboard Format

### Complete Dashboard Template

```markdown
# Sprint Dashboard

**Sprint ID:** <SPRINT_ID>
**Sprint Goal:** <Goal from sprint.md>
**Status:** PLANNING | EXECUTION | QUALITY | DOCUMENTATION | COMPLETE
**Progress:** X% (DONE tasks / Total tasks)
**Started:** <timestamp>
**Last Updated:** <timestamp>
**Estimated Completion:** <estimated time> (if available)

---

## Task Status Breakdown

| Status | Count | Percentage |
|--------|-------|------------|
| TODO | X | X% |
| IN_PROGRESS | Y | Y% |
| DONE | Z | Z% |
| BLOCKED | W | W% |
| **Total** | **X+Y+Z+W** | **100%** |

**Progress Bar:**
```
[████████████░░░░░░░░] Z% Complete
```

---

## Agent Activity

| Agent | Status | Current Task | Last Activity | Tasks Completed |
|-------|--------|--------------|---------------|-----------------|
| Product | IDLE | - | <timestamp> | - |
| Architect | IDLE | - | <timestamp> | - |
| Planner | IDLE | - | <timestamp> | - |
| Lead Dev | IDLE | - | <timestamp> | - |
| Backend | WORKING | BACKEND-003 | <timestamp> | 2 |
| Designer | IDLE | - | <timestamp> | 0 |
| Database | IDLE | - | <timestamp> | 1 |
| Frontend | WAITING | - | <timestamp> | 0 |
| React Native | IDLE | - | <timestamp> | 0 |
| Test Dev | IDLE | - | <timestamp> | 0 |
| Security | IDLE | - | <timestamp> | 0 |
| OPS | IDLE | - | <timestamp> | 0 |
| AI/ML | IDLE | - | <timestamp> | 0 |
| QA | IDLE | - | <timestamp> | - |
| Docs | IDLE | - | <timestamp> | - |

**Status Values:**
- **IDLE:** Not currently working
- **WORKING:** Currently executing a task
- **WAITING:** Waiting for dependencies
- **BLOCKED:** Blocked by error
- **COMPLETE:** All tasks completed

---

## READY Tasks

Tasks that are ready to be executed (STATUS: TODO + all dependencies DONE):

- **BACKEND-003** (no dependencies)
- **FRONTEND-007** (depends on: BACKEND-003 ✓)
- **DATABASE-002** (depends on: DATABASE-001 ✓)

**Total READY:** 3 tasks

---

## IN_PROGRESS Tasks

Tasks currently being worked on:

- **BACKEND-001** (Backend Agent, started: <timestamp>)
- **DESIGNER-001** (Designer Agent, started: <timestamp>)

**Total IN_PROGRESS:** 2 tasks

---

## Blocked Tasks

Tasks blocked by errors (require manual intervention):

- **BACKEND-010:** Circular dependency detected (depends on BACKEND-011, which depends on BACKEND-010)
- **FRONTEND-015:** QA blocking issue (authentication flow incomplete)

**Total BLOCKED:** 2 tasks

**Action Required:** Manual intervention needed for blocked tasks.

---

## Dependencies Graph

Text-based dependency visualization:

```
BACKEND-001 → BACKEND-002 → BACKEND-003
                    ↓
            FRONTEND-005 → FRONTEND-006
                    ↓
            FRONTEND-007

DATABASE-001 → DATABASE-002
                    ↓
            BACKEND-004

DESIGNER-001 → FRONTEND-008
                    ↓
            REACT_NATIVE-001
```

**Legend:**
- `→` Dependency (task on left depends on task on right)
- `↓` Multiple dependencies
- Tasks in **bold** are DONE
- Tasks in *italic* are IN_PROGRESS
- Tasks in ~~strikethrough~~ are BLOCKED

---

## Git Status (if GIT: ACTIVE)

**Branches:** X total
- Active: Y
- Merged: Z
- Closed: W

**Commits:** X total
- This sprint: Y

**Pull Requests:** X total
- Open: Y
- Merged: Z
- Closed: W
- Needs Review: A

**Recent PRs:**
- `[001] BACKEND-001: Create User entity` - Merged
- `[001] FRONTEND-005: Login page` - Open (needs review)

---

## Recent Activity

Last 20 activities (most recent first):

1. **[<timestamp>]** Backend Agent completed BACKEND-003
2. **[<timestamp>]** Dependency engine: FRONTEND-007 is now READY
3. **[<timestamp>]** Frontend Agent started FRONTEND-007
4. **[<timestamp>]** Database Agent completed DATABASE-002
5. **[<timestamp>]** Dependency engine: BACKEND-004 is now READY
6. **[<timestamp>]** Backend Agent started BACKEND-004
7. **[<timestamp>]** Error detected: BACKEND-010 blocked (circular dependency)
8. **[<timestamp>]** Orchestrator stopped: Manual intervention required
9. **[<timestamp>]** Manual fix applied: BACKEND-010 dependency updated
10. **[<timestamp>]** Orchestrator resumed: Continuing execution
...

---

## Sprint Metrics

**Velocity:**
- Tasks completed today: X
- Average task completion time: Y minutes
- Tasks per agent per day: Z

**Quality:**
- QA Status: PASSED | FAILED | PENDING
- Test Coverage: X% (if TEST_DEV: ACTIVE)
- Security Issues: X (if SECURITY: ACTIVE)

**Efficiency:**
- Blocked time: X hours
- Retry count: Y (simple errors)
- Manual interventions: Z (complex errors)

---

## Next Steps

**Immediate:**
- Assign READY tasks to agents
- Monitor IN_PROGRESS tasks
- Resolve blocked tasks

**Upcoming:**
- QA verification (when all tasks DONE)
- Documentation generation (when QA PASSED)

**Blockers:**
- 2 tasks blocked (see Blocked Tasks section)
- Manual intervention required

---

## Notes

- Dashboard updates every 1 minute or after significant events
- Last full refresh: <timestamp>
- Next scheduled update: <timestamp>

---

**Generated by:** Orchestrator Agent
**Last Updated:** <timestamp>
```

---

## Dashboard Update Triggers

### Event-Driven Updates

Dashboard is updated immediately after:

1. **Task Status Change:**
   - TODO → IN_PROGRESS
   - IN_PROGRESS → DONE
   - Any → BLOCKED

2. **Agent Execution:**
   - Agent starts task
   - Agent completes task
   - Agent reports error

3. **Dependency Transition:**
   - Task becomes READY (all dependencies DONE)
   - Task becomes NOT READY (dependency failed)

4. **Error Events:**
   - Simple error detected
   - Complex error detected
   - Error resolved

5. **Mode Changes:**
   - Planning → Execution
   - Execution → Quality
   - Quality → Documentation
   - Documentation → Complete

### Periodic Updates

Dashboard is updated every 1 minute even if no events occur (to refresh timestamps and status).

---

## Dashboard Update Process

### 1. Read Current State

- Read all task files
- Read execution logs
- Read qa.md (if exists)
- Read sprint.md
- Read product.md (if exists)

### 2. Calculate Metrics

- Count tasks by status
- Calculate progress percentage
- Identify READY tasks
- Identify blocked tasks
- Build dependency graph
- Calculate agent activity

### 3. Update Dashboard

- Update task status breakdown
- Update agent activity table
- Update READY tasks list
- Update blocked tasks list
- Update dependencies graph
- Update recent activity
- Update metrics
- Update timestamps

### 4. Write Dashboard File

- Write complete dashboard.md
- Log dashboard update to execution log

---

## Dashboard Sections

### Required Sections

1. **Sprint Overview** - Basic sprint information
2. **Task Status Breakdown** - Task counts by status
3. **Agent Activity** - Current agent status
4. **READY Tasks** - Tasks ready for execution
5. **Recent Activity** - Last 20 activities

### Optional Sections

6. **IN_PROGRESS Tasks** - Currently working tasks (if any)
7. **Blocked Tasks** - Blocked tasks (if any)
8. **Dependencies Graph** - Visual dependency representation
9. **Git Status** - Git information (if GIT: ACTIVE)
10. **Sprint Metrics** - Performance metrics
11. **Next Steps** - Suggested actions

---

## Dashboard Visualization

### Progress Bar

```
[████████████░░░░░░░░] 60% Complete
```

- Each `█` represents 5% progress
- Total 20 blocks = 100%

### Status Indicators

- ✅ DONE
- 🔄 IN_PROGRESS
- ⏳ TODO
- ⛔ BLOCKED
- ✅ READY

---

## Related Documents

- `ai/agents/orchestrator.md` - Orchestrator Agent (updates dashboard)
- `ai/protocols/execution_log.md` - Execution logging (source for activity)
- `ai/protocols/hybrid_error_handling.md` - Error handling (affects dashboard)

---

**Last Updated:** 2024
