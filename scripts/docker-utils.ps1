function Invoke-DockerCommand {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string[]]$Arguments,
        [switch]$Quiet,
        [switch]$IgnoreExitCode
    )

    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        if ($Quiet) {
            & docker @Arguments *> $null
        } else {
            & docker @Arguments
        }
        $dockerExitCode = $LASTEXITCODE
    } finally {
        $ErrorActionPreference = $previousErrorAction
    }

    if ($dockerExitCode -ne 0 -and -not $IgnoreExitCode) {
        throw "docker $($Arguments -join ' ') failed with exit code $dockerExitCode."
    }
}
