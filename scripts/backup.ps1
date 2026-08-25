[CmdletBinding()]
param(
    [string]$OutputPath = (Join-Path $PSScriptRoot "..\backups\algo-arena-$(Get-Date -Format 'yyyyMMdd-HHmmss').dump")
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
Set-Location -LiteralPath $projectRoot
. (Join-Path $PSScriptRoot 'docker-utils.ps1')

$absoluteOutput = [IO.Path]::GetFullPath($OutputPath)
$outputDirectory = Split-Path -Parent $absoluteOutput
New-Item -ItemType Directory -Force -Path $outputDirectory | Out-Null

Invoke-DockerCommand -Arguments @('compose', 'up', '-d', 'postgres')
$containerId = (Invoke-DockerCommand -Arguments @('compose', 'ps', '-q', 'postgres')).Trim()
if (-not $containerId) { throw 'PostgreSQL container not found.' }

$containerBackup = '/tmp/algo-arena-backup.dump'
try {
    Invoke-DockerCommand -Arguments @('exec', $containerId, 'sh', '-c', 'pg_dump -U "$POSTGRES_USER" -d "$POSTGRES_DB" -Fc -f /tmp/algo-arena-backup.dump')
    Invoke-DockerCommand -Arguments @('cp', "${containerId}:${containerBackup}", $absoluteOutput)
} finally {
    Invoke-DockerCommand -Arguments @('exec', $containerId, 'rm', '-f', $containerBackup) -Quiet -IgnoreExitCode
}

Write-Host "Backup created: $absoluteOutput" -ForegroundColor Green
