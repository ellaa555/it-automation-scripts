# monitor-internetconnection.ps1
# Pings google.com every 60 seconds, logs downtime periods to a file.

$logFile = "$PSScriptRoot\internet_downtime.log"
$checkInterval = 60  # seconds
$target = "google.com"

function Write-Message {
    param([string]$message)
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $entry = "$timestamp - $message"
    Write-Output $entry
    Add-Content -Path $logFile -Value $entry
}

$downStart = $null

Write-Output "Starting internet connection monitor. Press Ctrl+C to stop."
Write-Message "Test log entry: Script started successfully"

while ($true) {
    $ping = Test-Connection -ComputerName $target -Count 1 -Quiet

    if (-not $ping) {
        if (-not $downStart) {
            $downStart = Get-Date
            Write-Message "Internet DOWN detected at $downStart"
        }
    }
    else {
        if ($downStart) {
            $downEnd = Get-Date
            $duration = $downEnd - $downStart
            Write-Message "Internet RESTORED at $downEnd after downtime of $([math]::Round($duration.TotalSeconds)) seconds."
            $downStart = $null
        }
    }
    Start-Sleep -Seconds $checkInterval
}
