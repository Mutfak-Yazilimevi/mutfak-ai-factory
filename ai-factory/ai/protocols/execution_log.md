# Agent Execution Log Protocol

## Purpose
Track what each agent does during sprint execution for debugging, auditing, and recovery.

## Log Location
Each agent creates/updates: `/runs/<SPRINT_ID>/logs/<AGENT_NAME>-execution.log`

## Log Format

```
TIMESTAMP: <ISO 8601 format>
AGENT: <AGENT_NAME>
PHASE: <INITIALIZATION | PLANNING | EXECUTION | REVIEW | DOCUMENTATION>
ACTION: <ACTION_TYPE>
STATUS: <SUCCESS | FAILURE | WARNING>

INPUTS_READ:
- <file_path>
- <file_path>

OUTPUTS_CREATED:
- <file_path>
- <file_path>

OUTPUTS_UPDATED:
- <file_path>
- <file_path>

DECISIONS:
- <Decision made>
- <Reason for decision>

ERRORS:
- <Error description> (if any)

NOTES:
- <Additional notes>
```

## Action Types

- **READ** - Agent read a file
- **CREATE** - Agent created a new file
- **UPDATE** - Agent updated an existing file
- **VALIDATE** - Agent validated something
- **DECIDE** - Agent made a decision
- **BLOCK** - Agent blocked a task
- **COMPLETE** - Agent completed its work

## Agent Responsibilities

### Product Agent
- Log sprint initialization steps
- Log document reading
- Log product.md creation
- Log .cursorrules creation
- Log ai-factory/docs/ file creation

### Architect Agent
- Log architecture.md creation
- Log api/contract.md creation
- Log technical decisions

### Planner Agent
- Log task creation
- Log dependency assignment
- Log task file locations

### Lead Dev Agent
- Log plan review decisions
- Log execution review decisions
- Log dependency engine operations
- Log blocker resolutions

### Developer Agents (Backend/Designer/Database/Frontend/React Native/Test Dev/Security/OPS/AI_ML)
- Log task selection
- Log task execution start
- Log file creation/modification
- Log task completion
- Log blocking reasons (if any)

### Designer Agent
- Log design system creation
- Log component spec creation
- Log design token generation
- Log style guide creation

### Database Agent
- Log schema creation
- Log migration creation
- Log index creation
- Log data seeding

### Test Dev Agent
- Log test file creation
- Log test coverage
- Log test execution results

### Security Agent
- Log security configuration
- Log security audit results
- Log vulnerability assessments
- **IMPORTANT:** Do NOT log sensitive information (secrets, passwords, tokens)

### QA Agent
- Log verification start
- Log test results
- Log pass/fail status
- Log blocking issues

### Docs Agent
- Log documentation creation
- Log sprint_report.md generation

### Orchestrator Agent
- Log orchestration start/completion
- Log mode switches (Planning → Execution → Quality → Documentation)
- Log task assignments to agents
- Log agent execution commands
- Log task completion detection
- Log dependency engine triggers
- Log dashboard updates
- Log error detection and handling
- Log orchestration stops/resumes
- Log sprint completion

**Special Note:** Orchestrator Agent logs are critical for understanding the entire sprint flow. They should include:
- Which agents were executed
- When agents were executed
- Task assignment details
- Error handling actions
- Dashboard update triggers

## Log Rotation
- Keep logs for completed sprints
- Archive old logs to `/runs/<SPRINT_ID>/logs/archive/`
- Maximum log file size: 1MB (split if needed)

## Usage in Recovery
When recovering from errors:
1. Read execution logs to understand what was done
2. Identify last successful action
3. Resume from that point

## Example Log Entry

```
TIMESTAMP: 2024-01-15T10:30:45Z
AGENT: BACKEND
PHASE: EXECUTION
ACTION: COMPLETE
STATUS: SUCCESS

INPUTS_READ:
- /ai/project.scope.md
- /runs/001/architecture.md
- /runs/001/api/contract.md
- /runs/001/tasks/backend/task-001.md

OUTPUTS_CREATED:
- /src/Domain/Entities/User.cs
- /src/Application/Commands/CreateUser.cs

OUTPUTS_UPDATED:
- /runs/001/tasks/backend/task-001.md (STATUS: DONE, COMPLETION section added)

DECISIONS:
- Used Entity Framework Core for data access (as per architecture.md)
- Implemented CQRS pattern for command handling

ERRORS:
- None

NOTES:
- Task completed successfully
- All acceptance criteria met
```
