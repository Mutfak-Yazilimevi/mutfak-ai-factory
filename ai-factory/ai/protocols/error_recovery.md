# Error Recovery Protocols

## Purpose
Detailed protocols for recovering from various error scenarios during sprint execution.

---

## 🚨 Agent Crash Recovery

### Scenario: Agent crashes or is interrupted mid-execution

**Symptoms:**
- Task STATUS: IN_PROGRESS but no recent activity
- Execution log shows incomplete action
- Files partially created

**Recovery Steps:**

1. **Check Execution Log:**
   - Read `/runs/<SPRINT_ID>/logs/<AGENT_NAME>-execution.log`
   - Identify last successful action
   - Note any incomplete actions

2. **Assess Damage:**
   - Check for partially created files
   - Verify file integrity
   - Check task file status

3. **Cleanup (if needed):**
   - Remove incomplete/partial files
   - Revert task STATUS to TODO (if safe)
   - Document what was lost

4. **Resume:**
   - Re-run agent with same SPRINT_ID
   - Agent should detect IN_PROGRESS task and resume
   - If agent doesn't resume automatically, manually set STATUS: TODO

5. **Verify:**
   - Check execution log for successful completion
   - Verify all expected outputs created
   - Mark task DONE if complete

---

## 📁 File Corruption Recovery

### Scenario: Critical file is corrupted or invalid

**Symptoms:**
- File exists but content is malformed
- Agent cannot parse file
- File structure doesn't match expected format

**Recovery Steps:**

1. **Identify Corrupted File:**
   - Check agent error messages
   - Review execution logs
   - Verify file content manually

2. **Backup:**
   - Copy corrupted file to `/runs/<SPRINT_ID>/backups/`
   - Rename with timestamp: `filename.corrupted.YYYYMMDD-HHMMSS.md`

3. **Restore Options:**

   **Option A: Restore from Git (if available)**
   - Check git history
   - Restore last known good version
   - Verify file integrity

   **Option B: Recreate from Source**
   - Identify which agent created the file
   - Re-run that agent to recreate file
   - Verify new file matches expected format

   **Option C: Manual Fix**
   - If file is partially valid, manually fix corruption
   - Verify format against template
   - Test file can be read by dependent agents

4. **Verify:**
   - Re-run dependent agents
   - Check execution logs
   - Verify sprint can continue

---

## 🔄 Circular Dependency Recovery

### Scenario: Circular dependencies detected in task graph

**Symptoms:**
- Task A depends on Task B
- Task B depends on Task A
- System cannot determine execution order
- Lead Dev detects during Plan Review

**Recovery Steps:**

1. **Identify Circular Chain:**
   - Lead Dev analyzes dependency graph
   - Document full circular path: A → B → C → A
   - Identify all tasks in cycle

2. **Break the Cycle:**
   - Identify least critical dependency
   - Remove or modify that dependency
   - Verify cycle is broken

3. **Update Tasks:**
   - Planner updates affected task files
   - Remove circular dependency
   - Add alternative dependency if needed
   - Verify new dependency structure is valid

4. **Re-validate:**
   - Lead Dev re-runs Plan Review
   - Verify no circular dependencies remain
   - Check all tasks have valid execution path

5. **Document:**
   - Add note to task files explaining change
   - Update architecture.md if architectural change needed

---

## 💥 Agent Produces Wrong Output

### Scenario: Agent creates files in wrong location or wrong format

**Symptoms:**
- Files created in wrong directory
- File format doesn't match template
- Wrong content in files

**Recovery Steps:**

1. **Identify Wrong Output:**
   - Check agent's OUTPUT section in task file
   - Compare actual output to expected output
   - Review execution log for decisions made

2. **Stop Further Execution:**
   - Mark affected tasks as BLOCKED
   - Add BLOCKED_REASON explaining issue
   - Prevent dependent tasks from starting

3. **Fix Output:**

   **Option A: Move Files**
   - If files in wrong location, move to correct location
   - Update task OUTPUT section
   - Verify file paths are correct

   **Option B: Recreate Files**
   - Delete wrong files
   - Re-run agent with correct context
   - Verify agent reads all required inputs

   **Option C: Fix Content**
   - If format wrong, manually fix format
   - Verify against template
   - Update task COMPLETION section

4. **Verify:**
   - Check file location and format
   - Re-run dependent agents
   - Verify sprint can continue

5. **Root Cause Analysis:**
   - Review why agent made wrong decision
   - Check if inputs were correct
   - Update agent.md if needed (for future sprints)

---

## 🔀 Sprint ID Confusion Recovery

### Scenario: Working on wrong sprint or SPRINT_ID mismatch

**Symptoms:**
- Files created in wrong sprint folder
- Agent reads wrong sprint's files
- SPRINT_ID in files doesn't match folder name

**Recovery Steps:**

1. **Identify Mismatch:**
   - Check current working directory
   - Verify SPRINT_ID in files vs folder name
   - Review execution logs for SPRINT_ID used

2. **Assess Impact:**
   - List all files created in wrong location
   - Check if wrong sprint's files were modified
   - Determine scope of confusion

3. **Fix Files:**

   **Option A: Move Files**
   - Move files to correct sprint folder
   - Update SPRINT_ID references in file content
   - Verify all paths are correct

   **Option B: Recreate in Correct Sprint**
   - Delete files from wrong sprint
   - Re-run agent with correct SPRINT_ID
   - Verify files created in correct location

