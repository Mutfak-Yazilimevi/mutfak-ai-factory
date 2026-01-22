# Best Practices

Proven patterns and guidelines for effective sprint execution.

## 📋 Sprint ID Naming Convention

### Recommended Formats:
- **Sequential:** `001`, `002`, `003`
- **Project-Prefixed:** `{PROJECT_NAME}-001`, `{PROJECT_NAME}-002`
- **Date-Based:** `2024-01-001`, `2024-01-002`
- **Feature-Based:** `AUTH-001`, `PAYMENT-001`

### Rules:
- Use consistent format across all sprints
- Keep IDs short and memorable
- Avoid special characters (use hyphens if needed)
- Match folder name exactly

---

## 🎯 Task Granularity Guidelines

### Good Task (Atomic):
```
TASK_ID: BACKEND-001
DESCRIPTION: Create User domain entity with email and password fields
OUTPUT: src/api/MyProject.Domain/Entities/User.cs
```

### Bad Task (Too Large):
```
TASK_ID: BACKEND-001
DESCRIPTION: Implement entire authentication system
OUTPUT: Complete auth system
```

### Guidelines:
- **One responsibility per task**
- **One output per task**
- **Completable in < 1 day**
- **Testable independently**

---

## 🔗 Dependency Best Practices

### Good Dependencies:
```
DEPENDENCIES:
- BACKEND-001 (Domain entity must exist before repository)
- BACKEND-002 (Repository must exist before service)
```

### Bad Dependencies:
```
DEPENDENCIES:
- BACKEND-001
- BACKEND-002
- BACKEND-003
- BACKEND-004
- ... (too many dependencies)
```

### Guidelines:
- **Minimize dependencies** (fewer is better)
- **Create foundational tasks first** (no dependencies)
- **Avoid deep dependency chains** (max 3-4 levels)
- **Group related work** (reduce cross-dependencies)

---

## 📁 File Organization

### Sprint Structure:
```
runs/
└── <SPRINT_ID>/
    ├── sprint.md (sprint goals)
    ├── product.md (requirements)
    ├── architecture.md (technical decisions)
    ├── api/
    │   └── contract.md (API spec)
    ├── tasks/
    │   ├── dotnet-core/ (if BACKEND.DOTNET_CORE: ACTIVE or API: ACTIVE)
    │   ├── java/ (if BACKEND.JAVA: ACTIVE)
    │   ├── python/ (if BACKEND.PYTHON: ACTIVE)
    │   ├── angular/ (if FRONTEND.ANGULAR: ACTIVE or FRONTEND: ACTIVE)
    │   ├── react/ (if FRONTEND.REACT: ACTIVE)
    │   ├── vue/ (if FRONTEND.VUE: ACTIVE)
    │   ├── react-native/ (if REACT_NATIVE: ACTIVE)
    │   ├── ios-developer/ (if IOS_DEVELOPER: ACTIVE)
    │   ├── android-developer/ (if ANDROID_DEVELOPER: ACTIVE)
    │   ├── designer/ (if DESIGNER: ACTIVE)
    │   ├── database/ (if DATABASE: ACTIVE)
    │   ├── test-dev/ (if TEST_DEV: ACTIVE)
    │   ├── security/ (if SECURITY: ACTIVE)
    │   ├── ops/ (if OPS: ACTIVE)
    │   ├── ai-ml/ (if AI_ML: ACTIVE)
    │   ├── backend/ (legacy - if API: ACTIVE for backward compatibility)
    │   ├── frontend/ (legacy - if FRONTEND: ACTIVE for backward compatibility)
    │   └── <custom-agent>/ (if CUSTOM_AGENTS defined)
    ├── review.md (Lead Dev reviews - optional summary file)
    ├── qa.md (QA results)
    └── docs/ (documentation)
```

### Task Naming:
- Use sequential numbers: `task-001.md`, `task-002.md`
- Match TASK_ID: `BACKEND-001` → `task-001.md`
- Keep consistent across roles

---

## 🚀 Sprint Planning Tips

