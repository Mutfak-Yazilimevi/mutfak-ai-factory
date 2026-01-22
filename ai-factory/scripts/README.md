# Scripts Directory

Utility scripts for the AI Software Factory system.

## Available Scripts

### Validation Scripts

#### `validate_sprint.sh` / `validate_sprint.ps1`
Validates sprint readiness before starting.

**Usage:**
```bash
# Linux/Mac
./scripts/validate_sprint.sh <SPRINT_ID>

# Windows PowerShell
.\scripts\validate_sprint.ps1 -SprintId <SPRINT_ID>
```

**What it checks:**
- Required files exist (project.scope.md, agent files, protocol files)
- Root docs/ folder has content
- project.scope.md NAME is not placeholder (warning)
- Sprint folder doesn't already exist (warning)

**Output:**
- ✅ Pass: All checks passed
- ⚠️ Pass with warnings: Issues found but non-blocking
- ❌ Fail: Critical errors found

---

### Status Dashboard Scripts

#### `sprint_status.sh` / `sprint_status.ps1`
Generates a visual status report for a sprint.

**Usage:**
```bash
# Linux/Mac
./scripts/sprint_status.sh <SPRINT_ID>

# Windows PowerShell
.\scripts\sprint_status.ps1 -SprintId <SPRINT_ID>
```

**What it shows:**
- Overall progress (task counts by status, progress bar)
- Sprint files status (which key files exist)
- Blockers (tasks marked BLOCKED with reasons)
- Next steps (READY tasks that can be executed)

**Output:**
Visual dashboard showing:
- Task status breakdown
- Progress percentage
- Missing files
- Blockers
- Ready tasks

---

## Script Requirements

### Linux/Mac (Bash)
- Bash shell
- Standard Unix utilities (grep, find, etc.)
- Execute permission: `chmod +x scripts/*.sh`

### Windows (PowerShell)
- PowerShell 5.1 or later
- No additional requirements

---

## Usage Examples

### Before Starting Sprint
```bash
# Validate sprint readiness
./scripts/validate_sprint.sh 001
```

### During Sprint Execution
```bash
# Check sprint status
./scripts/sprint_status.sh 001
```

### Regular Monitoring
```bash
# Check status of all active sprints
for sprint in 001 002 003; do
    ./scripts/sprint_status.sh $sprint
done
```

---

## Integration with Agents

These scripts are **optional utilities** - agents work without them. They provide:
- **Pre-flight checks:** Validate before starting
- **Status visibility:** Quick status overview
- **Debugging aid:** Identify issues quickly

Agents can be run manually or these scripts can be used to verify system state.

---

## Future Scripts

Potential future additions:
- `create_sprint.sh` - Automated sprint creation
- `archive_sprint.sh` - Archive completed sprints
- `dependency_graph.sh` - Visualize task dependencies
- `active_sprints.sh` - List all active sprints
