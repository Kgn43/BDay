#!/bin/sh

# Устанавливаем переменные окружения для pg_dump
# Они будут взяты из env_file в docker-compose
# PGHOST=db
# PGUSER=admin
# PGPASSWORD=adminPasswd
# PGDATABASE=postgres

# Формат имени файла: backup_YYYY-MM-DD_HH-MM-SS.sql.gz
BACKUP_DIR="/backups"
DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE="$BACKUP_DIR/backup_${DATE}.sql.gz"

echo "Creating backup of database ${PGDATABASE}..."

# Создаем сжатый бекап с помощью pg_dump и gzip
# -h $PGHOST -U $PGUSER -d $PGDATABASE - это параметры подключения
# | gzip > $BACKUP_FILE - это сжатие и сохранение в файл
pg_dump -h $PGHOST -U $PGUSER -d $PGDATABASE --no-password --format=p --encoding "UTF8" --inserts --column-inserts | gzip > $BACKUP_FILE

# Проверка, что бекап создан успешно
if [ $? -eq 0 ]; then
  echo "Backup successful: ${BACKUP_FILE}"
else
  echo "Backup failed!"
  exit 1
fi

# Удаляем старые бекапы, оставляя последние 7
echo "Cleaning up old backups..."
find $BACKUP_DIR -name "*.sql.gz" -mtime +7 -exec rm {} \;
echo "Cleanup complete."

    