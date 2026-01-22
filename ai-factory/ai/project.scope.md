PROJECT:
  NAME: <PROJECT_NAME>

STACK:
  # Backend Technologies (Vertical Structure)
  BACKEND:
    DOTNET_CORE: ACTIVE | NONE
    JAVA: ACTIVE | NONE
    PYTHON: ACTIVE | NONE
    NODEJS: ACTIVE | NONE
    GO: ACTIVE | NONE
    RUST: ACTIVE | NONE
    # Backward compatibility: API: ACTIVE maps to BACKEND.DOTNET_CORE: ACTIVE
    API: ACTIVE | NONE  # Legacy support - maps to DOTNET_CORE
  
  # Frontend Frameworks (Vertical Structure)
  FRONTEND:
    ANGULAR: ACTIVE | NONE
    REACT: ACTIVE | NONE
    VUE: ACTIVE | NONE
    NEXTJS: ACTIVE | NONE
    SVELTE: ACTIVE | NONE
    # Backward compatibility: FRONTEND: ACTIVE maps to FRONTEND.ANGULAR: ACTIVE
    # Legacy: FRONTEND: ACTIVE | NONE (if used, maps to ANGULAR)
  
  # Mobile Frameworks
  MOBILE:
    REACT_NATIVE: ACTIVE | NONE
    FLUTTER: ACTIVE | NONE
  
  # Native Mobile Developers
  IOS_DEVELOPER: ACTIVE | NONE
  ANDROID_DEVELOPER: ACTIVE | NONE
  
  # Other Stacks
  DESIGNER: ACTIVE | NONE
  DATABASE: ACTIVE | NONE
  TEST_DEV: ACTIVE | NONE
  SECURITY: ACTIVE | NONE
  QA: ACTIVE | NONE
  DOCS: ACTIVE | NONE
  OPS: ACTIVE | NONE
  AI_ML: ACTIVE | NONE

CUSTOM_AGENTS:
  # Project-specific agents determined by Product Agent based on root /docs/ folder
  # Format: AGENT_NAME: ACTIVE | NONE
  # Example:
  #   IOT: ACTIVE
  #   BLOCKCHAIN: ACTIVE
  #   EMBEDDED: ACTIVE
  # Product Agent will add custom agents here if project requires them

SPRINT_MANAGEMENT:
  PLANNING_MODE: FULL_PROJECT | ITERATIVE
  # FULL_PROJECT: Plan all sprints upfront before development starts (recommended for new projects)
  # ITERATIVE: Plan sprints one-by-one as they complete (for existing projects or evolving scope)
  # This setting is set by Product Agent during project initialization based on user choice
  
  CONCURRENT_SPRINTS: ALLOWED | SINGLE_ONLY
  # ALLOWED: Multiple sprints can run simultaneously
  # SINGLE_ONLY: Only one sprint active at a time (recommended for beginners)
  
  SPRINT_ID_FORMAT: SEQUENTIAL
  # SEQUENTIAL: 001, 002, 003, ...
  # PROJECT_PREFIXED: {PROJECT_NAME}-001, {PROJECT_NAME}-002, ...
  
  DEFAULT_DEFINITION_OF_DONE:
    - Feature list completed
    - QA PASS
    - Docs updated

GIT:
  STATUS: ACTIVE | NONE
  # ACTIVE: Git integration rules apply, agents must follow Git conventions (branch naming, commit messages, PR format)
  # NONE: Git integration disabled, agents work without Git constraints
  
  # Additional settings (only when STATUS: ACTIVE):
  BRANCH_NAMING: SPRINT_TASK | TASK_ONLY | CUSTOM
  # SPRINT_TASK: 001/BACKEND-001-create-user-entity (default)
  # TASK_ONLY: BACKEND-001-create-user-entity
  # CUSTOM: Define custom format in git_integration.md
  
  COMMIT_MESSAGE_FORMAT: STANDARD | CONVENTIONAL | CUSTOM
  # STANDARD: <TASK_ID>: <description> (default)
  # CONVENTIONAL: feat(<TASK_ID>): <description>
  # CUSTOM: Define custom format in git_integration.md
  
  REQUIRE_PR: YES | NO
  # YES: All tasks must go through PR before marking DONE
  # NO: Direct commits allowed (default)
  
  AUTO_LINK_TASK: YES | NO
  # YES: Automatically link commits/PRs to task files (if supported by Git platform)
  # NO: Manual linking required (default)

RULES:
  # Add your project-specific rules here
  # Example rules:
  # - All timestamps must be in UTC
  # - Database table and column names must use snake_case
  # - Use UUID for Primary Keys (id)
  # - Clean Architecture must be followed
  # - Always use async/await for I/O operations
  # - <Add your project-specific rules>