#!/bin/bash

echo "Start backup test-DB"

# Backup file details
ROOT_DIR="/home/trantuan/docker-test-db"
DATE=$(date +%Y%m%d%H%M%S)
BACKUP_FILE="/backup/test_$DATE.sql"
BACKUP_FILE_FULL="$ROOT_DIR/$BACKUP_FILE"

echo "#### Start Backup ####"
sudo docker exec -i ec_db bash -c "bash /script/backup.sh $BACKUP_FILE"
echo "#### End Backup DB ####"

echo "#### Start Sync ####"
whoami
bash $ROOT_DIR/script/sync.sh "$BACKUP_FILE_FULL"
echo "#### End Sync ####"

echo "Process backup test-DB done!"
