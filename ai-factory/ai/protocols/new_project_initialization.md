# NEW PROJECT INITIALIZATION PROTOCOL

PURPOSE:
This protocol defines the steps required to start a NEW project from scratch.
It ensures a clean workspace by cleaning old project artifacts and preparing for a fresh start.

EXECUTED BY: User (Customer) + Product Agent (automated parts)

---

## SCENARIO: Starting a New Project

When starting a NEW project, you need to:
1. Clean old project artifacts (code, docs, sprints)
2. Reset project configuration
3. Prepare workspace for new project
4. Initialize new project structure

---

## STEP 1: PRE-INITIALIZATION CHECKLIST (User Action)

Before starting a new project, verify:

1. **Backup Current Project (if needed):**
   - If you want to keep old project data, backup:
     - `runs/` folder (all sprint folders)
     - `src/` folder (all source code)
     - Root `/docs/` folder (project documents)
     - `ai-factory/docs/` folder (intent layer documents)
   - Create a backup folder: `backup-<old-project-name>-<date>/`

2. **Verify New Project Documents:**
   - Prepare new project documents for root `/docs/` folder
   - Ensure new project requirements are clear

---

## STEP 2: CLEANUP OLD PROJECT ARTIFACTS (User Action)

### 2.1. Clean Source Code (`src/` folder)

**Action:** Delete or move all content in `src/` folder

**What to clean:**
- `src/api/` - Old backend code
- `src/web/` - Old frontend code (if exists)
- `src/mobile/` - Old React Native code (if exists)
- `src/design/` - Old design files (if exists)
- All other project-specific folders in `src/`

**Method:**
- Option A: Delete entire `src/` folder and recreate empty folder
- Option B: Move `src/` to backup folder

**Note:** `src/` folder structure will be recreated by agents during new project execution.

### 2.2. Clean Root Documentation (`/docs/` folder)

**Action:** Replace old project documents with new project documents

**What to clean:**
- All `.md` files in root `/docs/` folder (Architecture.md, Database.md, Lojikakis.md, etc.)
- All other project-specific documents

**Method:**
- Delete old documents
- Add new project documents to `/docs/` folder

**Note:** Product Agent reads these documents to understand new project requirements.

### 2.3. Clean Intent Layer Documents (`ai-factory/docs/` folder)

**Action:** Update or replace intent layer documents

**What to clean/update:**
- `ai-factory/docs/vision.md` - Project vision
- `ai-factory/docs/features.md` - Feature specifications
- `ai-factory/docs/user_flows.md` - User flows
- `ai-factory/docs/assumptions.md` - Project assumptions
- `ai-factory/docs/constraints.md` - Project constraints

**Method:**
- Option A: Delete old files and create new ones
- Option B: Update existing files with new project information

**Note:** Product Agent can auto-generate these from root `/docs/` folder, but manual updates are also valid.

### 2.4. Clean Sprint Runs (`ai-factory/runs/` folder)

**Action:** Archive or delete old sprint folders

**What to clean:**
- All sprint folders: `runs/001/`, `runs/002/`, etc.
- Sprint execution logs: `runs/<SPRINT_ID>/logs/`
- Sprint documentation: `runs/<SPRINT_ID>/docs/`
- Sprint tasks: `runs/<SPRINT_ID>/tasks/`

**Method:**
- Option A: Archive old sprints to `runs/archive/` folder
- Option B: Delete old sprint folders (if not needed)
- Option C: Move to backup folder

**Note:** `runs/features/` folder can be kept or cleaned based on preference.

### 2.5. Clean Feature Management (`ai-factory/runs/features/` folder)

**Action:** Clean old feature requests (optional)

**What to clean:**
- `runs/features/requests/` - Old feature request files (proje-specific)
- `runs/features/backlog.md` - Old feature backlog (proje-specific)

**Method:**
- Option A: Archive to `runs/features/archive/`
- Option B: Delete if not needed
- Option C: Keep if features are still relevant

