#!/bin/bash
set -e # exit immediately if a command exits with a non-zero status
# Deletes files older than 30 days in the specified directory

echo "Cleaning /tmp of files older than 30 days"

find /tmp -type f -mtime +30 -exec rm -f {} \;

echo "Cleanup complete!!"

# Exit with success status
exit 0