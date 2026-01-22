PROTOCOL: TASK GENERATION

PURPOSE:
Convert sprint planning outputs into executable development tasks.

INPUTS (MANDATORY):
- runs/<SPRINT_ID>/product.md
- runs/<SPRINT_ID>/architecture.md
- runs/<SPRINT_ID>/api/contract.md (if exists)

OUTPUT:
- runs/<SPRINT_ID>/tasks/
  - **Backend task folders (read BACKEND section from project.scope.md):**
    - dotnet-core/ (if BACKEND.DOTNET_CORE: ACTIVE or API: ACTIVE)
    - java/ (if BACKEND.JAVA: ACTIVE)
    - python/ (if BACKEND.PYTHON: ACTIVE)
    - nodejs/ (if BACKEND.NODEJS: ACTIVE)
    - go/ (if BACKEND.GO: ACTIVE)
    - rust/ (if BACKEND.RUST: ACTIVE)
    - backend/ (legacy - if API: ACTIVE for backward compatibility)
  - **Frontend task folders (read FRONTEND section from project.scope.md):**
    - angular/ (if FRONTEND.ANGULAR: ACTIVE or FRONTEND: ACTIVE)
    - react/ (if FRONTEND.REACT: ACTIVE)
    - vue/ (if FRONTEND.VUE: ACTIVE)
    - nextjs/ (if FRONTEND.NEXTJS: ACTIVE)
    - svelte/ (if FRONTEND.SVELTE: ACTIVE)
    - frontend/ (legacy - if FRONTEND: ACTIVE for backward compatibility)
  - **Mobile task folders:**
    - react-native/ (if MOBILE.REACT_NATIVE: ACTIVE or REACT_NATIVE: ACTIVE)
    - flutter/ (if MOBILE.FLUTTER: ACTIVE)
    - ios-developer/ (if IOS_DEVELOPER: ACTIVE)
    - android-developer/ (if ANDROID_DEVELOPER: ACTIVE)
  - **Other task folders:**
    - designer/ (only if DESIGNER: ACTIVE)
    - database/ (only if DATABASE: ACTIVE)
    - test-dev/ (only if TEST_DEV: ACTIVE)
    - security/ (only if SECURITY: ACTIVE)
    - ops/ (only if OPS: ACTIVE)
    - ai-ml/ (only if AI_ML: ACTIVE)
  - **Custom agent folders:**
    - <custom-agent-name>/ (only if custom agent ACTIVE)

NOTE: This protocol is implemented by the Planner Agent.
Each task is a separate file in the appropriate role directory.

RULES:
- Every task MUST map to a feature or architectural component
- Tasks MUST be atomic (1 developer, 1 responsibility)
- Tasks MUST be implementable in < 1 day
- No task may include multiple layers (e.g. frontend + backend)

TASK FORMAT:
Use strictly the format defined in `ai/protocols/task_format.md`

**CRITICAL - OUTPUT Path Format:**
- All OUTPUT paths must follow the structure based on stack type:
  - **Backend (API):** `src/api/{Project_Name}.{Stack_Name}/` (e.g., `src/api/MyProject.Domain/`, `src/api/MyProject.Application/`)
  - **Frontend (Web):** `src/web/...` (e.g., `src/web/components/Login.tsx`, `src/web/pages/HomePage.tsx`)
  - **React Native:** `src/mobile/...` (e.g., `src/mobile/screens/LoginScreen.tsx`, `src/mobile/components/Button.tsx`)
  - **iOS Developer:** `src/mobile/ios/...` (e.g., `src/mobile/ios/ProjectName/Modules/BiometricModule.swift`, `src/mobile/ios/Info.plist`)
  - **Android Developer:** `src/mobile/android/...` (e.g., `src/mobile/android/app/src/main/java/com/projectname/modules/BiometricModule.kt`, `src/mobile/android/app/src/main/AndroidManifest.xml`)
  - **Database:** `src/api/{Project_Name}.Persistence/` (e.g., `src/api/MyProject.Persistence/Migrations/20240101000001_InitialMigration.cs`)
  - **Tests:** `src/api/{Project_Name}.{Stack_Name}.Tests/` for backend, `src/web/__tests__/` or `src/web/tests/` for frontend, `src/mobile/__tests__/` or `src/mobile/tests/` for React Native
- Read PROJECT: NAME from `/ai/project.scope.md` to get {Project_Name} (for backend and database only)
- Stack names follow Clean Architecture: Domain, Application, Infrastructure, Persistence, API, Frontend, React Native, Tests, etc.
- Examples:
  - Backend Domain: `src/api/MyProject.Domain/Entities/User.cs`
  - Backend Application: `src/api/MyProject.Application/UseCases/CreateUser.cs`
  - Frontend: `src/web/components/Login.tsx`
  - React Native: `src/mobile/screens/LoginScreen.tsx`
  - Database: `src/api/MyProject.Persistence/Migrations/20240101000001_InitialMigration.cs`
  - Tests: `src/api/MyProject.Domain.Tests/Entities/UserTests.cs` (backend), `src/web/__tests__/components/Login.test.tsx` (frontend), `src/mobile/__tests__/screens/LoginScreen.test.tsx` (React Native)

TASK TYPES (ROLE values):
- **Backend Roles:**
  - DOTNET_CORE_DEVELOPER: .NET Core / C# development
  - JAVA_DEVELOPER: Java / Spring Boot development
  - PYTHON_DEVELOPER: Python / Django / FastAPI development
  - NODEJS_DEVELOPER: Node.js / Express / NestJS development
  - GO_DEVELOPER: Go development
  - RUST_DEVELOPER: Rust development
  - BACKEND: Legacy role (maps to DOTNET_CORE_DEVELOPER)
- **Frontend Roles:**
  - ANGULAR_DEVELOPER: Angular development
  - REACT_DEVELOPER: React development
  - VUE_DEVELOPER: Vue.js development
  - NEXTJS_DEVELOPER: Next.js development
  - SVELTE_DEVELOPER: Svelte development
  - FRONTEND: Legacy role (maps to ANGULAR_DEVELOPER)
- **Mobile Roles:**
  - REACT_NATIVE: React Native development (iOS and Android)
  - FLUTTER_DEVELOPER: Flutter development
  - IOS_DEVELOPER: iOS native development (Objective-C/Swift)
  - ANDROID_DEVELOPER: Android native development (Java/Kotlin)
- **Other Roles:**
  - DESIGNER: Design system and specifications
  - DATABASE: Database schema and migrations
  - TEST_DEV: Test development
  - SECURITY: Security configurations
  - OPS: Operations and DevOps
  - AI_ML: AI/ML development
- **Custom Roles:**
  - <CUSTOM_AGENT_NAME>: Custom agent tasks (UPPERCASE_WITH_UNDERSCORES format)

PRIORITY ORDER:
1. Core backend domain
2. API contracts
3. Frontend views
4. Supporting infrastructure
5. Documentation

FAIL CONDITIONS:
- Vague tasks
- Missing acceptance criteria
- Tasks without clear owner type
