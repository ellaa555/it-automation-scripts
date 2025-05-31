#!/bin/bash

# ======================================
# backup-home.sh
# Backs up the user's home directory
# into a timestamped tar.gz archive.
# ======================================

# Set variables
BACKUP_DIR="/tmp/home_backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="$BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"
SOURCE_DIR="$HOME"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Perform the backup
echo "Starting backup of $SOURCE_DIR to $BACKUP_FILE..."
tar -czf "$BACKUP_FILE" "$SOURCE_DIR"

# Confirm success
if [ $? -eq 0 ]; then
  echo "✅ Backup completed successfully!"
  echo "Backup saved to: $BACKUP_FILE"
else
  echo "❌ Backup failed."
fi

