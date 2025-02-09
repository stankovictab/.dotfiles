#!/bin/bash

# Check if the Jellyfin server is already running, if so, run the jellyfin-stop.sh script, and then start the server
if docker ps -a | grep -q jellyfin; then
  echo "Jellyfin server is already running. Stopping it..."
  bash /home/stankovictab/scripts/jellyfin-stop.sh
fi

echo "Starting up Jellyfin server..."

docker run -d \
 --name jellyfin \
 --user $(id -u):$(id -g) \
 --net=host \
 --volume /home/stankovictab/.config/jellyfin:/config \
 --volume /home/stankovictab/.cache/jellyfin:/cache \
 --mount "type=bind,source=/run/media/stankovictab/sda1/Movies,target=/Movies,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sda1/TV Shows,target=/TV Shows,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sda1/Music,target=/Music,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sda1/Music Uncategorized,target=/Music Uncategorized,readonly" \
 --restart=unless-stopped \
 jellyfin/jellyfin

# --mount "type=bind,source=/run/media/stankovictab/sdb2/Standup,target=/Standup,readonly" \
# --mount "type=bind,source=/run/media/stankovictab/sdb2/Manga,target=/Manga,readonly" \
# --mount "type=bind,source=/run/media/stankovictab/sdb2/Books,target=/Books,readonly" \

# If the previous command fails, print out an error message and exit with a non-zero status code
if [ $? -ne 0 ]; then
  echo "Failed to start Jellyfin server. Please check the logs for more information."
  exit 1
else
  echo "Jellyfin server started successfully."
fi