### 1. Start Small
- First sprint: Focus on core functionality
- Don't try to build everything at once
- Validate system works before scaling

### 2. Clear Goals
- Sprint goal should be one sentence
- Avoid vague objectives
- Make success criteria measurable

### 3. Realistic Scope
- Don't overcommit
- Leave buffer for unexpected issues
- Better to complete fewer tasks than leave many incomplete

---

## 🔄 Execution Best Practices

### 1. Run Agents Sequentially (Planning Phase)
- Product → Architect → Planner → Lead Dev
- Don't skip steps
- Verify each output before proceeding

### 2. Parallel Execution (Production Phase)
- **Technology-specific agents can run in parallel:**
  - Backend agents: .NET Core Developer, Java Developer, Python Developer, Node.js Developer, Go Developer, Rust Developer can work simultaneously
  - Frontend agents: Angular Developer, React Developer, Vue Developer, Next.js Developer, Svelte Developer can work simultaneously
  - Mobile agents: React Native Developer, Flutter Developer, iOS Developer, Android Developer can work simultaneously
- **BUT:** Only if dependencies are satisfied
- Always check API contract exists before Frontend/React Native
- Designer tasks should complete before Frontend/React Native
- Database tasks should complete before Backend tasks that need database
- Test Dev tasks should run after production code tasks
- Security tasks can run in parallel with other tasks
- Multiple backend technologies (e.g., .NET Core and Java) can run in parallel
- Multiple frontend frameworks (e.g., Angular and React) can run in parallel
- **Same ROLE agents:** Sequential execution (one task at a time per ROLE)

### 2.1. Mobile Development Best Practices

#### React Native Development
- **React Native:** All mobile code must use React Native for cross-platform development
- **Platform Support:** Every mobile task must support both iOS and Android
- **Cross-Platform First:** Write cross-platform code in `src/mobile/` whenever possible
- **Platform-Specific Code:** Use `src/mobile/ios/` and `src/mobile/android/` only when necessary
- **Native Modules:** Use native modules for platform-specific features (biometric, haptic)
- **Testing:** Test on both iOS Simulator and Android Emulator
- **Build Verification:** Verify builds work on both platforms before marking task DONE

#### Flutter Development
- **Flutter:** Use Flutter for cross-platform mobile development
- **Platform Support:** Every mobile task must support both iOS and Android
- **Dart Language:** All code written in Dart
- **Platform Channels:** Use platform channels for native features
- **Testing:** Test on both iOS Simulator and Android Emulator
- **Build Verification:** Verify builds work on both platforms before marking task DONE

#### iOS Native Development
- **iOS Developer:** Works on iOS native code (Objective-C/Swift)
- **Native Modules:** Create native modules for React Native/Flutter integration
- **Platform-Specific:** iOS-only features and optimizations
- **Testing:** Test on iOS Simulator and physical devices

#### Android Native Development
- **Android Developer:** Works on Android native code (Java/Kotlin)
- **Native Modules:** Create native modules for React Native/Flutter integration
- **Platform-Specific:** Android-only features and optimizations
- **Testing:** Test on Android Emulator and physical devices

### 2.2. Technology-Specific Agent Best Practices

#### Backend Agents
- **Technology-Specific Agents:**
  - .NET Core Developer: C# / .NET Core / ASP.NET Core
  - Java Developer: Java / Spring Boot
  - Python Developer: Python / Django / FastAPI
  - Node.js Developer: Node.js / Express / NestJS
  - Go Developer: Go / Gin / Echo
  - Rust Developer: Rust / Actix
- **Use appropriate agent** based on project.scope.md configuration
- **Parallel Development:** Multiple backend technologies can run simultaneously
- **Legacy Support:** Legacy backend.md agent available for backward compatibility (maps to .NET Core Developer)

#### Frontend Agents
- **Framework-Specific Agents:**
  - Angular Developer: Angular framework
  - React Developer: React framework
  - Vue Developer: Vue.js framework
  - Next.js Developer: Next.js framework
  - Svelte Developer: Svelte framework
