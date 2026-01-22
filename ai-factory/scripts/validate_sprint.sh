#!/bin/bash
# Sprint Validation Script
# Validates sprint readiness before starting

SPRINT_ID=$1
ERRORS=0
WARNINGS=0

echo "🔍 Validating Sprint: $SPRINT_ID"
echo "================================"
echo ""

# Check if SPRINT_ID is provided
if [ -z "$SPRINT_ID" ]; then
    echo "❌ ERROR: SPRINT_ID not provided"
    echo "Usage: ./validate_sprint.sh <SPRINT_ID>"
    exit 1
fi

# Check required files
echo "📁 Checking required files..."

# project.scope.md
if [ ! -f "ai-factory/ai/project.scope.md" ]; then
    echo "❌ ERROR: ai-factory/ai/project.scope.md not found"
    ERRORS=$((ERRORS + 1))
else
    echo "✅ project.scope.md exists"
    
    # Check if NAME is still placeholder
    if grep -q "NAME: {PROJECT_NAME}" ai-factory/ai/project.scope.md; then
        echo "⚠️  WARNING: project.scope.md NAME is still placeholder"
        WARNINGS=$((WARNINGS + 1))
    fi
fi

# Check root docs folder
if [ ! -d "docs" ]; then
    echo "⚠️  WARNING: root docs/ folder not found (customer documents expected here)"
    WARNINGS=$((WARNINGS + 1))
else
    DOC_COUNT=$(find docs -type f -name "*.md" 2>/dev/null | wc -l)
    if [ "$DOC_COUNT" -eq 0 ]; then
        echo "⚠️  WARNING: root docs/ folder is empty"
        WARNINGS=$((WARNINGS + 1))
    else
        echo "✅ root docs/ folder has $DOC_COUNT markdown files"
    fi
fi

# Check agent files
echo ""
echo "🤖 Checking agent files..."
AGENTS=("product" "architect" "planner" "lead-dev" "backend" "designer" "database" "frontend" "mobile" "test-dev" "security" "ops" "ai-ml" "qa" "docs" "orchestrator")
for agent in "${AGENTS[@]}"; do
    if [ ! -f "ai-factory/ai/agents/$agent.md" ]; then
        echo "❌ ERROR: ai-factory/ai/agents/$agent.md not found"
        ERRORS=$((ERRORS + 1))
    else
        echo "✅ $agent.md exists"
    fi
done

# Check protocol files
echo ""
echo "📋 Checking protocol files..."
PROTOCOLS=("sprint_flow" "dependency_rules" "task_format" "sprint_initialization" "feature_management")
for protocol in "${PROTOCOLS[@]}"; do
    if [ ! -f "ai-factory/ai/protocols/$protocol.md" ]; then
        echo "❌ ERROR: ai-factory/ai/protocols/$protocol.md not found"
        ERRORS=$((ERRORS + 1))
    else
        echo "✅ $protocol.md exists"
    fi
done

# Check if sprint folder already exists
if [ -d "ai-factory/runs/$SPRINT_ID" ]; then
    echo ""
    echo "⚠️  WARNING: Sprint folder ai-factory/runs/$SPRINT_ID already exists"
    WARNINGS=$((WARNINGS + 1))
fi

# Summary
echo ""
echo "================================"
echo "📊 Validation Summary:"
echo "   Errors: $ERRORS"
echo "   Warnings: $WARNINGS"
echo ""

if [ $ERRORS -gt 0 ]; then
    echo "❌ Validation FAILED - Please fix errors before starting sprint"
    exit 1
elif [ $WARNINGS -gt 0 ]; then
    echo "⚠️  Validation PASSED with warnings - Review warnings before proceeding"
    exit 0
else
    echo "✅ Validation PASSED - Sprint ready to start"
    exit 0
fi
