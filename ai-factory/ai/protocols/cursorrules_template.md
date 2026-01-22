# .cursorrules Template

This template guides Product Agent in creating project-specific `.cursorrules` file.

## File Location
- **Path:** Root `.cursorrules` (same level as ai-factory/)
- **Purpose:** Project-specific AI rules for Cursor IDE

## Content Structure

### 1. Project Overview & Architecture
- Project Name (from project.scope.md or docs/)
- Core Vision (from docs/vision.md or any documents containing vision/architecture)
- Tech Stack (from project.scope.md):
  - Backend: Technology and version
  - Frontend: Technology and version (if ACTIVE)
  - React Native: Technology and version (if ACTIVE)
  - Database: Type and version
  - Architecture Pattern: Clean Architecture, MVC, etc.

### 2. Project-Specific Rules
- Critical business rules (from any documents in root `/docs/` that contain business rules)
- Security requirements
- Data privacy rules
- Performance constraints

### 3. Coding Standards
- Naming conventions
- Code organization patterns
- Framework-specific guidelines
- Language-specific best practices

### 4. Database Guidelines
- Naming conventions (snake_case, PascalCase, etc.)
- Primary key strategy (UUID, auto-increment, etc.)
- Timestamp handling (UTC, timezone)
- Partitioning strategy (if applicable)

### 5. UI/UX Guidelines (if Frontend/React Native ACTIVE)
- Design system rules
- Color palette constraints
- Accessibility requirements
- Platform-specific guidelines

### 6. AI & Analytics Integration (if AI_ML: ACTIVE)
- AI model integration patterns
- Data analysis approaches
- Background task handling

### 7. Instructions for Cursor Agent
- Architecture alignment checks
- Security breach warnings
- Performance considerations
- Code generation guidelines

## Example Sections

```markdown
# {PROJECT_NAME} - Project-Specific AI Rules

## 1. Project Overview & Architecture
- **Name:** {PROJECT_NAME}
- **Core Vision:** {From docs/vision.md or any documents containing vision/architecture}
- **Tech Stack:**
  - Backend: {Technology and version}
  - Architecture: {Pattern}
  - Database: {Type and version}
  - UI/UX: {Technologies if ACTIVE}

## 2. The Golden Rule (Non-Negotiable)
- {Critical business rules from docs/}

## 3. Backend Coding Standards
- {Naming conventions}
- {Patterns: CQRS, Repository, etc.}
- {Framework-specific rules}

## 4. Database Schema Guidelines
- {Naming conventions}
- {Primary key strategy}
- {Timestamp handling}

## 5. UI/UX & Styling Guidelines (if applicable)
- {Design system rules}
- {Color palette}
- {Accessibility}

## 6. AI & Analytics Integration (if applicable)
- {AI integration patterns}
- {Background task handling}

## 7. Instructions for Cursor Agent
- {Architecture alignment checks}
- {Security warnings}
- {Performance considerations}
```

## Product Agent Instructions

When creating `.cursorrules`:
1. Read root `/docs/` folder for project-specific information (all files - no specific file names required)
2. Read `/ai/project.scope.md` for tech stack and rules
3. Extract architecture patterns from any documents in root `/docs/` that contain architecture information
4. Extract business rules from any documents in root `/docs/` that contain business logic
5. Extract database rules from any documents in root `/docs/` that contain database information
6. Combine all information into comprehensive `.cursorrules` file
7. Make it project-specific, not generic
8. Include all critical rules and constraints

**Note:** File names in root `/docs/` are completely free. Look for documents that contain the relevant information, regardless of their file names.
