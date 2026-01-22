# Orchestrator Agent Guide

Complete guide to using the Orchestrator Agent for autonomous sprint execution.

---

## 🎯 What is Orchestrator Agent?

The Orchestrator Agent is the **central coordinator** of the AI Factory system. It automatically manages the entire sprint lifecycle from planning to completion, coordinating all other agents and handling task assignment.

**Key Features:**
- ✅ Fully autonomous sprint execution
- ✅ Automatic task assignment
- ✅ Real-time dashboard updates
- ✅ Automatic error handling
- ✅ Dependency engine management
- ✅ Parallel execution coordination
- ✅ Full Project Planning mode support
- ✅ Automatic SPRINT_PLAN.md tracking

---

## 🚀 Quick Start

### Start Orchestration

```
Read ai-factory/ai/agents/orchestrator.md and execute.

Start orchestration for a new sprint. I've placed my documents in the root /docs/ folder.
```

**Orchestrator will automatically:**
1. Run Product Agent (sprint initialization)
2. Run Architect Agent
3. Run Planner Agent
4. Run Lead Dev Agent (Plan Review)
5. Execute all production tasks (automatic assignment)
6. Run QA Agent
7. Run Docs Agent
8. Update dashboard continuously

---

## 📊 Orchestration Modes

### 1. PLANNING MODE
**When:** Sprint initialization and planning

**Planning Mode Detection:**
- Orchestrator reads `/runs/SPRINT_PLAN.md` to determine planning mode
- **If PLANNING_MODE: FULL_PROJECT:**
  - All sprints are already planned (Product, Architect, Planner already completed)
  - Skip planning phase, go directly to Execution Mode
  - Only execute current sprint (CURRENT_SPRINT from SPRINT_PLAN.md)
- **If PLANNING_MODE: ITERATIVE:**
  - Execute planning agents for current sprint only

**Agents executed (ITERATIVE mode only):**
1. Product Agent → Creates sprint, product.md
2. Architect Agent → Creates architecture.md, api/contract.md
3. Planner Agent → Creates tasks/
4. Lead Dev Agent (Plan Review) → Reviews task structure

**Execution:** Sequential (one after another)

**SPRINT_PLAN.md Updates:**
- When sprint starts: Updates STATUS to IN_PROGRESS
- When sprint completes: Updates STATUS to COMPLETE
- If FULL_PROJECT mode: Updates CURRENT_SPRINT to next sprint

### 2. EXECUTION MODE
**When:** Production phase (tasks being executed)

**Agents coordinated:**
- Technology-specific backend agents (.NET Core, Java, Python, Node.js, Go, Rust)
- Framework-specific frontend agents (Angular, React, Vue, Next.js, Svelte)
- Mobile agents (React Native, Flutter, iOS, Android)
- Other agents (Designer, Database, Test Dev, Security, OPS, AI/ML)
- Custom agents (if any)

**Execution:** Parallel (different ROLEs can work simultaneously)

### 3. QUALITY MODE
**When:** All production tasks are DONE

**Agents executed:**
- QA Agent → Verifies acceptance criteria

### 4. DOCUMENTATION MODE
**When:** QA PASSED

**Agents executed:**
- Docs Agent → Creates documentation

---

## 🎛️ Task Assignment

### How Orchestrator Assigns Tasks

1. **Scans all task directories** (based on project.scope.md)
2. **Finds READY tasks:**
   - STATUS: TODO
   - All dependencies have STATUS: DONE
   - No blockers
3. **Groups by ROLE**
4. **Assigns to appropriate agent:**
   - Technology-specific agents for backend/frontend
   - Role-specific agents for other tasks
5. **Marks task STATUS: IN_PROGRESS**
6. **Monitors execution**
7. **Updates dependencies when task DONE**

### Parallel Execution Rules

- ✅ **Different ROLEs:** Can run in parallel
  - Example: .NET Core Developer and Angular Developer can work simultaneously
  - Example: Java Developer and React Developer can work simultaneously
- ❌ **Same ROLE:** Sequential execution (one task at a time per ROLE)
  - Example: .NET Core Developer works on one task at a time
  - Example: Angular Developer works on one task at a time

---

## 📈 Dashboard

### Dashboard Location
`/runs/<SPRINT_ID>/dashboard.md`

### Dashboard Contents
- Sprint status and progress
- Task breakdown by status
- Agent activity
- READY tasks list
- Blocked tasks
- Dependencies graph
- Git status (if ACTIVE)
- Recent activity log

