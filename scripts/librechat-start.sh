#!/bin/bash

# Script used to start the LibreChat server locally
# Can also be used to restart it

echo "Starting up LibreChat server..."

# Check if the LibreChat directory exists
if [ ! -d "/home/stankovictab/Desktop/LibreChat" ]; then
    echo "LibreChat directory not found. Please make sure it exists and and that LibreChat is configured, and try again."
    exit 1
fi

# Will return to the current directory after the script finishes
cd /home/stankovictab/Desktop/LibreChat

# Ask if the user wants to update the server
read -p "Do you want to update the server? [Y/n] " -r update
update=${update,,}  # Convert input to lowercase for case-insensitive comparison
if [[ -z "$update" || "$update" = "y" ]]; then
    echo "Updating..."
    git pull && docker compose pull
elif [ "$update" = "n" ]; then
    echo "Skipping the update..."
else
    echo "Invalid input. Please enter 'y' or 'n'."
    exit 1
fi

echo "Starting/Restarting the server..."
docker compose down && docker compose build && docker compose up -d

# If the previous command fails, print out an error message and exit with a non-zero status code
if [ $? -ne 0 ]; then
    echo "Failed to start LibreChat server. Please check the logs for more information."
    exit 1
else
    echo "LibreChat server started successfully. Sleeping for 2 seconds before opening the browser..."
    sleep 2
fi

# Open localhost:3080 in the default browser
xdg-open http://localhost:3080 &>/dev/null &
