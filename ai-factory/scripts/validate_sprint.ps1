# Sprint Validation Script (PowerShell)
# Validates sprint readiness before starting

param(
    [Parameter(Mandatory=$true)]
    [string]$SprintId
)

$Errors = 0
$Warnings = 0

Write-Host "🔍 Validating Sprint: $SprintId" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# Check required files
Write-Host "📁 Checking required files..." -ForegroundColor Yellow

# project.scope.md
$projectScopePath = "ai-factory/ai/project.scope.md"
if (-not (Test-Path $projectScopePath)) {
    Write-Host "❌ ERROR: $projectScopePath not found" -ForegroundColor Red
    $Errors++
} else {
    Write-Host "✅ project.scope.md exists" -ForegroundColor Green
    
    # Check if NAME is still placeholder
    $content = Get-Content $projectScopePath -Raw
    if ($content -match "NAME:\s*\{PROJECT_NAME\}") {
        Write-Host "⚠️  WARNING: project.scope.md NAME is still placeholder" -ForegroundColor Yellow
        $Warnings++
    }
}

# Check root docs folder
$docsPath = "docs"
if (-not (Test-Path $docsPath)) {
    Write-Host "⚠️  WARNING: root docs/ folder not found (customer documents expected here)" -ForegroundColor Yellow
    $Warnings++
} else {
    $docFiles = Get-ChildItem -Path $docsPath -Filter "*.md" -Recurse -ErrorAction SilentlyContinue
    if ($docFiles.Count -eq 0) {
        Write-Host "⚠️  WARNING: root docs/ folder is empty" -ForegroundColor Yellow
        $Warnings++
    } else {
        Write-Host "✅ root docs/ folder has $($docFiles.Count) markdown files" -ForegroundColor Green
    }
}

# Check agent files
Write-Host ""
Write-Host "🤖 Checking agent files..." -ForegroundColor Yellow
$Agents = @("product", "architect", "planner", "lead-dev", "backend", "designer", "database", "frontend", "mobile", "test-dev", "security", "ops", "ai-ml", "qa", "docs", "orchestrator")
foreach ($agent in $Agents) {
    $agentPath = "ai-factory/ai/agents/$agent.md"
    if (-not (Test-Path $agentPath)) {
        Write-Host "❌ ERROR: $agentPath not found" -ForegroundColor Red
        $Errors++
    } else {
        Write-Host "✅ $agent.md exists" -ForegroundColor Green
    }
}

# Check protocol files
Write-Host ""
Write-Host "📋 Checking protocol files..." -ForegroundColor Yellow
$Protocols = @("sprint_flow", "dependency_rules", "task_format", "sprint_initialization", "feature_management")
foreach ($protocol in $Protocols) {
    $protocolPath = "ai-factory/ai/protocols/$protocol.md"
    if (-not (Test-Path $protocolPath)) {
        Write-Host "❌ ERROR: $protocolPath not found" -ForegroundColor Red
        $Errors++
    } else {
        Write-Host "✅ $protocol.md exists" -ForegroundColor Green
    }
}

# Check if sprint folder already exists
$sprintFolderPath = "ai-factory/runs/$SprintId"
if (Test-Path $sprintFolderPath) {
    Write-Host ""
    Write-Host "⚠️  WARNING: Sprint folder $sprintFolderPath already exists" -ForegroundColor Yellow
    $Warnings++
}

# Summary
Write-Host ""
Write-Host "================================" -ForegroundColor Cyan
Write-Host "📊 Validation Summary:" -ForegroundColor Cyan
Write-Host "   Errors: $Errors" -ForegroundColor $(if ($Errors -gt 0) { "Red" } else { "Green" })
Write-Host "   Warnings: $Warnings" -ForegroundColor $(if ($Warnings -gt 0) { "Yellow" } else { "Green" })
Write-Host ""

if ($Errors -gt 0) {
    Write-Host "❌ Validation FAILED - Please fix errors before starting sprint" -ForegroundColor Red
    exit 1
} elseif ($Warnings -gt 0) {
    Write-Host "⚠️  Validation PASSED with warnings - Review warnings before proceeding" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "✅ Validation PASSED - Sprint ready to start" -ForegroundColor Green
    exit 0
}
