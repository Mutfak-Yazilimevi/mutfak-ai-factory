# ai-factory/docs/ Files Template

This template guides Product Agent in creating intent layer documentation files.

## File Location
- **Path:** `/ai-factory/docs/`
- **Purpose:** Intent layer - what the project aims to achieve, not how

## Files to Create

### 1. vision.md
**Purpose:** Project vision and value proposition

**Content:**
- Project overview
- Core vision statement
- Value proposition (for different user types)
- Scientific or theoretical foundation (if applicable)
- Core motto or tagline (if exists)

**Sources:**
- Root `/docs/` folder (any documents containing vision/architecture information)
- Project name from `/ai/project.scope.md`
- Customer-provided vision documents

### 2. features.md
**Purpose:** Feature specifications

**Content:**
- Core features (main functionality)
- AI & Analytics features (if applicable)
- Operational features (multi-tenancy, localization, etc.)
- Feature categories and descriptions

**Sources:**
- Root `/docs/` folder (any documents containing feature/requirements information)
- Product requirements from customer documents
- Feature backlog from `runs/features/backlog.md` (if exists)

### 3. user_flows.md
**Purpose:** User journey flows

**Content:**
- Main user flows (step-by-step)
- Key user interactions
- User journey maps
- Critical paths (e.g., "3-second voting rule")

**Sources:**
- Root `/docs/` folder (user flow documents)
- Product requirements from customer documents
- User stories and scenarios

### 4. assumptions.md
**Purpose:** Project assumptions

**Content:**
- Technical assumptions (device capabilities, infrastructure)
- Business assumptions (user behavior, market conditions)
- User assumptions (accessibility, knowledge level)
- Data assumptions (availability, quality)

**Sources:**
- Root `/docs/` folder (assumptions documents)
- Project context from customer documents
- Inferred from project requirements

### 5. constraints.md
**Purpose:** Business and technical constraints

**Content:**
- Security & Privacy constraints (non-negotiable rules)
- UI/UX constraints (design limitations)
- Technical constraints (performance, scalability)
- Business constraints (legal, compliance)

**Sources:**
- Root `/docs/` folder (any documents containing constraints/architecture information)
- Project rules from `/ai/project.scope.md`
- Critical business rules from customer documents

## Product Agent Instructions

When creating `/ai-factory/docs/` files:

1. **Read root `/docs/` folder first:**
   - **IMPORTANT:** File names are completely free. Read ALL files in root `/docs/` folder.
   - Look for documents containing technical architecture (may contain vision)
   - Look for documents containing database information (may contain constraints)
   - Look for documents containing business logic (may contain assumptions)
   - Read any other customer-provided documents
   - **No specific file names required** - read whatever files the customer provides

2. **Extract and synthesize:**
   - Don't copy verbatim, synthesize information
   - Make it clear and actionable
   - Focus on "what" and "why", not "how"

3. **Create files in order:**
   - vision.md (foundation)
   - features.md (what the system does)
   - user_flows.md (how users interact)
   - assumptions.md (what we assume)
   - constraints.md (what we cannot do)

4. **Update policy:**
   - If files exist, only update if new information significantly changes understanding
   - Preserve existing valuable content
   - Merge new information with existing content

5. **Quality check:**
   - Each file should be comprehensive but focused
   - Information should be traceable to source documents
   - Avoid contradictions between files
