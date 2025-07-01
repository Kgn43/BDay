#!/bin/sh

# Устанавливаем trap для корректного завершения. Это необязательно, но хорошая практика.
trap "echo 'SIGTERM received, shutting down...'; exit 0" SIGTERM

# Запускаем бесконечный цикл
while true
do
  echo "Running backup job..."
  # Запускаем основной скрипт бекапа
  /usr/local/bin/backup.sh

  # Ждем 24 часа (86400 секунд) до следующего запуска
  echo "Next backup in 24 hours..."
  sleep 86400 &
  # Ждем завершения sleep или сигнала SIGTERM
  wait $!
done