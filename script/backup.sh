#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <backup_file_path>"
    exit 1
fi

# Get the backup file path from the command-line argument
BACKUP_FILE="$1"

# MySQL connection details
DB_HOST="127.0.0.1"
DB_PORT="3306"
DB_USER="root"
DB_PASS="1"
DB_NAME="new-"

# Run the backup command
mysqldump -h ${DB_HOST} -P ${DB_PORT} -u ${DB_USER} -p${DB_PASS} ${DB_NAME} >"${BACKUP_FILE}"

# Check the exit status of the mysqldump command
if [ $? -eq 0 ]; then
    echo "Backup created successfully: ${BACKUP_FILE}"
else
    echo "Backup creation failed!"
fi