- **Use appropriate agent** based on project.scope.md configuration
- **Parallel Development:** Multiple frontend frameworks can run simultaneously
- **Legacy Support:** Legacy frontend.md agent available for backward compatibility (maps to Angular Developer)

#### Best Practices
- **Choose technology-specific agents** for better code quality and framework-specific patterns
- **Enable parallel development** by using multiple technology-specific agents
- **Follow framework conventions** - each agent knows its framework best practices
- **Avoid mixing technologies** in same agent - use separate agents for each technology

### 3. Regular Status Checks
- Check sprint status daily
- Monitor blockers early
- Update guides/SPRINT_STATUS.md regularly

---

## ✅ Quality Practices

### 1. Review Before QA
- Lead Dev should review all tasks
- Fix issues before QA
- Reduces QA failure rate

### 4. CHANGES_REQUIRED Workflow
- When Lead Dev marks a task as CHANGES_REQUIRED:
  - Task STATUS changes from DONE to TODO
  - Developer agent must fix the issues
  - Task becomes READY again after fixes
  - Lead Dev reviews again
- Don't skip CHANGES_REQUIRED reviews
- Address all review feedback before marking DONE again

### 2. Test as You Go
- Don't wait until QA to test
- Verify each task output
- Check acceptance criteria

### 3. Document Decisions
- Architecture decisions in architecture.md
- Product decisions in product.md
- Don't leave decisions undocumented

### 5. COMPLETION Section Best Practices
- Always include SUMMARY and FILES in COMPLETION
- Add role-specific extensions when relevant:
  - **Backend (Technology-Specific):**
    - .NET Core Developer: .NET Core patterns, Entity Framework, MediatR usage
    - Java Developer: Spring Boot patterns, JPA/Hibernate usage
    - Python Developer: Django/FastAPI patterns, ORM usage
    - Node.js Developer: Express/NestJS patterns, middleware usage
    - Go Developer: Go patterns, Gin/Echo usage
    - Rust Developer: Rust patterns, Actix usage
  - **Frontend (Framework-Specific):**
    - Angular Developer: Angular components, services, modules, PAGES / FLOWS
    - React Developer: React components, hooks, context, PAGES / FLOWS
    - Vue Developer: Vue components, composables, PAGES / FLOWS
    - Next.js Developer: Next.js pages, API routes, PAGES / FLOWS
    - Svelte Developer: Svelte components, stores, PAGES / FLOWS
  - **Mobile:**
    - React Native: SCREENS / FLOWS, iOS / Android (platform-specific implementations)
    - Flutter: SCREENS / FLOWS, iOS / Android (platform-specific implementations)
    - iOS Developer: iOS-specific implementations, native modules
    - Android Developer: Android-specific implementations, native modules
  - **Test Dev:** COVERAGE, TEST_TYPES
  - **AI/ML:** MODELS, DATA
  - **Security:** SECURITY_MEASURES, COMPLIANCE
  - **Database:** TABLES, MIGRATIONS
  - **OPS:** INFRASTRUCTURE, DEPLOYMENT
  - **Designer:** DESIGN_SYSTEM, COMPONENTS
- Include GIT section if GIT: ACTIVE (Branch, Commits, PR)
- Keep COMPLETION factual and concise

---

## 🎨 Communication Patterns

### Between Agents:
- **File-based only** (no direct communication)
- **Status is the source of truth**
- **Explicit dependencies** (no assumptions)

### With System:
- **Read before write** (always read inputs first)
- **Verify before proceed** (check prerequisites)
- **Fail fast** (stop if requirements not met)

---

## ⚠️ Common Mistakes to Avoid

### 1. Skipping Steps
- ❌ Running Planner before Product
- ✅ Follow START_SPRINT.md order

### 2. Vague Tasks
- ❌ "Implement feature"
- ✅ "Create User entity with email field"

### 3. Missing Dependencies
- ❌ Frontend task without API contract
- ✅ Wait for API contract completion