**Note:** 
- Feature management is optional and can be kept if features are still relevant
- Template dosyalar (`ai/features/`) temizlenmemeli - bunlar sistem dosyalarıdır
- Yeni projeye başlarken `runs/features/backlog.md` dosyasını `ai/features/backlog-template.md`'den kopyalayarak oluşturabilirsiniz

### 2.6. Clean Project Configuration (`ai-factory/ai/project.scope.md`)

**Action:** Reset project configuration for new project

**What to update:**
- `PROJECT: NAME` - New project name
- `STACK:` section - Active stacks for new project
- `CUSTOM_AGENTS:` section - Custom agents for new project
- `RULES:` section - Project-specific rules (keep generic rules, update project-specific ones)
- `SPRINT_MANAGEMENT:` section - Can keep or update
- `GIT:` section - Can keep or update

**Method:**
- Option A: Manual update by user
- Option B: Let Product Agent update based on root `/docs/` folder (recommended)

**Note:** Product Agent can read root `/docs/` folder and suggest updates to `project.scope.md`.

### 2.7. Clean Root `.cursorrules` File (if exists)

**Action:** Update or delete root `.cursorrules` file

**What to clean:**
- Root `.cursorrules` file (project-specific AI rules)

**Method:**
- Option A: Delete old `.cursorrules` file (Product Agent will create new one)
- Option B: Update with new project rules

**Note:** Product Agent creates a new `.cursorrules` file based on new project information.

---

## STEP 3: NEW PROJECT INITIALIZATION (Product Agent - Automated)

After cleanup, Product Agent automatically initializes new project:

### 3.1. Read New Project Documents

**Product Agent reads:**
- Root `/docs/` folder (Architecture.md, Database.md, etc.)
- `ai-factory/docs/` folder (if exists - intent layer)

### 3.2. Update project.scope.md

**Product Agent:**
- Reads root `/docs/` folder
- Analyzes project requirements
- Suggests updates to `project.scope.md`:
  - PROJECT: NAME
  - STACK: (which stacks are needed)
  - CUSTOM_AGENTS: (if any custom agents needed)
  - RULES: (project-specific rules)

**User Review:**
- User reviews suggested updates
- User approves or modifies `project.scope.md`

### 3.3. Create/Update Intent Layer Documents

**Product Agent:**
- Creates/updates `ai-factory/docs/vision.md`
- Creates/updates `ai-factory/docs/features.md`
- Creates/updates `ai-factory/docs/user_flows.md`
- Creates/updates `ai-factory/docs/assumptions.md`
- Creates/updates `ai-factory/docs/constraints.md`

**Based on:**
- Root `/docs/` folder content
- Project requirements analysis

### 3.4. Create Root `.cursorrules` File

**Product Agent:**
- Creates root `.cursorrules` file
- Includes project-specific AI rules
- Includes coding standards
- Includes architectural guidelines

**Based on:**
- `project.scope.md` configuration
- Root `/docs/` folder content
- Technology stack information

### 3.5. Full Project Planning (NEW - Default Mode)

**Product Agent:**
- **Reads `/ai/protocols/full_project_planning.md` for full project planning process**
- Analyzes ALL project requirements from root `/docs/` folder
- Plans ALL sprints upfront (not just first sprint)
- Creates `/runs/SPRINT_PLAN.md` with complete sprint breakdown
- For EACH planned sprint:
  - Determines SPRINT_ID (001, 002, 003, ...)
  - Creates `runs/<SPRINT_ID>/` folder structure
  - Creates `runs/<SPRINT_ID>/sprint.md`
  - Creates `runs/<SPRINT_ID>/product.md`
  - Initializes sprint workspace

**After Product Agent completes:**
- Architect Agent creates architecture.md for ALL sprints
- Planner Agent creates tasks/ for ALL sprints
- Only then: Development starts with Sprint 001

**Note:** This ensures complete project visibility before code development begins.

### 3.6. Traditional Mode (Optional - One Sprint at a Time)

**If customer prefers iterative planning:**
- Product Agent creates only first sprint (001)
- Remaining features go to backlog
- Future sprints planned as they complete
- See traditional sprint flow in `sprint_flow.md`

---

## STEP 4: VERIFICATION (User Action)

After Product Agent initialization, verify:

