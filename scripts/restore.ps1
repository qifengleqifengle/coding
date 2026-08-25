[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$BackupPath,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'
$projectRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$absoluteBackup = (Resolve-Path -LiteralPath $BackupPath).Path
Set-Location -LiteralPath $projectRoot
. (Join-Path $PSScriptRoot 'docker-utils.ps1')

if (-not $Force) {
    $answer = Read-Host 'This overwrites current progress and submissions. Type RESTORE to continue'
    if ($answer -ne 'RESTORE') { Write-Host 'Cancelled.'; exit 0 }
}

Invoke-DockerCommand -Arguments @('compose', 'up', '-d', 'postgres')
$containerId = (Invoke-DockerCommand -Arguments @('compose', 'ps', '-q', 'postgres')).Trim()
if (-not $containerId) { throw 'PostgreSQL container not found.' }

$containerBackup = '/tmp/algo-arena-restore.dump'
try {
    Invoke-DockerCommand -Arguments @('cp', $absoluteBackup, "${containerId}:${containerBackup}")
    Invoke-DockerCommand -Arguments @('compose', 'stop', 'api', 'web')
    Invoke-DockerCommand -Arguments @('exec', $containerId, 'sh', '-c', 'pg_restore --clean --if-exists --no-owner -U "$POSTGRES_USER" -d "$POSTGRES_DB" /tmp/algo-arena-restore.dump')
} finally {
    Invoke-DockerCommand -Arguments @('exec', $containerId, 'rm', '-f', $containerBackup) -Quiet -IgnoreExitCode
    Invoke-DockerCommand -Arguments @('compose', 'up', '-d', 'api', 'web')
}

Write-Host 'Restore completed.' -ForegroundColor Green
