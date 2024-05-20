#!/bin/bash

echo "Starting up Jellyfin server..."

docker run -d \
 --name jellyfin \
 --user $(id -u):$(id -g) \
 --net=host \
 --volume /home/stankovictab/.config/jellyfin:/config \
 --volume /home/stankovictab/.cache/jellyfin:/cache \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Movies,target=/Movies,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/TV Shows,target=/TV Shows,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Music,target=/Music,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Standup,target=/Standup,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Manga,target=/Manga,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Books,target=/Books,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/sdb2/Music Uncategorized,target=/Music Uncategorized,readonly" \
 --restart=unless-stopped \
 jellyfin/jellyfin

echo "Running!"