1. **project.scope.md:**
   - PROJECT: NAME is correct
   - STACK: section has correct active stacks
   - RULES: section has correct project rules

2. **Intent Layer Documents:**
   - `ai-factory/docs/vision.md` exists and is correct
   - `ai-factory/docs/features.md` exists and is correct
   - Other intent layer documents are correct

3. **Root `.cursorrules`:**
   - File exists
   - Contains project-specific rules

4. **Sprint Planning (Full Project Planning Mode):**
   - `/runs/SPRINT_PLAN.md` exists and contains all planned sprints
   - All sprint folders exist (`runs/001/`, `runs/002/`, etc.)
   - All sprint.md files exist
   - All product.md files exist
   - Review sprint breakdown and dependencies

5. **Architecture Planning (After Architect Agent):**
   - All sprint architecture.md files exist
   - All sprint api/contract.md files exist (if needed)
   - Cross-sprint dependencies are documented

6. **Task Planning (After Planner Agent):**
   - All sprint tasks/ folders exist
   - All tasks are created
   - Dependencies are properly set

7. **Source Code:**
   - `src/` folder is empty (ready for new code)
   - Development can start only after all planning is complete

---

## CLEANUP CHECKLIST (Quick Reference)

Use this checklist when starting a new project:

- [ ] Backup old project (if needed)
- [ ] Clean `src/` folder (delete or move to backup)
- [ ] Replace root `/docs/` folder documents with new project documents
- [ ] Update `ai-factory/docs/` folder (or let Product Agent do it)
- [ ] Archive or delete old sprint folders in `runs/`
- [ ] Clean `runs/features/` folder (optional)
- [ ] Update `ai-factory/ai/project.scope.md` (or let Product Agent suggest updates)
- [ ] Delete or update root `.cursorrules` file (or let Product Agent create new one)
- [ ] Run Product Agent to initialize new project
- [ ] Verify all initialization steps completed correctly

---

## AUTOMATED CLEANUP (Future Enhancement)

**Note:** A cleanup script could be created to automate some of these steps:
- `scripts/cleanup_old_project.sh` / `cleanup_old_project.ps1`
- Automates cleanup of `src/`, `runs/`, and documentation folders
- Creates backup automatically
- Asks for confirmation before deletion

**Current Status:** Manual cleanup required (this protocol guides the process).

---

## EXAMPLES

### Example 1: Complete Clean Start

**Scenario:** Starting a completely new project, no need to keep old project data.

**Steps:**
1. Delete `src/` folder contents
2. Replace root `/docs/` folder documents
3. Delete old sprint folders in `runs/`
4. Update `project.scope.md` manually or let Product Agent suggest
5. Run Product Agent to initialize

### Example 2: Keep Old Project Data

**Scenario:** Starting new project but want to keep old project for reference.

**Steps:**
1. Create backup folder: `backup-old-project-2024-01-15/`
2. Move `src/` to backup
3. Move `runs/` to backup
4. Move root `/docs/` to backup
5. Add new project documents to root `/docs/`
6. Update `project.scope.md`
7. Run Product Agent to initialize

### Example 3: Partial Cleanup

**Scenario:** Starting new project but some features/backlog items are still relevant.

**Steps:**
1. Clean `src/` folder
2. Replace root `/docs/` folder documents
3. Archive old sprints but keep `runs/features/` folder
4. Update `project.scope.md`
5. Run Product Agent to initialize

---

## NOTES

- **Backup First:** Always backup important data before cleanup
- **Product Agent Help:** Product Agent can automate many initialization steps
- **Gradual Cleanup:** You don't need to clean everything at once - can be done gradually
- **Feature Management:** `runs/features/` can be kept if features are still relevant
- **Intent Layer:** `ai-factory/docs/` can be auto-generated by Product Agent

---

## RELATED PROTOCOLS

- `full_project_planning.md` - **NEW:** Full project planning protocol (all sprints planned upfront)
- `sprint_initialization.md` - Sprint workspace creation
- `task_generation.md` - Task creation for new sprint
- Product Agent documentation - Auto-initialization capabilities
