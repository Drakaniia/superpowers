# Superpowers Installation Script for iFlow CLI
# This script helps install Superpowers skills, agents, commands, and hooks

param(
    [string]$IflowPath = $env:IFLOW_HOME,
    [string]$SuperpowersPath = $PSScriptRoot
)

# Validate paths
if (-not $IflowPath) {
    Write-Host "Error: IFLOW_HOME environment variable not set." -ForegroundColor Red
    Write-Host "Please set IFLOW_HOME to your iFlow CLI installation directory." -ForegroundColor Yellow
    Write-Host "Example: `$env:IFLOW_HOME = 'C:\Users\YourName\.iflow'" -ForegroundColor Yellow
    exit 1
}

if (-not (Test-Path $IflowPath)) {
    Write-Host "Error: iFlow path does not exist: $IflowPath" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path $SuperpowersPath)) {
    Write-Host "Error: Superpowers path does not exist: $SuperpowersPath" -ForegroundColor Red
    exit 1
}

# Define target directories
$SkillsTarget = Join-Path $IflowPath "skills"
$AgentsTarget = Join-Path $IflowPath "agents"
$CommandsTarget = Join-Path $IflowPath "commands"
$HooksTarget = Join-Path $IflowPath "hooks"

# Define source directories
$SkillsSource = Join-Path $SuperpowersPath "..\skills"
$AgentsSource = Join-Path $SuperpowersPath "..\agents"
$CommandsSource = Join-Path $SuperpowersPath "..\commands"
$HooksSource = Join-Path $SuperpowersPath "..\hooks"

Write-Host "Installing Superpowers to iFlow CLI..." -ForegroundColor Cyan
Write-Host "iFlow Path: $IflowPath" -ForegroundColor Gray
Write-Host "Superpowers Path: $SuperpowersPath" -ForegroundColor Gray
Write-Host ""

# Create target directories if they don't exist
Write-Host "Creating target directories..." -ForegroundColor Yellow
foreach ($dir in @($SkillsTarget, $AgentsTarget, $CommandsTarget, $HooksTarget)) {
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
        Write-Host "  Created: $dir" -ForegroundColor Green
    } else {
        Write-Host "  Exists: $dir" -ForegroundColor Gray
    }
}

# Copy Skills
Write-Host "`nCopying skills..." -ForegroundColor Yellow
if (Test-Path $SkillsSource) {
    $skills = Get-ChildItem -Path $SkillsSource -Directory
    foreach ($skill in $skills) {
        $skillTarget = Join-Path $SkillsTarget $skill.Name
        if (Test-Path (Join-Path $skill.FullName "SKILL.md")) {
            Copy-Item -Path $skill.FullName -Destination $skillTarget -Recurse -Force
            Write-Host "  ✓ Copied: $($skill.Name)" -ForegroundColor Green
        } else {
            Write-Host "  ⊘ Skipped: $($skill.Name) (no SKILL.md found)" -ForegroundColor DarkYellow
        }
    }
} else {
    Write-Host "  ⚠ Skills source not found: $SkillsSource" -ForegroundColor Yellow
}

# Copy Agents
Write-Host "`nCopying agents..." -ForegroundColor Yellow
if (Test-Path $AgentsSource) {
    $agents = Get-ChildItem -Path $AgentsSource -File
    foreach ($agent in $agents) {
        Copy-Item -Path $agent.FullName -Destination $AgentsTarget -Force
        Write-Host "  ✓ Copied: $($agent.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  ⚠ Agents source not found: $AgentsSource" -ForegroundColor Yellow
}

# Copy Commands
Write-Host "`nCopying commands..." -ForegroundColor Yellow
if (Test-Path $CommandsSource) {
    $commands = Get-ChildItem -Path $CommandsSource -File
    foreach ($command in $commands) {
        Copy-Item -Path $command.FullName -Destination $CommandsTarget -Force
        Write-Host "  ✓ Copied: $($command.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  ⚠ Commands source not found: $CommandsSource" -ForegroundColor Yellow
}

# Copy Hooks
Write-Host "`nCopying hooks..." -ForegroundColor Yellow
if (Test-Path $HooksSource) {
    $hooks = Get-ChildItem -Path $HooksSource -File
    foreach ($hook in $hooks) {
        Copy-Item -Path $hook.FullName -Destination $HooksTarget -Force
        Write-Host "  ✓ Copied: $($hook.Name)" -ForegroundColor Green
    }
} else {
    Write-Host "  ⚠ Hooks source not found: $HooksSource" -ForegroundColor Yellow
}

Write-Host "`nInstallation complete!" -ForegroundColor Cyan
Write-Host "`nTo verify the installation, start a new iFlow CLI session and try:" -ForegroundColor Yellow
Write-Host '  "Help me plan a new feature for my application"' -ForegroundColor White
Write-Host "`nThe agent should automatically invoke the relevant Superpowers skill." -ForegroundColor Gray