4. **Verify Sprint Integrity:**
   - Check correct sprint folder structure
   - Verify all files have matching SPRINT_ID
   - Re-run validation script

5. **Prevent Future Issues:**
   - Always specify SPRINT_ID explicitly in prompts
   - Verify SPRINT_ID before running agents
   - Use full paths in agent instructions

---

## 🚫 Missing Dependency Recovery

### Scenario: Task marked DONE but dependency is missing or invalid

**Symptoms:**
- Task depends on non-existent TASK_ID
- Dependent task references deleted task
- Dependency file doesn't exist

**Recovery Steps:**

1. **Identify Missing Dependency:**
   - Check task DEPENDENCIES section
   - Verify all TASK_IDs exist
   - Check if dependency files exist

2. **Resolve Missing Dependency:**

   **Option A: Dependency Task Exists but Wrong ID**
   - Find actual task file
   - Update DEPENDENCIES section with correct TASK_ID
   - Verify dependency is DONE

   **Option B: Dependency Task Was Deleted**
   - Check if task was intentionally removed
   - If removed, remove dependency from task
   - If needed, recreate dependency task

   **Option C: Dependency Never Created**
   - Planner should have created it
   - Create missing dependency task
   - Or remove dependency if not needed

3. **Update Task:**
   - Fix DEPENDENCIES section
   - Verify task can now proceed
   - Re-check READY condition

4. **Verify:**
   - Re-run Dependency Engine
   - Check task becomes READY
   - Verify sprint can continue

---

## 📊 Data Loss Recovery

### Scenario: Sprint files accidentally deleted or lost

**Symptoms:**
- Sprint folder missing
- Task files deleted
- Critical outputs lost

**Recovery Steps:**

1. **Assess Loss:**
   - Identify what files are missing
   - Check git history (if available)
   - Review execution logs for what was created

2. **Restore from Backup:**
   - Check `/runs/<SPRINT_ID>/backups/` if exists
   - Restore from git if version controlled
   - Restore from system backup if available

3. **Recreate Lost Files:**
   - Re-run agents to recreate outputs
   - Start from Product Agent if sprint folder missing
   - Follow START_SPRINT.md flow

4. **Verify Integrity:**
   - Run validation script
   - Check all files exist
   - Verify sprint can continue

---

## 🎼 Orchestrator Crash Recovery

### Scenario: Orchestrator Agent crashes or is interrupted

**Symptoms:**
- Orchestrator execution log shows incomplete entry
- Dashboard not updated recently
- Tasks IN_PROGRESS but no new assignments
- No orchestration activity

**Recovery Steps:**

1. **Check Orchestrator State:**
   - Read `/runs/<SPRINT_ID>/logs/orchestrator-execution.log`
   - Find last log entry
   - Determine last mode (PLANNING | EXECUTION | QUALITY | DOCUMENTATION)
   - Determine last action

2. **Assess Current Sprint State:**
   - Read dashboard.md (if exists)
   - Scan all task files to count:
     - DONE tasks
     - IN_PROGRESS tasks
     - BLOCKED tasks
     - READY tasks (TODO + all dependencies DONE)

3. **Determine Resume Point:**
   - **If last mode was PLANNING:**
     - Check which planning agents completed (product.md, architecture.md, tasks/ exist?)
     - Resume from next planning agent
   - **If last mode was EXECUTION:**
     - Check IN_PROGRESS tasks - are agents still working?
     - Wait for IN_PROGRESS tasks to complete (or timeout)
     - Resume task assignment loop
   - **If last mode was QUALITY:**
     - Check if qa.md exists
     - Resume QA Agent if needed
   - **If last mode was DOCUMENTATION:**
     - Check if docs/ folder and sprint_report.md exist
     - Resume Docs Agent if needed

4. **Resume Orchestration:**
   - Run Orchestrator Agent:
     ```
     Read ai-factory/ai/agents/orchestrator.md and resume orchestration.
     ```
   - Orchestrator will detect state and resume from appropriate point

5. **Verify:**
   - Check execution log for resume entry
   - Verify orchestration continues correctly
   - Monitor dashboard for updates

---

## 🔧 General Recovery Principles

1. **Always Backup Before Fixing:**
   - Copy affected files to backups/
   - Document current state
   - Note what needs to be fixed

2. **Identify Root Cause:**
   - Don't just fix symptoms
   - Understand why error occurred
   - Prevent recurrence

3. **Verify After Fix:**
   - Re-run validation
   - Check execution logs
   - Verify sprint can continue

4. **Document Recovery:**
   - Add notes to affected files
   - Update execution logs
   - Document lessons learned

5. **Prevent Future Issues:**
   - Update protocols if needed
   - Improve agent instructions
   - Add validation checks

---

## 🆘 When to Escalate

Escalate to manual intervention when:
- Multiple errors occur simultaneously
- Recovery steps fail repeatedly
- System integrity is compromised
- Data loss is extensive
- Circular dependencies cannot be resolved
- Orchestrator crashes repeatedly

In these cases:
1. Stop all agent execution
2. Document current state
3. Manually assess and fix
4. Resume from stable point
