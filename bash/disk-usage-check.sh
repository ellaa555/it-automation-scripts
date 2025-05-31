#!/bin/bash

# Checks disk usage and sends an alert if usage exceeds a specified threshold.

THRESHOLD=80 # Set the threshold percentage for disk usage

echo "Checking disk usage..."

df -g | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output; do
    usage=$(echo $output | awk '{ print $1 }' | tr -d '%')

    # Extract the partition name
    partition=$(echo $output | awk '{ print $2 }')

    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "Warning: Disk usage on $partition is at ${usage}%"
    else
        echo "Disk usage on $partition is at ${usage}%"
    fi
done

# Exit with success status
exit 0
