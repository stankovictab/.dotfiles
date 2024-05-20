#!/bin/bash

echo "Stopping Jellyfin..."

docker stop jellyfin
docker container rm jellyfin

echo "Stopped."
