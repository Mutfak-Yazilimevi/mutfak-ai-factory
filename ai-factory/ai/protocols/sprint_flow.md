SPRINT FLOW ORDER (MANDATORY):

**Option 1: Manual Execution (Traditional)**
1. Product Agent → product.md
2. Architect Agent → architecture.md + api/contract.md
3. Planner Agent → tasks/
4. Lead Dev Agent → Plan Review
5. Production Agents → Execute tasks
6. Dependency Engine → Status transitions (DONE → READY)
7. QA Agent → Verification
8. Docs Agent → Documentation

**Option 2: Orchestrated Execution (Autonomous)**
1. Orchestrator Agent → Coordinates entire sprint
   - Executes agents in correct order
   - Assigns tasks automatically
   - Monitors execution
   - Handles errors
   - Updates dashboard
   - Manages dependency engine

Skipping steps is NOT allowed.
If an input file is missing, execution MUST stop.

**Note:** Orchestrator Agent can be used for fully autonomous sprint execution, or agents can be run manually for more control.

---

## SPRINT COMPLETION CRITERIA

A sprint is considered COMPLETE when ALL of the following are true:

1. **All Tasks Complete:**
   - All tasks have STATUS: DONE
   - No tasks with STATUS: TODO, IN_PROGRESS, or BLOCKED (unless explicitly deferred)

2. **QA Verification Passed:**
   - `/runs/<SPRINT_ID>/qa.md` exists
   - QA STATUS: PASSED
   - No blocking issues listed

3. **Documentation Complete:**
   - `/runs/<SPRINT_ID>/docs/` directory exists
   - All required documentation files created
   - `/runs/<SPRINT_ID>/sprint_report.md` generated

4. **Lead Dev Review Complete:**
   - All DONE tasks reviewed
   - No CHANGES_REQUIRED reviews pending

**If any criterion is not met, sprint is NOT complete.**
