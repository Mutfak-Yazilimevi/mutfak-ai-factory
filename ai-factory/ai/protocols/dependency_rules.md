DEPENDENCY MODEL:
- Dependencies are explicit
- No circular dependencies allowed
- STATUS is the single source of truth

DEPENDENCY ENGINE RULES:

1. Logical Transitions (Automatic):
   - When a task is marked DONE, dependent tasks are evaluated
   - If all dependencies are DONE, task becomes READY (condition, not status)
   - READY means: STATUS is TODO AND all dependencies are DONE
   - This is a logical rule, not a manual step

2. Centralized Orchestration:
   - Dependency Engine is overseen by Lead Dev
   - Status transitions are managed centrally
   - Today: Lead Dev + prompt discipline
   - Future: Script / CI / Agent runner

3. Manual Interventions:
   - BLOCKED → TODO requires manual intervention (Planner or Lead Dev)
   - Developer agents NEVER resolve dependencies themselves
   - Only Lead Dev or Planner can unblock tasks

4. Execution Rules:
   - Agents only work on READY tasks (STATUS: TODO with all dependencies DONE)
   - **CRITICAL:** A task is READY ONLY if:
     - STATUS is TODO
     - ALL dependencies have STATUS: DONE (not BLOCKED, not IN_PROGRESS, not TODO)
     - If ANY dependency is BLOCKED → Task cannot be READY (must wait for dependency to be unblocked)
     - If ANY dependency is IN_PROGRESS → Task cannot be READY (must wait for dependency to complete)
   - When agent picks a READY task, it changes STATUS: TODO → IN_PROGRESS
   - Agents mark tasks DONE when complete
   - Dependency Engine handles the rest
