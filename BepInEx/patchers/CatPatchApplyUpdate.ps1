param(
    [int]$ProcessId,
    [string]$SourcePath,
    [string]$DestinationPath,
    [string]$LogPath
)

function Write-CatPatchLog {
    param([string]$Message)
    $stamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    Add-Content -LiteralPath $LogPath -Value "[$stamp] $Message"
}

try {
    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $LogPath) | Out-Null
    Write-CatPatchLog "Waiting for game process $ProcessId to exit."

    $process = Get-Process -Id $ProcessId -ErrorAction SilentlyContinue
    if ($process) {
        Wait-Process -Id $ProcessId -Timeout 120 -ErrorAction SilentlyContinue
    }

    Start-Sleep -Milliseconds 700

    if (!(Test-Path -LiteralPath $SourcePath)) {
        throw "Downloaded update was not found: $SourcePath"
    }

    $destinationDir = Split-Path -Parent $DestinationPath
    New-Item -ItemType Directory -Force -Path $destinationDir | Out-Null

    if (Test-Path -LiteralPath $DestinationPath) {
        Copy-Item -LiteralPath $DestinationPath -Destination ($DestinationPath + '.bak') -Force
    }

    Copy-Item -LiteralPath $SourcePath -Destination $DestinationPath -Force
    Write-CatPatchLog "Updated CatPatch.dll successfully."
    exit 0
}
catch {
    Write-CatPatchLog "Failed to update CatPatch.dll: $($_.Exception.Message)"
    exit 1
}
