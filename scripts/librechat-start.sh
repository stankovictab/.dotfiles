#!/bin/bash

# TODO: Styles can't be changed like this. See https://github.com/danny-avila/LibreChat/issues/5389

# Script used to start the LibreChat server locally
# Can also be used to restart it

# echo "LibreChat startup script" in green
echo -e "\e[32m--- LibreChat Startup Script ---\e[0m"

mkdir -p $HOME/Apps # Create the Apps directory if it doesn't exist

# Check if the LibreChat directory exists
if [ ! -d "$HOME/Apps/LibreChat" ]; then
    echo -e "LibreChat directory '$HOME/Apps/LibreChat' not found.\n"
    read -p "Do you want to start a fresh installation? [Y/n] " -r installation

    installation=${installation,,}  # Convert input to lowercase for case-insensitive comparison
    if [[ -z "$installation" || "$installation" = "y" ]]; then
        echo -e "Installing LibreChat into '$HOME/Apps/LibreChat'..."
        cd "$HOME/Apps" && git clone https://github.com/danny-avila/LibreChat.git && cd LibreChat
        git pull && docker compose pull

        echo -e "Configuring LibreChat..."
        cp $HOME/.dotfiles/librechat/librechat.yaml $HOME/Apps/LibreChat/librechat.yaml
        cp $HOME/.dotfiles/librechat/docker-compose.override.yml $HOME/Apps/LibreChat/docker-compose.override.yml
        mv $HOME/Apps/LibreChat/client/src/style.css $HOME/Apps/LibreChat/client/src/style.css.backup
        cp $HOME/.dotfiles/librechat/client/src/style.css $HOME/Apps/LibreChat/client/src/style.css

        read -p "Enter your OpenRouter API key: " api_key
        # If the input is empty, print an error message and exit with a non-zero status code
        if [ -z "$api_key" ]; then
            echo "API key cannot be empty. Please enter a valid API key."
            exit 1
        fi
        cp $HOME/Apps/LibreChat/.env.example $HOME/Apps/LibreChat/.env
        echo "OPENROUTER_KEY=$api_key" > $HOME/Apps/LibreChat/.env.tmp
        cat $HOME/Apps/LibreChat/.env >> $HOME/Apps/LibreChat/.env.tmp
        mv $HOME/Apps/LibreChat/.env.tmp $HOME/Apps/LibreChat/.env
    elif [ "$installation" = "n" ]; then
        echo "Do you really want to live without LibreChat? Exiting..."
        exit 1
    else
        echo "Invalid input. Please enter 'y' or 'n'."
        exit 1
    fi
fi

# Will return to the current directory after the script finishes
cd $HOME/Apps/LibreChat

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
fi

# Ask whether to open the server in the default browser
read -p "Do you want to open the server in the default browser? [Y/n] " -r open
open=${open,,}  # Convert input to lowercase for case-insensitive comparison
if [[ -z "$open" || "$open" = "y" ]]; then
    echo -e "\e[32mLibreChat server started successfully!\nSleeping for 3 seconds.\nLibreChat is now running at http://localhost:3080\e[0m"
    sleep 3
    xdg-open http://localhost:3080 &>/dev/null & # Open localhost:3080 in the default browser
else
    echo "Skipping the browser opening..."
    echo -e "\e[32mLibreChat server started successfully!\nLibreChat is now running at http://localhost:3080\e[0m"
fi

echo -e "Remember to apply icons to agents from the icons/ folder."