### 4. Ignoring Blockers
- ❌ Continuing with BLOCKED tasks
- ✅ Resolve blockers first

### 5. Incomplete Documentation
- ❌ Skipping COMPLETION notes
- ✅ Always document what was done

---

## 📊 Sprint Metrics

### Track These:
- **Task completion rate:** DONE / Total
- **Average task duration:** Time per task
- **Blocker frequency:** How often tasks get blocked
- **QA pass rate:** First-time pass percentage

### Use Metrics To:
- Improve task granularity
- Identify dependency issues
- Optimize sprint planning
- Reduce blockers

---

## 🔐 Security Best Practices

### 1. Never Store Secrets
- Don't commit API keys
- Don't store passwords
- Use environment variables

### 2. Review Security-Critical Tasks
- Extra scrutiny for auth tasks
- Verify security patterns
- Check for vulnerabilities

### 3. Follow Project Constraints
- Respect project.scope.md rules
- Don't bypass security constraints
- Report security concerns

---

## 🎓 Learning from Sprints

### After Each Sprint:
1. Review sprint_report.md
2. Identify what went well
3. Note what could improve
4. Update practices for next sprint

### Continuous Improvement:
- Refine task granularity
- Optimize dependency chains
- Improve agent prompts
- Update documentation

---

## 💡 Pro Tips

1. **Use consistent naming:** Makes tracking easier
2. **Document as you go:** Don't wait until the end
3. **Check status regularly:** Catch issues early
4. **Keep tasks small:** Easier to complete and review
5. **Test incrementally:** Don't wait for QA
6. **Communicate via files:** Status is the source of truth
7. **Follow the flow:** Don't shortcut the process

---

## 🤖 Custom Agent Best Practices

### When to Use Custom Agents
- **Specialized Domain:** Project requires domain-specific expertise (IoT, Blockchain, Game Dev, etc.)
- **Multiple Tasks:** Domain requires multiple dedicated tasks
- **Unique Patterns:** Domain has unique implementation patterns

### Custom Agent Naming
- Use UPPERCASE_WITH_UNDERSCORES in project.scope.md (e.g., `IOT`, `BLOCKCHAIN`)
- Task folders use lowercase-with-hyphens (e.g., `iot/`, `blockchain/`)
- Keep names descriptive and clear

### Custom Agent Task Creation
- Follow same task format as standard agents
- Can have dependencies on standard agents
- Use ROLE: <CUSTOM_AGENT_NAME> in task files

### Custom Agent Execution
- Use `custom-agent-template.md` as base
- Specify agent name when running
- Follow same execution pattern as standard agents

---

## 🔀 Git Best Practices

### When GIT: ACTIVE in project.scope.md

#### Branch Management
- **One branch per task:** Each task gets its own branch
- **Descriptive names:** Use clear, short descriptions in branch names
- **Consistent format:** Follow `<SPRINT_ID>/<TASK_ID>-<description>` format
- **Delete after merge:** Clean up branches after PR is merged

#### Commit Messages
- **Always include TASK_ID:** First line must have TASK_ID
- **Clear descriptions:** Explain what was done, not how
- **List files changed:** Include FILES section in commit message
- **Frequent commits:** Don't wait until task completion to commit

#### Pull Requests
- **Link to task:** PR description should reference task file
- **Include acceptance criteria:** Mark criteria as checklist
- **Clear title:** Follow `[<SPRINT_ID>] <TASK_ID>: <TITLE>` format
- **Complete description:** Include all relevant task information

#### Workflow
- **Create branch before starting:** Don't start coding without branch
- **Commit as you go:** Commit logical units of work
- **Push regularly:** Keep remote branch up to date
- **Create PR when done:** Don't mark task DONE without PR (if REQUIRE_PR: YES)

### When GIT: NONE
- **No Git constraints:** Work directly without branch/commit requirements
- **Focus on code:** No overhead from Git operations
- **Faster iteration:** No need to manage branches or commits

