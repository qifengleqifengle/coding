[CmdletBinding()]
param(
    [switch]$NoBrowser
)

$ErrorActionPreference = 'Stop'
Set-Location -LiteralPath $PSScriptRoot
. (Join-Path $PSScriptRoot 'scripts\docker-utils.ps1')

function Get-LocalEnvValue([string]$Name, [string]$DefaultValue) {
    if (-not (Test-Path -LiteralPath '.env')) { return $DefaultValue }
    $line = Get-Content -LiteralPath '.env' | Where-Object { $_ -match "^$([regex]::Escape($Name))=" } | Select-Object -Last 1
    if (-not $line) { return $DefaultValue }
    return ($line -split '=', 2)[1].Trim()
}

if (-not (Get-Command docker -ErrorAction SilentlyContinue)) {
    throw 'Docker was not found. Install and start Docker Desktop: https://www.docker.com/products/docker-desktop/'
}

try { Invoke-DockerCommand -Arguments @('info') -Quiet } catch { throw 'Docker Desktop is not running. Start it and try again.' }
try { Invoke-DockerCommand -Arguments @('compose', 'version') -Quiet } catch { throw 'Docker Compose is unavailable. Update Docker Desktop.' }

if (-not (Test-Path -LiteralPath '.env')) {
    Copy-Item -LiteralPath '.env.example' -Destination '.env'
    Write-Host 'Created local configuration from .env.example.' -ForegroundColor Cyan
}

Write-Host 'Building and starting services. The first run downloads Docker images...' -ForegroundColor Cyan
Invoke-DockerCommand -Arguments @('compose', 'up', '-d', '--build')

$webPort = Get-LocalEnvValue 'WEB_PORT' '3000'
$url = "http://localhost:$webPort"
$ready = $false
for ($attempt = 1; $attempt -le 60; $attempt++) {
    try {
        $response = Invoke-WebRequest -UseBasicParsing -Uri $url -TimeoutSec 3
        if ($response.StatusCode -eq 200) { $ready = $true; break }
    } catch {
        Start-Sleep -Seconds 2
    }
}

if (-not $ready) {
    Invoke-DockerCommand -Arguments @('compose', 'ps') -IgnoreExitCode
    throw 'The service did not become ready. Run docker compose logs for details.'
}

Write-Host "Ready: $url" -ForegroundColor Green
Write-Host 'Start later: docker compose up -d. Stop: docker compose down (data is preserved).'
if (-not $NoBrowser) { Start-Process $url }
