# Используем легковесный образ Alpine Linux
FROM alpine:latest

# Устанавливаем только клиент PostgreSQL. dcron нам больше не нужен.
RUN apk add --no-cache postgresql16-client

# Копируем ОБА скрипта внутрь контейнера
COPY backup.sh /usr/local/bin/backup.sh
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Делаем их исполняемыми
RUN chmod +x /usr/local/bin/backup.sh /usr/local/bin/entrypoint.sh

# Создаем директорию для хранения бекапов
RUN mkdir /backups

# Запускаем наш entrypoint.sh как основной процесс контейнера
CMD ["/usr/local/bin/entrypoint.sh"]