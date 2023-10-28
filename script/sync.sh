#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <backup_file_path>"
    exit 1
fi

# Get the backup file path from the command-line argument
BACKUP_FILE="$1"

# Rsync backup file to another server
REMOTE_USER="test"
REMOTE_HOST="192.168.1.9"
REMOTE_DIR="/home/test/backup/test_db"

rsync -avz -e ssh "${BACKUP_FILE}" ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}
if [ $? -eq 0 ]; then
    echo "Backup file successfully transferred to remote server."

    # Delete local backup file
    sudo rm "${BACKUP_FILE}"
    echo "Local backup file deleted."
else
    echo "Failed to transfer the backup file to the remote server."
fi
