# Agent Prompt Templates

Ready-to-use prompts for running each agent in Cursor Chat.

## 📋 How to Use

1. Copy the prompt for the agent you want to run
2. Replace `<SPRINT_ID>` with your actual sprint ID (if needed)
3. Paste into Cursor Chat
4. Agent will read its instructions and execute

---

## 🎯 Planning Phase Agents

### Product Agent (Sprint Initialization + Product Requirements)

**Müşteri olarak kullanım:**

```
Read ai-factory/ai/agents/product.md and execute.

I've placed my documents in the root /docs/ folder. Please start the process.
```

**Product Agent otomatik olarak:**
1. Root `/docs/` klasöründeki tüm dosyaları okuyacak (müşteri dokümanları)
2. project.scope.md'den SPRINT_ID formatını okuyacak ve yeni SPRINT_ID oluşturacak
3. Sprint workspace'i oluşturacak:
   - `/runs/<SPRINT_ID>/` directory
   - Technology-specific task folders (e.g., `tasks/dotnet-core/`, `tasks/angular/`, `tasks/react-native/`) based on `project.scope.md`
   - Legacy folders (`tasks/backend/`, `tasks/frontend/`) for backward compatibility if needed
   - `/runs/<SPRINT_ID>/sprint.md` dosyasını oluşturacak (root `/docs/` ve project.scope.md'den bilgi çıkararak)
4. Tüm giriş dosyalarını okuyacak (project.scope.md, docs/, runs/features/backlog.md)
5. `/runs/<SPRINT_ID>/product.md` dosyasını oluşturacak
   - **CRITICAL:** First line must be exactly: `SPRINT_ID: <SPRINT_ID>` (without markdown formatting)
   - This allows other agents to read SPRINT_ID from the first line
   - Example: `SPRINT_ID: 001` or `SPRINT_ID: PROJECT-001`

**Note:** 
- Müşteri sadece root `/docs/` klasörüne dosyalar atar
- SPRINT_ID otomatik belirlenir
- Product Agent tüm süreci başlatır
- product.md first line format is critical for other agents to read SPRINT_ID

### Product Agent (Feature Request Review)

**Müşteri yeni feature istediğinde:**

```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog or current sprint.
```

**Product Agent:**
1. Feature request'i okuyacak
2. Backlog'a ekleyecek veya mevcut sprint'e ekleyecek
3. Priority belirleyecek

### Product Agent (Feature Request Review)

**Müşteri yeni feature istediğinde:**

```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please review and add it to the backlog or current sprint.
```

**Product Agent:**
1. Feature request'i okuyacak
2. Backlog'a ekleyecek veya mevcut sprint'e ekleyecek
3. Priority belirleyecek

### Architect Agent

```
Read ai-factory/ai/agents/architect.md and execute.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/architect.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Planner Agent

```
Read ai-factory/ai/agents/planner.md and execute.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/planner.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Lead Dev Agent (Plan Review)

```
Read ai-factory/ai/agents/lead-dev.md and execute Plan Review phase.

The agent will automatically find the sprint folder or read product.md to get SPRINT_ID.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/lead-dev.md and execute Plan Review phase for SPRINT_ID: <SPRINT_ID>
```

---

## 🔨 Production Phase Agents

### Technology-Specific Backend Agents

#### .NET Core Developer

```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** .NET Core Developer specializes in .NET Core / C# backend development. For other backend technologies, use the appropriate technology-specific agent (Java Developer, Python Developer, Node.js Developer, etc.).

#### Java Developer

```
Read ai-factory/ai/agents/java-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/java-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Java Developer specializes in Java / Spring Boot backend development.

#### Python Developer

```
Read ai-factory/ai/agents/python-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/python-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Python Developer specializes in Python / Django / FastAPI backend development.

#### Node.js Developer

```
Read ai-factory/ai/agents/nodejs-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/nodejs-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Node.js Developer specializes in Node.js / Express / NestJS backend development.

#### Go Developer

```
Read ai-factory/ai/agents/go-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/go-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Go Developer specializes in Go / Gin / Echo backend development.

#### Rust Developer

```
Read ai-factory/ai/agents/rust-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/rust-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Rust Developer specializes in Rust / Actix backend development.

#### Legacy Backend Agent (Backward Compatibility)

```
Read ai-factory/ai/agents/backend.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** This is a legacy agent for backward compatibility. New projects should use technology-specific agents (e.g., `dotnet-core-developer.md`). This agent is used when `API: ACTIVE` is set in `project.scope.md` (maps to `.NET Core Developer`).

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/backend.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Technology-Specific Frontend Agents

#### Angular Developer

```
Read ai-factory/ai/agents/angular-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/angular-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Angular Developer specializes in Angular framework development. For other frontend frameworks, use the appropriate technology-specific agent (React Developer, Vue Developer, Next.js Developer, etc.).

#### React Developer

```
Read ai-factory/ai/agents/react-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/react-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** React Developer specializes in React framework development.

#### Vue Developer

```
Read ai-factory/ai/agents/vue-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/vue-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Vue Developer specializes in Vue.js framework development.

#### Next.js Developer

```
Read ai-factory/ai/agents/nextjs-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/nextjs-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Next.js Developer specializes in Next.js framework development.

#### Svelte Developer

```
Read ai-factory/ai/agents/svelte-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/svelte-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Svelte Developer specializes in Svelte framework development.

#### Legacy Frontend Agent (Backward Compatibility)

```
Read ai-factory/ai/agents/frontend.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** This is a legacy agent for backward compatibility. New projects should use technology-specific agents (e.g., `angular-developer.md`). This agent is used when `FRONTEND: ACTIVE` is set in `project.scope.md` (maps to `Angular Developer`).

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/frontend.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Designer Agent

```
Read ai-factory/ai/agents/designer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/designer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Designer tasks typically complete before Frontend/React Native tasks, as they provide design specifications.

### Mobile Agents

#### React Native Developer

```
Read ai-factory/ai/agents/react-native.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** React Native Developer develops React Native apps for both iOS and Android platforms:
- Cross-platform code in `src/mobile/`
- Platform-specific code in `src/mobile/ios/` and `src/mobile/android/`
- Native modules for biometric authentication, haptic feedback, etc.

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/react-native.md and execute for SPRINT_ID: <SPRINT_ID>
```

#### Flutter Developer

```
Read ai-factory/ai/agents/flutter-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/flutter-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Flutter Developer specializes in Flutter cross-platform mobile development.

### iOS Developer Agent

```
Read ai-factory/ai/agents/ios-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** iOS Developer Agent works on iOS native code (Objective-C/Swift):
- Native modules in `src/mobile/ios/`
- iOS configuration files (Info.plist, Podfile, AppDelegate, etc.)
- iOS-specific optimizations and integrations
- Works alongside React Native Developer to provide native iOS capabilities

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/ios-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Android Developer Agent

```
Read ai-factory/ai/agents/android-developer.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Note:** Android Developer Agent works on Android native code (Java/Kotlin):
- Native modules in `src/mobile/android/`
- Android configuration files (build.gradle, AndroidManifest.xml, MainActivity, etc.)
- Android-specific optimizations and integrations
- Works alongside React Native Developer to provide native Android capabilities

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/android-developer.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Database Agent

```
Read ai-factory/ai/agents/database.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/database.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Database tasks typically complete before Backend tasks that need database structures.

### Test Development Agent

```
Read ai-factory/ai/agents/test-dev.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/test-dev.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Test Dev tasks typically complete after production code tasks (Backend/Frontend/React Native).

### Security Agent

```
Read ai-factory/ai/agents/security.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/security.md and execute for SPRINT_ID: <SPRINT_ID>
```

**Note:** Security tasks can run in parallel with other tasks, reviewing and securing existing code.

### OPS Agent

```
Read ai-factory/ai/agents/ops.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/ops.md and execute for SPRINT_ID: <SPRINT_ID>
```

### AI/ML Agent

```
Read ai-factory/ai/agents/ai-ml.md and execute.

The agent will automatically find the sprint folder, scan tasks, and execute READY tasks.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/ai-ml.md and execute for SPRINT_ID: <SPRINT_ID>
```

---

## Custom Agents

Custom agents are determined by Product Agent based on project requirements. They follow the same execution pattern as standard agents.

### Using Custom Agents

1. **Check project.scope.md:**
   - Read `/ai/project.scope.md` to see if any custom agents are defined
   - Look for `CUSTOM_AGENTS` section
   - Example: `IOT: ACTIVE`, `BLOCKCHAIN: ACTIVE`

2. **Run Custom Agent:**
   ```
   Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: <AGENT_NAME>.
   
   Replace <AGENT_NAME> with the actual custom agent name from project.scope.md (e.g., IOT, BLOCKCHAIN).
   The agent will automatically find the sprint folder, scan tasks in /runs/<SPRINT_ID>/tasks/<agent-name>/, and execute READY tasks.
   ```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/custom-agent-template.md and execute for custom agent: <AGENT_NAME> and SPRINT_ID: <SPRINT_ID>
```

**Note:** Custom agent names in project.scope.md use UPPERCASE_WITH_UNDERSCORES format, but task folders use lowercase-with-hyphens format.
- Example: `IOT: ACTIVE` → tasks folder: `/runs/<SPRINT_ID>/tasks/iot/`
- Example: `BLOCKCHAIN: ACTIVE` → tasks folder: `/runs/<SPRINT_ID>/tasks/blockchain/`
- Example: `GAME_DEV: ACTIVE` → tasks folder: `/runs/<SPRINT_ID>/tasks/game-dev/`

### Lead Dev Agent (Execution Review)

```
Read ai-factory/ai/agents/lead-dev.md and execute Execution Review phase.

The agent will check DONE tasks and update dependencies automatically.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/lead-dev.md and execute Execution Review phase for SPRINT_ID: <SPRINT_ID>
```

---

## ✅ Quality & Documentation Agents

### QA Agent

```
Read ai-factory/ai/agents/qa.md and execute.

The agent will automatically find the sprint folder and verify all requirements.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/qa.md and execute for SPRINT_ID: <SPRINT_ID>
```

### Docs Agent

```
Read ai-factory/ai/agents/docs.md and execute.

The agent will automatically find the sprint folder and generate documentation.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/docs.md and execute for SPRINT_ID: <SPRINT_ID>
```

---

## 🔄 Dependency Engine (Lead Dev)

```
Read ai-factory/ai/agents/lead-dev.md and execute Dependency Engine oversight.

The agent will automatically find the sprint folder and update dependencies.
```

**Alternative:** If you know the SPRINT_ID, you can specify it:
```
Read ai-factory/ai/agents/lead-dev.md and execute Dependency Engine oversight for SPRINT_ID: <SPRINT_ID>
```

---

## 🎯 Advanced Prompts

### Check Sprint Status

```
Check the status of SPRINT_ID: <SPRINT_ID>

Please:
1. Count tasks by status (TODO, IN_PROGRESS, DONE, BLOCKED)
2. List any BLOCKED tasks and reasons
3. Check QA status
4. Check documentation status
5. Provide a summary
```

### Resume Stuck Task

```
Read ai-factory/ai/agents/dotnet-core-developer.md (or angular-developer/react-native) and resume task <TASK_ID> for SPRINT_ID: <SPRINT_ID>

The task is currently IN_PROGRESS. Please:
1. Read the task file
2. Continue from where it left off
3. Complete the task
4. Mark STATUS: DONE
5. Add COMPLETION section
```

**Note:** Use the appropriate technology-specific agent based on the task's ROLE (e.g., `dotnet-core-developer.md`, `angular-developer.md`, `react-native.md`, etc.). For legacy projects, you can still use `backend.md` or `frontend.md`.

### Fix QA Issues

```
QA failed for SPRINT_ID: <SPRINT_ID>. Please:
1. Read /runs/<SPRINT_ID>/qa.md
2. Identify blocking issues
3. Create fix tasks or update existing tasks
4. Execute fixes
5. Re-run QA after fixes
```

### Add Feature to Current Sprint

```
Read ai-factory/ai/agents/product.md and execute.

I've created a new feature request: runs/features/requests/feature-001.md
Please add it to the current sprint (SPRINT_ID: <SPRINT_ID>).
```

### Review Feature Backlog

```
Read ai-factory/ai/agents/product.md and execute.

Please review the feature backlog (runs/features/backlog.md) and suggest which features should be included in the next sprint.
```

---

## 💡 Tips for Effective Prompts

1. **Always specify SPRINT_ID:** Makes it clear which sprint you're working on
2. **Reference agent file:** "Read ai-factory/ai/agents/xxx.md"
3. **Be specific:** Tell agent what to do, not just "run agent"
4. **Check prerequisites:** Verify required files exist before running
5. **Follow order:** Run agents in START_SPRINT.md order

---

## 📝 Customization

You can customize prompts by:
- Adding specific context: "Focus on authentication features"
- Setting constraints: "Only work on backend tasks"
- Adding instructions: "Create detailed COMPLETION notes"
- Requesting updates: "Update sprint status after completion"

---

## 🔀 Git Integration Prompts

### When GIT: ACTIVE in project.scope.md

**Technology-Specific Agent with Git (e.g., .NET Core Developer):**
```
Read ai-factory/ai/agents/dotnet-core-developer.md and execute.

Before starting the task:
1. Check project.scope.md for GIT: STATUS
2. If ACTIVE, create branch: <SPRINT_ID>/<TASK_ID>-<description>
3. Follow Git commit message format with TASK_ID
4. Create PR when task is DONE (if REQUIRE_PR: YES)
```

**Legacy Backend Agent with Git (Backward Compatibility):**
```
Read ai-factory/ai/agents/backend.md and execute.

Before starting the task:
1. Check project.scope.md for GIT: STATUS
2. If ACTIVE, create branch: <SPRINT_ID>/<TASK_ID>-<description>
3. Follow Git commit message format with TASK_ID
4. Create PR when task is DONE (if REQUIRE_PR: YES)
```

**Technology-Specific Frontend Agent with Git (e.g., Angular Developer):**
```
Read ai-factory/ai/agents/angular-developer.md and execute.

Remember:
- Create branch before starting task (if GIT: ACTIVE)
- Include TASK_ID in commit messages
- List all changed files in commit message
```

**Legacy Frontend Agent with Git (Backward Compatibility):**
```
Read ai-factory/ai/agents/frontend.md and execute.

Remember:
- Create branch before starting task (if GIT: ACTIVE)
- Include TASK_ID in commit messages
- List all changed files in commit message
```

### Check Git Status

```
Check project.scope.md for GIT: STATUS setting.

If GIT: ACTIVE:
- Agents must follow Git conventions
- Branch naming: <SPRINT_ID>/<TASK_ID>-<description>
- Commit format: <TASK_ID>: <description>
- PR format: [<SPRINT_ID>] <TASK_ID>: <TITLE>

If GIT: NONE:
- No Git constraints
- Work directly without branches/commits
```

---

## 🎼 Orchestrator Agent Prompts

### Start Autonomous Sprint Execution

```
Read ai-factory/ai/agents/orchestrator.md and execute.

Start orchestration for the current sprint. The orchestrator will:
1. Execute all agents in correct order
2. Assign tasks automatically
3. Monitor execution
4. Handle errors
5. Update dashboard continuously
6. Complete entire sprint autonomously
```

### Check Sprint Status (Dashboard)

```
Read ai-factory/ai/agents/orchestrator.md and check dashboard.

Please:
1. Read /runs/<SPRINT_ID>/dashboard.md
2. Provide current sprint status
3. Highlight any blockers
4. Suggest next steps
```

### Resume After Manual Fix

```
Read ai-factory/ai/agents/orchestrator.md and resume orchestration.

A manual fix has been applied to task <TASK_ID>. Please:
1. Verify the fix
2. Unblock the task
3. Resume orchestration from where it stopped
```

### Handle Complex Error

```
Read ai-factory/ai/agents/orchestrator.md and handle error.

Error detected: <Error Type>
Task: <TASK_ID>
Reason: <Blocked Reason>

Please:
1. Mark task as BLOCKED
2. Stop orchestration
3. Report error details
4. Wait for manual intervention
```

---

## 🔗 Related Documents

- `guides/QUICK_START.md` - Getting started
- `ai/START_SPRINT.md` - Detailed sprint flow
- `ai/protocols/feature_management.md` - Feature management
- `ai/protocols/git_integration.md` - Git integration protocol
- `ai/protocols/hybrid_error_handling.md` - Hybrid error handling protocol
- `ai/protocols/dashboard.md` - Dashboard protocol
- `ai/agents/` - Full agent instructions
