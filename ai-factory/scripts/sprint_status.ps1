# Sprint Status Dashboard Script (PowerShell)
# Generates a visual status report for a sprint

param(
    [Parameter(Mandatory=$true)]
    [string]$SprintId
)

$SprintDir = "ai-factory/runs/$SprintId"

if (-not (Test-Path $SprintDir)) {
    Write-Host "❌ Sprint folder not found: $SprintDir" -ForegroundColor Red
    exit 1
}

Write-Host "📊 Sprint Status Dashboard: $SprintId" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Overall Progress
Write-Host "🎯 Overall Progress" -ForegroundColor Yellow
Write-Host "-------------------" -ForegroundColor Yellow

# Count tasks by status
$TodoCount = 0
$InProgressCount = 0
$DoneCount = 0
$BlockedCount = 0

$Roles = @("backend", "designer", "database", "frontend", "mobile", "test-dev", "security", "ops", "ai-ml")
foreach ($role in $Roles) {
    $TaskDir = "$SprintDir/tasks/$role"
    if (Test-Path $TaskDir) {
        $TaskFiles = Get-ChildItem -Path $TaskDir -Filter "task-*.md"
        foreach ($taskFile in $TaskFiles) {
            $Content = Get-Content $taskFile.FullName
            $StatusLine = $Content | Select-String "^STATUS:"
            if ($StatusLine) {
                $Status = ($StatusLine -split ":")[1].Trim()
                switch ($Status) {
                    "TODO" { $TodoCount++ }
                    "IN_PROGRESS" { $InProgressCount++ }
                    "DONE" { $DoneCount++ }
                    "BLOCKED" { $BlockedCount++ }
                }
            }
        }
    }
}

$Total = $TodoCount + $InProgressCount + $DoneCount + $BlockedCount

if ($Total -gt 0) {
    $DonePercent = [math]::Round(($DoneCount / $Total) * 100)
    Write-Host "Total Tasks: $Total" -ForegroundColor White
    Write-Host "✅ DONE: $DoneCount ($DonePercent%)" -ForegroundColor Green
    Write-Host "🔄 IN_PROGRESS: $InProgressCount" -ForegroundColor Yellow
    Write-Host "📋 TODO: $TodoCount" -ForegroundColor Cyan
    Write-Host "🚫 BLOCKED: $BlockedCount" -ForegroundColor Red
    Write-Host ""
    
    # Progress bar
    $BarLength = 50
    $Filled = [math]::Round(($DonePercent / 100) * $BarLength)
    Write-Host "Progress: [" -NoNewline
    for ($i = 1; $i -le $BarLength; $i++) {
        if ($i -le $Filled) {
            Write-Host "█" -NoNewline -ForegroundColor Green
        } else {
            Write-Host "░" -NoNewline -ForegroundColor Gray
        }
    }
    Write-Host "] $DonePercent%"
} else {
    Write-Host "No tasks found" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "📁 Sprint Files" -ForegroundColor Yellow
Write-Host "-------------------" -ForegroundColor Yellow

# Check key files
$Files = @(
    @{Path="sprint.md"; Name="Sprint Goal"},
    @{Path="product.md"; Name="Product Requirements"},
    @{Path="architecture.md"; Name="Architecture"},
    @{Path="api/contract.md"; Name="API Contract"},
    @{Path="qa.md"; Name="QA Results"},
    @{Path="sprint_report.md"; Name="Sprint Report"}
)

foreach ($file in $Files) {
    $FilePath = "$SprintDir/$($file.Path)"
    if (Test-Path $FilePath) {
        Write-Host "✅ $($file.Name)" -ForegroundColor Green
    } else {
        Write-Host "❌ $($file.Name) (missing)" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "🚫 Blockers" -ForegroundColor Yellow
Write-Host "-------------------" -ForegroundColor Yellow

$BlockersFound = $false
foreach ($role in $Roles) {
    $TaskDir = "$SprintDir/tasks/$role"
    if (Test-Path $TaskDir) {
        $TaskFiles = Get-ChildItem -Path $TaskDir -Filter "task-*.md"
        foreach ($taskFile in $TaskFiles) {
            $Content = Get-Content $taskFile.FullName
            $StatusLine = $Content | Select-String "^STATUS:"
            if ($StatusLine -and ($StatusLine -split ":")[1].Trim() -eq "BLOCKED") {
                $TaskIdLine = $Content | Select-String "^TASK_ID:"
                $TaskId = if ($TaskIdLine) { ($TaskIdLine -split ":")[1].Trim() } else { "Unknown" }
                $ReasonLine = $Content | Select-String "^BLOCKED_REASON:" -Context 0,5
                $Reason = if ($ReasonLine) { ($ReasonLine.Context.PostContext[0] -split ":")[0].Trim() } else { "No reason provided" }
                Write-Host "  - $TaskId : $Reason" -ForegroundColor Red
                $BlockersFound = $true
            }
        }
    }
}

if (-not $BlockersFound) {
    Write-Host "  No blockers found" -ForegroundColor Green
}

Write-Host ""
Write-Host "📋 Next Steps" -ForegroundColor Yellow
Write-Host "-------------------" -ForegroundColor Yellow

# Find READY tasks (simplified - would need more complex dependency checking)
$ReadyTasks = 0
foreach ($role in $Roles) {
    $TaskDir = "$SprintDir/tasks/$role"
    if (Test-Path $TaskDir) {
        $TaskFiles = Get-ChildItem -Path $TaskDir -Filter "task-*.md"
        foreach ($taskFile in $TaskFiles) {
            $Content = Get-Content $taskFile.FullName
            $StatusLine = $Content | Select-String "^STATUS:"
            if ($StatusLine -and ($StatusLine -split ":")[1].Trim() -eq "TODO") {
                $TaskIdLine = $Content | Select-String "^TASK_ID:"
                $TaskId = if ($TaskIdLine) { ($TaskIdLine -split ":")[1].Trim() } else { "Unknown" }
                $RoleLine = $Content | Select-String "^ROLE:"
                $TaskRole = if ($RoleLine) { ($RoleLine -split ":")[1].Trim() } else { "Unknown" }
                # Note: Full dependency check required to determine if task is actually READY
                # A task is READY only if STATUS: TODO AND all dependencies have STATUS: DONE
                # This script shows TODO tasks - verify dependencies manually or use Orchestrator Agent
                Write-Host "  - $TaskId ($TaskRole) - TODO (verify dependencies to confirm READY)" -ForegroundColor Cyan
                $ReadyTasks++
            }
        }
    }
}

if ($ReadyTasks -eq 0) {
    Write-Host "  No ready tasks (all tasks are DONE, BLOCKED, or waiting for dependencies)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
