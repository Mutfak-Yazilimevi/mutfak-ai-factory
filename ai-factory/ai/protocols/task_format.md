TASK_ID: <STRING>
TITLE: <SHORT TITLE>
ROLE: BACKEND | DOTNET_CORE_DEVELOPER | JAVA_DEVELOPER | PYTHON_DEVELOPER | NODEJS_DEVELOPER | GO_DEVELOPER | RUST_DEVELOPER | DESIGNER | DATABASE | FRONTEND | ANGULAR_DEVELOPER | REACT_DEVELOPER | VUE_DEVELOPER | NEXTJS_DEVELOPER | SVELTE_DEVELOPER | REACT_NATIVE | FLUTTER_DEVELOPER | IOS_DEVELOPER | ANDROID_DEVELOPER | TEST_DEV | SECURITY | OPS | AI_ML | <CUSTOM_AGENT_NAME>
# Note: BACKEND and FRONTEND are legacy roles for backward compatibility
# BACKEND maps to DOTNET_CORE_DEVELOPER
# FRONTEND maps to ANGULAR_DEVELOPER
# CUSTOM_AGENT_NAME: Use UPPERCASE_WITH_UNDERSCORES format (e.g., IOT, BLOCKCHAIN, GAME_DEV)
# Custom agents are determined by Product Agent based on project requirements
STATUS: TODO | BLOCKED | IN_PROGRESS | DONE

DEPENDENCIES:
- <TASK_ID>
- <TASK_ID>

DESCRIPTION:
Clear, implementation-level description.

INPUTS:
- Files or contracts this task depends on

OUTPUT:
- File(s) or capability produced
- **IMPORTANT:** All code outputs must follow the structure based on stack type:
  - **Backend (API):** `src/api/{Project_Name}.{Stack_Name}/` (e.g., `src/api/MyProject.Domain/`, `src/api/MyProject.Application/`)
  - **Frontend (Web):** `src/web/...` (e.g., `src/web/components/Login.tsx`, `src/web/pages/HomePage.tsx`)
  - **React Native:** `src/mobile/...` (e.g., `src/mobile/screens/LoginScreen.tsx`, `src/mobile/components/Button.tsx`)
  - **iOS Developer:** `src/mobile/ios/...` (e.g., `src/mobile/ios/ProjectName/Modules/BiometricModule.swift`, `src/mobile/ios/Info.plist`)
  - **Android Developer:** `src/mobile/android/...` (e.g., `src/mobile/android/app/src/main/java/com/projectname/modules/BiometricModule.kt`, `src/mobile/android/app/src/main/AndroidManifest.xml`)
  - **Database:** `src/api/{Project_Name}.Persistence/` (e.g., `src/api/MyProject.Persistence/Migrations/`)
  - **Tests:** `src/api/{Project_Name}.{Stack_Name}.Tests/` for backend, `src/web/__tests__/` or `src/web/tests/` for frontend, `src/mobile/__tests__/` or `src/mobile/tests/` for React Native
  - **Other stacks:** Follow backend pattern with `src/api/` prefix
- Read PROJECT: NAME from `/ai/project.scope.md` to get {Project_Name}
- Stack names follow Clean Architecture: Domain, Application, Infrastructure, Persistence, API, Frontend, React Native, Tests, etc.
- Do NOT use `ai-factory/src/` - code goes to root `/src/` (same level as ai-factory/)
(empty until DONE)

ACCEPTANCE_CRITERIA:
- Bullet list of verifiable conditions

READY_CONDITION:
- When all dependencies are DONE

NOTES:
(optional)

COMPLETION:
(added by developer agent when task is DONE)
SUMMARY:
- What was implemented
FILES:
- List of created/modified files
- Do NOT explain code logic

# Agent-Specific Extensions (Optional):
# Agents may add role-specific sections to COMPLETION:
# - Frontend: PAGES / FLOWS
# - React Native: SCREENS / FLOWS, iOS / Android (platform-specific implementations)
# - iOS Developer: NATIVE_MODULES, iOS-specific configurations
# - Android Developer: NATIVE_MODULES, Android-specific configurations
# - Test Dev: COVERAGE, TEST_TYPES
# - AI/ML: MODELS, DATA
# - Security: SECURITY_MEASURES, COMPLIANCE
# - Database: TABLES, MIGRATIONS
# - OPS: INFRASTRUCTURE, DEPLOYMENT
# - Designer: DESIGN_SYSTEM, COMPONENTS
# - GIT: (if GIT: ACTIVE) Branch, Commits, PR

REVIEW:
(added by Lead Dev after completion)
STATUS: APPROVED | CHANGES_REQUIRED
NOTES:
- Short, factual feedback only