### Common Mistakes to Avoid
- ❌ Starting task without checking GIT: STATUS
- ❌ Forgetting TASK_ID in commit message
- ❌ Creating branch with wrong format
- ❌ Not listing files in commit message
- ❌ Skipping PR creation when REQUIRE_PR: YES

---

## 🎼 Orchestrator Agent Best Practices

### When to Use Orchestrator

**Use Orchestrator when:**
- You want fully autonomous sprint execution
- You want automatic task assignment
- You want real-time dashboard updates
- You want automatic error handling
- You want to minimize manual intervention

**Use Manual Execution when:**
- You want more control over agent execution
- You want to review each agent's output before proceeding
- You're debugging specific issues
- You want to customize agent execution order

### Orchestrator Configuration

**Before starting:**
- Verify `project.scope.md` is correctly configured
- Ensure root `/docs/` folder has all required documents
- Check that previous sprints (if any) are complete
- Verify Git settings (if GIT: ACTIVE)

**During orchestration:**
- Monitor dashboard regularly
- Check execution logs for issues
- Be ready for manual intervention if complex errors occur
- Don't interrupt Orchestrator unless necessary

### Task Assignment Best Practices

**Orchestrator automatically:**
- Finds READY tasks
- Assigns to correct agents
- Manages parallel execution
- Handles dependencies

**You should:**
- Trust Orchestrator's assignment logic
- Only intervene for complex errors
- Monitor dashboard for progress
- Review execution logs if issues arise

### Error Handling Best Practices

**Simple Errors:**
- Let Orchestrator handle automatically
- Don't intervene unless max retries exceeded
- Check execution logs to understand retry attempts

**Complex Errors:**
- Orchestrator will stop and report
- Review error details in dashboard
- Fix issue manually
- Resume Orchestrator after fix

### Dashboard Best Practices

**Monitor dashboard for:**
- Progress percentage
- Blocked tasks
- Agent activity
- Recent activity log

**Dashboard updates:**
- Automatically updated by Orchestrator
- Check every few minutes during execution
- Use dashboard to understand sprint status

### Performance Tips

1. **Let Orchestrator run:** Don't interrupt unless necessary
2. **Monitor, don't micromanage:** Trust Orchestrator's decisions
3. **Check logs for details:** Execution logs provide detailed information
4. **Use dashboard for overview:** Dashboard gives high-level status
5. **Intervene only when needed:** Manual intervention only for complex errors

---

## 📝 Review Summary File (review.md)

Lead Dev may create `/runs/<SPRINT_ID>/review.md` as an optional summary file.

**Purpose:**
- High-level overview of review status
- Track blockers and escalations
- Summary of CHANGES_REQUIRED tasks
- Dependency engine status

**Note:** This file is optional. The primary review information is in each task file's REVIEW section.

**Format:**
```markdown
# Sprint Review Summary

SPRINT_ID: <SPRINT_ID>
LAST_UPDATED: <timestamp>

## Review Status
- Total Tasks: <count>
- Reviewed: <count>
- Approved: <count>
- CHANGES_REQUIRED: <count>
- BLOCKED: <count>

## Blockers
- <TASK_ID>: <reason>

## Escalations
- <TASK_ID>: <escalation_target> - <reason>

## Dependency Engine Status
- READY Tasks: <count>
- Waiting Tasks: <count>
```

---

## 📚 Related Documents

- `guides/QUICK_START.md` - Getting started guide
- `guides/TROUBLESHOOTING.md` - Problem solving
- `guides/BUG_FIX.md` - Bug fix guide
- `guides/FEATURE_REQUEST.md` - Feature request guide
- `guides/CUSTOM_AGENTS.md` - Custom agents guide
- `ai/protocols/git_integration.md` - Git integration protocol
- `ai/protocols/hybrid_error_handling.md` - Hybrid error handling protocol
- `ai/protocols/dashboard.md` - Dashboard protocol
- `ai/agents/orchestrator.md` - Orchestrator Agent documentation
- `ai/START_SPRINT.md` - Detailed sprint flow
- `ai/protocols/` - System protocols
- `ai/agents/` - Agent behavior rules
