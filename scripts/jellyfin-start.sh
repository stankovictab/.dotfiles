#!/bin/bash

# Script to initialize and start the Jellyfin server

JELLYFIN_DRIVE=""

# Check if the Jellyfin server is already running, if so, run the jellyfin-stop.sh script, and then start the server
if docker ps -a | grep -q jellyfin; then
  echo "Jellyfin server is already running. Stopping it..."
  bash /home/stankovictab/scripts/jellyfin-stop.sh
fi

# Ask the user if they want to initialize the Jellyfin directories
# NOTE: You need to do this at first setup, as Jellyfin will create these directories with root as the owner by default, which won't work
read -p "Do you want to initialize the Jellyfin directories? (First time setup?) [y/N] " -e -r response
response=${response:-n}  # Default to 'n' if response is empty
case "${response}" in
    [yY][eE][sS]|[yY])
        echo "Setting up folder permissions..."
        # Create directories if they don't exist
        mkdir -p /home/stankovictab/.config/jellyfin
        mkdir -p /home/stankovictab/.cache/jellyfin
        # Set the correct ownership
        sudo chown -R $(id -u):$(id -g) /home/stankovictab/.config/jellyfin
        sudo chown -R $(id -u):$(id -g) /home/stankovictab/.cache/jellyfin
        # Set the correct permissions
        chmod -R 755 /home/stankovictab/.config/jellyfin
        chmod -R 755 /home/stankovictab/.cache/jellyfin
        ;;
    [nN][oO]|[nN]|"")
        echo "Skipping directory initialization."
        ;;
    *) echo "Invalid response. Please enter 'y' or 'n'." ;;
esac

if [ $(hostname) == "Voyager" ]; then
    JELLYFIN_DRIVE="sda1"
elif [ $(hostname) == "VoyagerLab" ]; then
    JELLYFIN_DRIVE="Black Pearl"
else
    echo "hostname not in the list of supported hosts (Voyager, VoyagerLab), exiting"
    exit 1
fi
echo "Jellyfin drive is $JELLYFIN_DRIVE."

echo "Starting up Jellyfin server..."

docker run -d \
 --name jellyfin \
 --user $(id -u):$(id -g) \
 --net=host \
 --volume /home/stankovictab/.config/jellyfin:/config \
 --volume /home/stankovictab/.cache/jellyfin:/cache \
 --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Movies,target=/Movies,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/TV Shows,target=/TV Shows,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Music,target=/Music,readonly" \
 --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Music Uncategorized,target=/Music Uncategorized,readonly" \
 --restart=unless-stopped \
 jellyfin/jellyfin

# --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Standup,target=/Standup,readonly" \
# --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Manga,target=/Manga,readonly" \
# --mount "type=bind,source=/run/media/stankovictab/$JELLYFIN_DRIVE/Books,target=/Books,readonly" \

# If the previous command fails, print out an error message and exit with a non-zero status code
if [ $? -ne 0 ]; then
  echo "Failed to start Jellyfin server. Please check the logs for more information."
  exit 1
else
  echo "Jellyfin server started successfully."
fi
