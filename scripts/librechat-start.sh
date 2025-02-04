#!/bin/bash

# NOTE: Can also be used to restart

echo "Starting up LibreChat server..."

cd /home/stankovictab/Desktop/LibreChat

echo "Updating..."
git pull && docker compose pull
echo "Starting/Restarting the server..."
docker compose down && docker compose build && docker compose up -d

# If the previous command fails, print out an error message and exit with a non-zero status code
if [ $? -ne 0 ]; then
  echo "Failed to start LibreChat server. Please check the logs for more information."
  exit 1
else
  echo "Jellyfin server started successfully."
fi

# Open localhost:3080 in the default browser
xdg-open http://localhost:3080 &
