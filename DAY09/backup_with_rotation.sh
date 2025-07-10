#!/bin/bash

# Exit if any command fails
set -e

# Check for directory argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

SOURCE_DIR="$1"

# Ensure it's a valid directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: '$SOURCE_DIR' is not a valid directory."
    exit 1
fi

# Get the base name of the directory (e.g., 'mydata')
DIR_NAME=$(basename "$SOURCE_DIR")

# Create timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup directory path
BACKUP_NAME="backup_${TIMESTAMP}"
BACKUP_DIR="$SOURCE_DIR/$BACKUP_NAME"

# Create the backup by copying contents
mkdir -p "$BACKUP_DIR"

# Use rsync to copy everything except backup folders
# rsync safely avoids copying the backup folder into itself.
rsync -a --exclude="${DIR_NAME}_backup_*" "$SOURCE_DIR/" "$BACKUP_DIR/"

echo "Backup created at: $BACKUP_DIR"

# Implement rotation: keep only the 3 most recent backups
cd "$SOURCE_DIR"
ls -dt ${DIR_NAME}_backup_* 2>/dev/null | tail -n +4 | xargs -d '\n' rm -rf --

echo "Rotation complete. Only the 3 most recent backups are retained."

