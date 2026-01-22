#!/bin/bash
# Sprint Status Dashboard Script
# Generates a visual status report for a sprint

SPRINT_ID=$1

if [ -z "$SPRINT_ID" ]; then
    echo "Usage: ./sprint_status.sh <SPRINT_ID>"
    exit 1
fi

SPRINT_DIR="ai-factory/runs/$SPRINT_ID"

if [ ! -d "$SPRINT_DIR" ]; then
    echo "❌ Sprint folder not found: $SPRINT_DIR"
    exit 1
fi

echo "📊 Sprint Status Dashboard: $SPRINT_ID"
echo "========================================"
echo ""

# Overall Progress
echo "🎯 Overall Progress"
echo "-------------------"

# Count tasks by status
TODO_COUNT=0
IN_PROGRESS_COUNT=0
DONE_COUNT=0
BLOCKED_COUNT=0

for role in backend designer database frontend mobile test-dev security ops ai-ml; do
    TASK_DIR="$SPRINT_DIR/tasks/$role"
    if [ -d "$TASK_DIR" ]; then
        for task_file in "$TASK_DIR"/task-*.md; do
            if [ -f "$task_file" ]; then
                STATUS=$(grep "^STATUS:" "$task_file" | cut -d: -f2 | tr -d ' ')
                case "$STATUS" in
                    TODO) TODO_COUNT=$((TODO_COUNT + 1)) ;;
                    IN_PROGRESS) IN_PROGRESS_COUNT=$((IN_PROGRESS_COUNT + 1)) ;;
                    DONE) DONE_COUNT=$((DONE_COUNT + 1)) ;;
                    BLOCKED) BLOCKED_COUNT=$((BLOCKED_COUNT + 1)) ;;
                esac
            fi
        done
    fi
done

TOTAL=$((TODO_COUNT + IN_PROGRESS_COUNT + DONE_COUNT + BLOCKED_COUNT))

if [ $TOTAL -gt 0 ]; then
    DONE_PERCENT=$((DONE_COUNT * 100 / TOTAL))
    echo "Total Tasks: $TOTAL"
    echo "✅ DONE: $DONE_COUNT ($DONE_PERCENT%)"
    echo "🔄 IN_PROGRESS: $IN_PROGRESS_COUNT"
    echo "📋 TODO: $TODO_COUNT"
    echo "🚫 BLOCKED: $BLOCKED_COUNT"
    echo ""
    # Progress bar
    BAR_LENGTH=50
    FILLED=$((DONE_PERCENT * BAR_LENGTH / 100))
    printf "Progress: ["
    for i in $(seq 1 $BAR_LENGTH); do
        if [ $i -le $FILLED ]; then
            printf "█"
        else
            printf "░"
        fi
    done
    printf "] $DONE_PERCENT%%\n"
else
    echo "No tasks found"
fi

echo ""
echo "📁 Sprint Files"
echo "-------------------"

# Check key files
FILES=(
    "sprint.md:Sprint Goal"
    "product.md:Product Requirements"
    "architecture.md:Architecture"
    "api/contract.md:API Contract"
    "qa.md:QA Results"
    "sprint_report.md:Sprint Report"
)

for file_info in "${FILES[@]}"; do
    FILE_PATH=$(echo $file_info | cut -d: -f1)
    FILE_NAME=$(echo $file_info | cut -d: -f2)
    if [ -f "$SPRINT_DIR/$FILE_PATH" ]; then
        echo "✅ $FILE_NAME"
    else
        echo "❌ $FILE_NAME (missing)"
    fi
done

echo ""
echo "🚫 Blockers"
echo "-------------------"

BLOCKERS_FOUND=0
for role in backend designer database frontend mobile test-dev security ops ai-ml; do
    TASK_DIR="$SPRINT_DIR/tasks/$role"
    if [ -d "$TASK_DIR" ]; then
        for task_file in "$TASK_DIR"/task-*.md; do
            if [ -f "$task_file" ]; then
                STATUS=$(grep "^STATUS:" "$task_file" | cut -d: -f2 | tr -d ' ')
                if [ "$STATUS" = "BLOCKED" ]; then
                    TASK_ID=$(grep "^TASK_ID:" "$task_file" | cut -d: -f2 | tr -d ' ')
                    REASON=$(grep -A 5 "^BLOCKED_REASON:" "$task_file" | tail -n +2 | head -n 1)
                    echo "  - $TASK_ID: ${REASON:-No reason provided}"
                    BLOCKERS_FOUND=1
                fi
            fi
        done
    fi
done

if [ $BLOCKERS_FOUND -eq 0 ]; then
    echo "  No blockers found"
fi

echo ""
echo "📋 Next Steps"
echo "-------------------"

# Find READY tasks
READY_TASKS=0
for role in backend designer database frontend mobile test-dev security ops ai-ml; do
    TASK_DIR="$SPRINT_DIR/tasks/$role"
    if [ -d "$TASK_DIR" ]; then
        for task_file in "$TASK_DIR"/task-*.md; do
            if [ -f "$task_file" ]; then
                STATUS=$(grep "^STATUS:" "$task_file" | cut -d: -f2 | tr -d ' ')
                if [ "$STATUS" = "TODO" ]; then
                    # Check if all dependencies are DONE
                    DEPS=$(grep -A 10 "^DEPENDENCIES:" "$task_file" | grep "^-" | sed 's/^- //')
                    ALL_DEPS_DONE=1
                    for dep in $DEPS; do
                        # Find dependency task and check status
                        DEP_STATUS=""
                        for d_role in backend frontend mobile; do
                            DEP_FILE="$SPRINT_DIR/tasks/$d_role/$dep.md"
                            if [ -f "$DEP_FILE" ]; then
                                DEP_STATUS=$(grep "^STATUS:" "$DEP_FILE" | cut -d: -f2 | tr -d ' ')
                                break
                            fi
                        done
                        if [ "$DEP_STATUS" != "DONE" ] && [ -n "$DEP_STATUS" ]; then
                            ALL_DEPS_DONE=0
                            break
                        fi
                    done
                    if [ $ALL_DEPS_DONE -eq 1 ] || [ -z "$DEPS" ]; then
                        TASK_ID=$(grep "^TASK_ID:" "$task_file" | cut -d: -f2 | tr -d ' ')
                        ROLE=$(grep "^ROLE:" "$task_file" | cut -d: -f2 | tr -d ' ')
                        echo "  - $TASK_ID ($ROLE) - READY"
                        READY_TASKS=$((READY_TASKS + 1))
                    fi
                fi
            fi
        done
    fi
done

if [ $READY_TASKS -eq 0 ]; then
    echo "  No ready tasks (all tasks are DONE, BLOCKED, or waiting for dependencies)"
fi

echo ""
echo "========================================"
