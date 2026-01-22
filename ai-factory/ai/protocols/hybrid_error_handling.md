# Hybrid Error Handling Protocol

## Purpose
Define error handling strategy for Orchestrator Agent: automatic retry for simple errors, manual intervention for complex errors.

---

## Error Categories

### Simple Errors (Automatic Retry)

**Definition:** Errors that can be resolved automatically without human decision-making.

**Error Types:**

1. **Agent Timeout**
   - **Symptom:** Agent doesn't respond within 10 minutes
   - **Detection:** No execution log update, task still IN_PROGRESS
   - **Resolution:** Retry agent execution (max 3 times)
   - **Retry Strategy:** Exponential backoff (30s, 60s, 120s)

2. **File Not Found**
   - **Symptom:** Agent reports missing file
   - **Detection:** Agent execution log shows "file not found" error
   - **Resolution:** Verify path, retry (max 3 times)
   - **Retry Strategy:** Immediate retry (file might be created by another agent)

3. **Task Stuck**
   - **Symptom:** Task IN_PROGRESS > 30 minutes with no activity
   - **Detection:** Task file not modified, execution log not updated
   - **Resolution:** Resume task or retry (max 3 times)
   - **Retry Strategy:** Check execution log, resume from last known state

4. **Dependency Not Ready**
   - **Symptom:** Task dependencies not DONE yet
   - **Detection:** Task STATUS: TODO, but dependencies not DONE
   - **Resolution:** Wait and retry (not a real error, just timing)
   - **Retry Strategy:** Periodic check (every 2 minutes)

5. **Network/Connection Error**
   - **Symptom:** Agent cannot connect to external service
   - **Detection:** Agent execution log shows connection error
   - **Resolution:** Retry (max 3 times)
   - **Retry Strategy:** Exponential backoff (30s, 60s, 120s)

### Complex Errors (Manual Intervention)

**Definition:** Errors that require human decision-making or architectural changes.

**Error Types:**

1. **Circular Dependency**
   - **Symptom:** Task A depends on Task B, Task B depends on Task A
   - **Detection:** Dependency graph analysis
   - **Resolution:** Manual intervention required
   - **Action:** Mark tasks as BLOCKED, notify Planner Agent, wait for manual fix

2. **QA Failed (Blocking Issues)**
   - **Symptom:** QA Agent reports STATUS: FAILED with blocking issues
   - **Detection:** qa.md shows FAILED status
   - **Resolution:** Manual intervention required
   - **Action:** Stop orchestration, report blocking issues, wait for fix tasks

3. **Architecture Conflict**
   - **Symptom:** Agent reports architecture decision needed
   - **Detection:** Agent execution log shows "architecture conflict" or BLOCKED_REASON mentions architecture
   - **Resolution:** Manual intervention required
   - **Action:** Mark task as BLOCKED, notify Architect Agent, wait for decision

4. **Product Ambiguity**
   - **Symptom:** Agent reports product requirement unclear
   - **Detection:** Agent execution log shows "product requirement unclear" or BLOCKED_REASON mentions product
   - **Resolution:** Manual intervention required
   - **Action:** Mark task as BLOCKED, notify Product Agent, wait for clarification

5. **Security Violation**
   - **Symptom:** Security Agent reports critical security issue
   - **Detection:** Security Agent execution log or security report
   - **Resolution:** Manual intervention required
   - **Action:** Stop orchestration, report security issue, wait for fix

6. **Data Loss Risk**
   - **Symptom:** Database migration or data operation might cause data loss
   - **Detection:** Database Agent reports data loss risk
   - **Resolution:** Manual intervention required
   - **Action:** Mark task as BLOCKED, notify user, wait for approval

---

## Error Handling Workflow

### Simple Error Handling

```
1. Detect Error
   ↓
2. Categorize as Simple Error
   ↓
3. Log Error to Execution Log
   ↓
4. Apply Retry Strategy
   - Wait for retry interval
   - Retry agent execution
   ↓
5. Check Result
   - If Success → Continue
   - If Failure → Increment retry count
   ↓
6. Check Retry Count
   - If < Max Retries → Go to step 4
   - If >= Max Retries → Mark BLOCKED, Report to User
```

### Complex Error Handling

```
1. Detect Error
   ↓
2. Categorize as Complex Error
   ↓
3. Mark Task as BLOCKED
   - Update task STATUS: BLOCKED
   - Add BLOCKED_REASON section
   ↓
4. STOP Orchestration
   - Stop all agent execution
   - Update dashboard with error
   ↓
5. Report to User
   - Error type
   - Task ID
   - Blocked reason
   - Suggested resolution
   - Affected tasks
   ↓
6. Wait for Manual Intervention
   - User fixes issue
   - User confirms fix
   ↓
7. Resume Orchestration
   - Unblock task (STATUS: TODO)
   - Continue from where stopped
```