### Dashboard Updates
- Automatically updated by Orchestrator
- Updated continuously during execution
- Check every few minutes for progress

### View Dashboard
```
Read ai-factory/runs/<SPRINT_ID>/dashboard.md
```

---

## 🔄 Orchestration Workflow

### Complete Sprint Lifecycle

1. **Planning Phase:**
   - Product Agent → Sprint initialization
   - Architect Agent → Architecture decisions
   - Planner Agent → Task creation
   - Lead Dev Agent → Plan review

2. **Execution Phase (Loop):**
   - Scan for READY tasks
   - Assign to appropriate agents
   - Monitor execution
   - Update dependencies
   - Update dashboard
   - Repeat until all tasks DONE

3. **Quality Phase:**
   - QA Agent → Verification

4. **Documentation Phase:**
   - Docs Agent → Documentation

---

## 🛠️ Common Operations

### Check Sprint Status
```
Read ai-factory/ai/agents/orchestrator.md and check dashboard.

Please provide current sprint status and highlight any blockers.
```

### Resume After Manual Fix
```
Read ai-factory/ai/agents/orchestrator.md and resume orchestration.

A manual fix has been applied to task <TASK_ID>. Please verify and resume.
```

### Handle Complex Error
```
Read ai-factory/ai/agents/orchestrator.md and handle error.

Error detected: <Error Type>
Task: <TASK_ID>
Reason: <Blocked Reason>
```

### Stop Orchestration
Orchestrator will automatically stop for:
- Complex errors requiring manual intervention
- All tasks completed
- QA failed with blocking issues

---

## ⚠️ Error Handling

### Simple Errors
- Orchestrator handles automatically
- Retries up to max attempts
- Logs retry attempts

### Complex Errors
- Orchestrator stops and reports
- Marks affected tasks as BLOCKED
- Waits for manual intervention
- Resume after fix

### Error Recovery
1. Check execution log: `/runs/<SPRINT_ID>/logs/orchestrator-execution.log`
2. Review error details in dashboard
3. Fix issue manually
4. Resume orchestration

---

## 📋 Best Practices

### Before Starting
- ✅ Verify `project.scope.md` is correctly configured
- ✅ Ensure root `/docs/` folder has all required documents
- ✅ Check that previous sprints (if any) are complete
- ✅ Verify Git settings (if GIT: ACTIVE)

### During Orchestration
- ✅ Monitor dashboard regularly
- ✅ Check execution logs for issues
- ✅ Be ready for manual intervention if needed
- ❌ Don't interrupt Orchestrator unless necessary

### Task Assignment
- ✅ Trust Orchestrator's assignment logic
- ✅ Only intervene for complex errors
- ✅ Monitor dashboard for progress
- ✅ Review execution logs if issues arise

---

## 🔍 Monitoring

### Execution Logs
Location: `/runs/<SPRINT_ID>/logs/orchestrator-execution.log`

**Log entries include:**
- Agent execution start/end
- Task assignments
- Dependency updates
- Error occurrences
- Dashboard updates

### Dashboard Monitoring
Check dashboard for:
- Progress percentage
- Blocked tasks
- Agent activity
- Recent activity log

---

## 🎯 When to Use Orchestrator

### ✅ Use Orchestrator When:
- You want fully autonomous sprint execution
- You want automatic task assignment
- You want real-time dashboard updates
- You want automatic error handling
- You want to minimize manual intervention

### ❌ Use Manual Execution When:
- You want more control over agent execution
- You want to review each agent's output before proceeding
- You're debugging specific issues
- You want to customize agent execution order

---

## 📚 Related Documents

- `ai/agents/orchestrator.md` - Full Orchestrator Agent documentation
- `ai/protocols/dashboard.md` - Dashboard protocol
- `ai/protocols/hybrid_error_handling.md` - Error handling protocol
- `guides/QUICK_START.md` - Quick start guide
- `guides/BEST_PRACTICES.md` - Best practices including Orchestrator

---

## 💡 Tips

1. **Let Orchestrator run:** Don't interrupt unless necessary
2. **Monitor, don't micromanage:** Trust Orchestrator's decisions
3. **Check logs for details:** Execution logs provide detailed information
4. **Use dashboard for overview:** Dashboard gives high-level status
5. **Intervene only when needed:** Manual intervention only for complex errors

---

**Last Updated:** 2024
