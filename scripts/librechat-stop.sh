#!/bin/bash

echo "Stopping Librechat..."

cd "$HOME/Apps/LibreChat"

docker compose down

echo "Stopped."