---

## Retry Strategy Details

### Retry Limits

- **Max Retries:** 3 attempts
- **Retry Intervals:** Exponential backoff
  - First retry: 30 seconds
  - Second retry: 60 seconds
  - Third retry: 120 seconds

### Retry Conditions

**Retry if:**
- Error is categorized as simple
- Retry count < max retries
- Error is transient (timeout, connection, file not found)

**Do NOT retry if:**
- Error is categorized as complex
- Retry count >= max retries
- Error is permanent (circular dependency, architecture conflict)

### Retry Actions

1. **Agent Timeout:**
   - Check execution log for last activity
   - Resume task from last known state
   - Retry agent execution

2. **File Not Found:**
   - Verify file path
   - Check if file should exist (check dependencies)
   - Wait for file creation (if dependency)
   - Retry agent execution

3. **Task Stuck:**
   - Read task file completely
   - Check execution log for last action
   - Resume from last known state
   - Retry agent execution

---

## Error Detection Methods

### 1. Execution Log Monitoring

**Check for:**
- Error messages in agent execution logs
- Timeout indicators
- Connection errors
- File not found errors

**Location:** `/runs/<SPRINT_ID>/logs/<agent>-execution.log`

### 2. Task Status Monitoring

**Check for:**
- Tasks stuck in IN_PROGRESS > 30 minutes
- Tasks with BLOCKED status
- Tasks with missing COMPLETION section after expected completion

**Location:** `/runs/<SPRINT_ID>/tasks/<role>/task-*.md`

### 3. Dependency Validation

**Check for:**
- Circular dependencies
- Missing dependencies
- Invalid dependency references

**Method:** Graph analysis of task dependencies

### 4. QA Status Check

**Check for:**
- qa.md STATUS: FAILED
- Blocking issues in qa.md
- Missing qa.md (if expected)

**Location:** `/runs/<SPRINT_ID>/qa.md`

### 5. File System Validation

**Check for:**
- Required files exist (OUTPUT section)
- Files created/modified as expected
- File permissions

---

## Error Reporting

### Simple Error Report Format

```markdown
**Error Type:** <Error Type>
**Task ID:** <TASK_ID>
**Agent:** <Agent Name>
**Detection Time:** <timestamp>
**Retry Count:** X/3
**Action:** Retrying...
**Next Retry:** <timestamp>
```

### Complex Error Report Format

```markdown
**Error Type:** <Error Type>
**Severity:** CRITICAL | HIGH | MEDIUM
**Task ID:** <TASK_ID>
**Agent:** <Agent Name>
**Detection Time:** <timestamp>
**Blocked Reason:** <Detailed reason>
**Affected Tasks:** <List of affected task IDs>
**Suggested Resolution:** <Suggested fix>
**Status:** WAITING FOR MANUAL INTERVENTION
```

### Error Log Entry Format

```
[<timestamp>] [ORCHESTRATOR] [ERROR] <Error Type>: <Task ID> - <Brief description>
[<timestamp>] [ORCHESTRATOR] [ERROR] Retry attempt X/3 for <Task ID>
[<timestamp>] [ORCHESTRATOR] [ERROR] <Task ID> blocked: <Reason>
[<timestamp>] [ORCHESTRATOR] [ERROR] Orchestration stopped: <Reason>
```

---

## Manual Intervention Process

### When Manual Intervention is Required

1. **Complex error detected**
2. **Max retries exceeded for simple error**
3. **User explicitly requests pause**

### Manual Intervention Steps

1. **Orchestrator stops:**
   - All agent execution stops
   - Current state is saved
   - Dashboard updated with error

2. **User receives notification:**
   - Error report
   - Affected tasks
   - Suggested resolution

3. **User fixes issue:**
   - Resolves error (fixes code, updates task, etc.)
   - Confirms fix

4. **Orchestrator resumes:**
   - Reads updated state
   - Unblocks tasks
   - Continues from where stopped

### Manual Intervention Confirmation

**User confirms fix by:**
- Updating task STATUS: TODO (from BLOCKED)
- Removing BLOCKED_REASON section
- Or explicitly telling Orchestrator to resume

---

## Error Prevention

### Proactive Measures

1. **Pre-flight Checks:**
   - Verify all required files exist before agent execution
   - Validate dependencies before task assignment
   - Check agent availability before assignment

2. **Validation:**
   - Validate task format before assignment
   - Validate dependency references
   - Validate file paths

3. **Monitoring:**
   - Continuous monitoring of agent execution
   - Early detection of stuck tasks
   - Proactive dependency checking

---

## Related Documents

- `ai/agents/orchestrator.md` - Orchestrator Agent (uses this protocol)
- `ai/protocols/error_recovery.md` - Detailed error recovery protocols
- `ai/protocols/execution_log.md` - Execution logging format

---

**Last Updated:** 2024
