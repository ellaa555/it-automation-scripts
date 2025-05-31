# system-health-report.ps1

# This script generates a system health report for Windows systems.
# It checks for disk space, CPU usage, memory usage, system uptime, and active users.

$report = @()

# Timestamp
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$report += "System Health Report - $timestamp"
$report += "----------------------------------------"

# CPU usage
$cpuLoad = Get-CimInstance Win32_Processor | Measure-Object -Property LoadPercentage -Average | Select-Object -ExpandProperty Average
$report += "CPU Usage: $cpuLoad%"

# Memory usage
$memory = Get-CimInstance Win32_OperatingSystem
$totalMemory = [math]::Round($memory.TotalVisibleMemorySize / 1MB, 2)
$freeMemory = [math]::Round($memory.FreePhysicalMemory / 1MB, 2)
$usedMemory = [math]::Round($totalMemory - $freeMemory, 2)
$report += "Memory Usage: $usedMemory MB used, $freeMemory MB free (Total: $totalMemory MB)"

# Disk space
$report += "Disk Space Usage:"
Get-PSDrive -PSProvider 'FileSystem' | ForEach-Object {
    $used = [math]::Round(($_.Used / 1MB), 2)
    $free = [math]::Round(($_.Free / 1MB), 2)
    $total = [math]::Round(($_.Used + $_.Free) / 1MB, 2)
    $report += " - Drive $($_.Name): $used MB used / $total MB total (Free: $free MB)"
}

# System uptime
$lastBoot = (Get-CimInstance Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $lastBoot
$report += ""
$report += "System Uptime: $([int]$uptime.TotalDays) days, $uptime.Hours hours, $uptime.Minutes minutes"

# Active users
try {
    $users = (quser 2>$null) -replace "\s{2,}", "," | ConvertFrom-Csv -Header "Username", "SessionName", "ID", "State", "IdleTime", "LogonTime"
    $usernames = ($users | Select-Object -ExpandProperty Username | Sort-Object -Unique) -join ", "
    $report += "Logged In Users: $usernames"
}
catch {
    $report += "Logged In Users: Unable to retrieve user sessions (quser not available or access denied)"
}

# Export
$exportPath = Read-Host "Enter export filename (e.g., report.txt or report.html)"
if ($exportPath -like "*.html") {
    $htmlContent = "<html><body><pre>$($report -join "`n")</pre></body></html>"
    $htmlContent | Out-File -FilePath $exportPath -Encoding utf8
    Write-Host "Report exported to $exportPath"
}
else {
    $report | Out-File -FilePath $exportPath -Encoding utf8
    Write-Host "Report exported to $exportPath"
}
