# Backward Compatibility Protocol

## PURPOSE
This protocol defines how the system handles backward compatibility when transitioning from legacy stack definitions to the new vertical agent structure.

---

## LEGACY TO NEW MAPPING

### Backend Mapping

**Legacy Format:**
```yaml
STACK:
  API: ACTIVE
```

**New Format:**
```yaml
STACK:
  BACKEND:
    DOTNET_CORE: ACTIVE
```

**Mapping Rule:**
- `API: ACTIVE` → `BACKEND.DOTNET_CORE: ACTIVE`
- `API: NONE` → `BACKEND.DOTNET_CORE: NONE`
- If both `API: ACTIVE` and `BACKEND.DOTNET_CORE: ACTIVE` exist, `BACKEND.DOTNET_CORE` takes precedence

**Task Folder Mapping:**
- Legacy: `tasks/backend/` → New: `tasks/dotnet-core/`
- If both exist, use `tasks/dotnet-core/`

**Role Mapping:**
- Legacy ROLE: `BACKEND` → New ROLE: `DOTNET_CORE_DEVELOPER`
- Both are accepted, but `DOTNET_CORE_DEVELOPER` is preferred

---

### Frontend Mapping

**Legacy Format:**
```yaml
STACK:
  FRONTEND: ACTIVE
```

**New Format:**
```yaml
STACK:
  FRONTEND:
    ANGULAR: ACTIVE
```

**Mapping Rule:**
- `FRONTEND: ACTIVE` → `FRONTEND.ANGULAR: ACTIVE`
- `FRONTEND: NONE` → `FRONTEND.ANGULAR: NONE`
- If both `FRONTEND: ACTIVE` and `FRONTEND.ANGULAR: ACTIVE` exist, `FRONTEND.ANGULAR` takes precedence

**Task Folder Mapping:**
- Legacy: `tasks/frontend/` → New: `tasks/angular/`
- If both exist, use `tasks/angular/`

**Role Mapping:**
- Legacy ROLE: `FRONTEND` → New ROLE: `ANGULAR_DEVELOPER`
- Both are accepted, but `ANGULAR_DEVELOPER` is preferred

---

## AGENT DETECTION LOGIC

### Product Agent
When reading `project.scope.md`:

1. **Check for new format first:**
   - If `BACKEND.DOTNET_CORE: ACTIVE` exists → Use new format
   - If `FRONTEND.ANGULAR: ACTIVE` exists → Use new format

2. **Fallback to legacy format:**
   - If `API: ACTIVE` exists (and no BACKEND section) → Map to `BACKEND.DOTNET_CORE: ACTIVE`
   - If `FRONTEND: ACTIVE` exists (and no FRONTEND section) → Map to `FRONTEND.ANGULAR: ACTIVE`

3. **Update project.scope.md:**
   - If legacy format detected, suggest update to new format
   - Don't force update (backward compatibility)

### Planner Agent
When creating tasks:

1. **Check project.scope.md:**
   - If `BACKEND.DOTNET_CORE: ACTIVE` → Create `tasks/dotnet-core/` folder
   - If `API: ACTIVE` (legacy) → Create `tasks/backend/` folder (backward compatibility)
   - If both exist → Use `tasks/dotnet-core/` (new format takes precedence)

2. **Task ROLE assignment:**
   - If `BACKEND.DOTNET_CORE: ACTIVE` → Use ROLE: `DOTNET_CORE_DEVELOPER`
   - If `API: ACTIVE` (legacy) → Use ROLE: `BACKEND` (backward compatibility)

### Orchestrator Agent
When assigning tasks:

1. **Role to Agent mapping:**
   - `BACKEND` → .NET Core Developer Agent (legacy support)
   - `DOTNET_CORE_DEVELOPER` → .NET Core Developer Agent
   - `FRONTEND` → Angular Developer Agent (legacy support)
   - `ANGULAR_DEVELOPER` → Angular Developer Agent

2. **Task folder scanning:**
   - Scan both `tasks/backend/` and `tasks/dotnet-core/` (if both exist)
   - Scan both `tasks/frontend/` and `tasks/angular/` (if both exist)
   - Prefer new format folders

---

## MIGRATION RECOMMENDATION

**For new projects:**
- Use new vertical structure from the start
- Example:
  ```yaml
  STACK:
    BACKEND:
      DOTNET_CORE: ACTIVE
    FRONTEND:
      ANGULAR: ACTIVE
  ```

**For existing projects:**
- Legacy format continues to work
- Migration is optional
- Can migrate gradually

**Migration steps:**
1. Update `project.scope.md` to new format
2. Rename task folders (if needed)
3. Update task ROLE values (if needed)
4. System will handle both formats during transition

---

## EXAMPLES

### Example 1: Legacy Project (Backward Compatible)
```yaml
STACK:
  API: ACTIVE
  FRONTEND: ACTIVE
```
→ Maps to:
- `BACKEND.DOTNET_CORE: ACTIVE`
- `FRONTEND.ANGULAR: ACTIVE`
→ Creates:
- `tasks/backend/` (legacy)
- `tasks/frontend/` (legacy)
→ Uses:
- Backend Agent (legacy)
- Frontend Agent (legacy)

### Example 2: New Project (Vertical Structure)
```yaml
STACK:
  BACKEND:
    DOTNET_CORE: ACTIVE
    JAVA: ACTIVE
  FRONTEND:
    ANGULAR: ACTIVE
    REACT: ACTIVE
```
→ Creates:
- `tasks/dotnet-core/`
- `tasks/java/`
- `tasks/angular/`
- `tasks/react/`
→ Uses:
- .NET Core Developer Agent
- Java Developer Agent
- Angular Developer Agent
- React Developer Agent

### Example 3: Mixed (Transition Period)
```yaml
STACK:
  API: ACTIVE  # Legacy
  BACKEND:
    JAVA: ACTIVE  # New
  FRONTEND:
    REACT: ACTIVE  # New
```
→ Creates:
- `tasks/dotnet-core/` (from API: ACTIVE)
- `tasks/java/` (from BACKEND.JAVA: ACTIVE)
- `tasks/react/` (from FRONTEND.REACT: ACTIVE)
→ Uses:
- .NET Core Developer Agent (from API)
- Java Developer Agent
- React Developer Agent

---

## NOTES

- Backward compatibility is maintained for existing projects
- New projects should use vertical structure
- Migration is optional and can be done gradually
- System supports both formats simultaneously during transition
