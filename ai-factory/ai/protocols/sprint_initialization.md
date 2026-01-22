SPRINT INITIALIZATION PROTOCOL

PURPOSE:
This protocol is executed automatically by the Product Agent.
It creates a new sprint workspace and prepares it for agent execution.

EXECUTED BY: Product Agent (automatically, before creating product.md)

STEPS (Product Agent executes these):

1. Determine SPRINT_ID
   - Read `/ai/project.scope.md` to get SPRINT_ID_FORMAT
   - Check existing `/runs/` folders to find highest SPRINT_ID
   - Generate next SPRINT_ID based on format:
     - SEQUENTIAL: 001, 002, 003, ...
     - PROJECT_PREFIXED: {PROJECT_NAME}-001, {PROJECT_NAME}-002, ...

2. Create Sprint Directory
   - Create `/runs/<SPRINT_ID>/` folder
   - Read `/ai/project.scope.md` to determine active stacks
   - Create `/runs/<SPRINT_ID>/api/` folder (if API: ACTIVE)
   - Create `/runs/<SPRINT_ID>/tasks/` folder structure:
     - **Backend task folders (read BACKEND section from project.scope.md):**
       - `/runs/<SPRINT_ID>/tasks/dotnet-core/` (if BACKEND.DOTNET_CORE: ACTIVE or API: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/java/` (if BACKEND.JAVA: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/python/` (if BACKEND.PYTHON: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/nodejs/` (if BACKEND.NODEJS: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/go/` (if BACKEND.GO: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/rust/` (if BACKEND.RUST: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/backend/` (legacy - if API: ACTIVE for backward compatibility)
     - **Frontend task folders (read FRONTEND section from project.scope.md):**
       - `/runs/<SPRINT_ID>/tasks/angular/` (if FRONTEND.ANGULAR: ACTIVE or FRONTEND: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/react/` (if FRONTEND.REACT: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/vue/` (if FRONTEND.VUE: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/nextjs/` (if FRONTEND.NEXTJS: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/svelte/` (if FRONTEND.SVELTE: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/frontend/` (legacy - if FRONTEND: ACTIVE for backward compatibility)
     - **Mobile task folders:**
       - `/runs/<SPRINT_ID>/tasks/react-native/` (if MOBILE.REACT_NATIVE: ACTIVE or REACT_NATIVE: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/flutter/` (if MOBILE.FLUTTER: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/ios-developer/` (only if IOS_DEVELOPER: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/android-developer/` (only if ANDROID_DEVELOPER: ACTIVE)
     - **Other task folders:**
       - `/runs/<SPRINT_ID>/tasks/designer/` (only if DESIGNER: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/database/` (only if DATABASE: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/test-dev/` (only if TEST_DEV: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/security/` (only if SECURITY: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/ops/` (only if OPS: ACTIVE)
       - `/runs/<SPRINT_ID>/tasks/ai-ml/` (only if AI_ML: ACTIVE)
     - **Custom agent folders:** Read CUSTOM_AGENTS section in project.scope.md
       - For each custom agent with ACTIVE status, create `/runs/<SPRINT_ID>/tasks/<agent-name>/` folder
       - Convert agent name from UPPERCASE_WITH_UNDERSCORES to lowercase-with-hyphens

3. Create sprint.md file
   - Create `/runs/<SPRINT_ID>/sprint.md` file
   - Extract sprint information from root `/docs/` folder
   - Use DEFAULT_DEFINITION_OF_DONE from project.scope.md
   - Format with SPRINT_ID, SPRINT_GOAL, CONSTRAINTS, DEFINITION_OF_DONE

4. Verify Prerequisites
   - `/ai/project.scope.md` exists
   - Root `/docs/` or `/ai-factory/docs/` has content
   - Root `/docs/` folder has content for sprint goal extraction

5. Proceed to Product Requirements
   - Sprint workspace is ready
   - Product Agent now creates `/runs/<SPRINT_ID>/product.md`

NOTES:
- This is automatic - no manual intervention needed
- Product Agent handles all initialization
- All subsequent agents use the SPRINT_ID determined by Product Agent
- If sprint folder already exists, Product Agent will use it (no re-initialization)
