#!/bin/bash

WORLD_PATH="./world"
LOCK_FILE="$WORLD_PATH/session.lock"

# Buscar procesos de servidor
PID=$(ps aux | grep "server-1.20.1" | grep -v grep | awk '{print $2}')

if [ -n "$PID" ]; then
  echo "⚠️ Ya hay un servidor corriendo con PID $PID. Finalízalo primero."
else
  if [ -f "$LOCK_FILE" ]; then
    echo "🗑️ Eliminando session.lock..."
    rm -f "$LOCK_FILE"
    echo "✅ Listo, ya puedes arrancar el servidor."
  else
    echo "✅ No hay session.lock, el servidor debería iniciar sin problema."
  fi
fi
