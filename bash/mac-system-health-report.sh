#!/bin/bash

# System Health Report for macOS
timestamp=$(date "+%Y-%m-%d %H:%M:%S")
report="System Health Report - $timestamp\n"
report+="----------------------------------------\n"

# CPU Usage (1-minute average load)
cpu_load=$(uptime | awk -F'load averages?: ' '{print $2}' | cut -d' ' -f1)
report+="CPU Load (1 min average): $cpu_load\n"

# Memory Usage
mem_used=$(vm_stat | awk '
    /Pages active/ {active=$3}
    /Pages wired down/ {wired=$4}
    END {print int((active + wired) * 4096 / 1048576)}
')
mem_free=$(vm_stat | awk '/Pages free/ {print int($3 * 4096 / 1048576)}')
mem_total=$(sysctl -n hw.memsize | awk '{print int($1 / 1048576)}')
report+="Memory Usage: ${mem_used} MB used, ${mem_free} MB free (Total: ${mem_total} MB)\n"

# Disk Usage
report+="Disk Space Usage:\n"
df -h | grep '^/dev/' | while IFS= read -r line; do
device=$(echo "$line" | awk '{print $1}')
usage=$(echo "$line" | awk '{print $5}')
mountpoint=$(echo "$line" | awk '{print $6}')
report+=" - $device mounted on $mountpoint: $usage used\n"
done

# System Uptime
uptime_info=$(uptime | sed 's/.*up \([^,]*\), .*/\1/')
report+="System Uptime: $uptime_info\n"

# Logged-in Users
users=$(who | awk '{print $1}' | sort | uniq | tr '\n' ', ' | sed 's/, $//')
report+="Logged In Users: $users\n"

# Prompt for export file
read -p "Enter export filename (e.g., report.txt or report.html): " exportPath

if [[ "$exportPath" == *.html ]]; then
htmlContent="<html><body><pre>$(echo -e "$report")</pre></body></html>"
echo "$htmlContent" > "$exportPath"
echo "Report exported to $exportPath"
else
echo -e "$report" > "$exportPath"
echo "Report exported to $exportPath"
fi
