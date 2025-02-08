#!/bin/bash

# Script for clearing cache, distro-agnostic, can be used whenever

sudo rm -rf ~/.cache/thumbnails
sudo rm -rf ~/.cache/nsxiv
sudo rm -rf ~/.cache/qimgv/thumbnails
sudo rm -rf ~/.cache/pip/http
sudo rm -rf ~/.cache/huggingface
sudo rm -rf ~/.cache/spotify/Data
sudo rm -rf ~/.var/app/com.spotify.Client/cache/spotify/Data
sudo rm -rf ~/.var/app/dev.vencord.Vesktop/config/vesktop/sessionData/Cache/Cache_Data
sudo rm -rf "/home/stankovictab/.var/app/dev.vencord.Vesktop/config/vesktop/sessionData/Code Cache"
sudo rm -rf ~/.var/app/com.discordapp.Discord/config/discord/Cache/Cache_Data

# NOTE: This removes all NeoVim cache, which means that you'll reinstall plugins on launch
read -p "Do you want to clear NeoVim cache? [Y/n] " response
# Convert response to lowercase and handle empty input (Enter) as Y
response=${response,,} # convert to lowercase
response=${response:-y} # default to y if empty
if [[ $response =~ ^[yY]$ ]]; then
    echo "Clearing NeoVim cache..."
    sudo rm -rf ~/.cache/nvim
    sudo rm -rf ~/.local/share/nvim
    sudo rm -rf ~/.local/state/nvim
    echo "NeoVim cache cleared successfully!"
else
    echo "Neovim cache not cleared."
fi

sudo rm -rf ~/.config/obsidian/GPUCache # Fixes a lot of graphical issues with Obsidian

# sudo rm -rf "/home/stankovictab/.cache/vivaldi/Default/Code Cache"
# sudo rm -rf "/home/stankovictab/.cache/vivaldi/Default/Cache"
# sudo rm -rf "/home/stankovictab/.cache/vivaldi/Profile 1/Code Cache"
# sudo rm -rf "/home/stankovictab/.cache/vivaldi/Profile 1/Cache"

# If on Arch, clear the pacman cache (old versions of packages)
if command -v paru &>/dev/null; then
    paru -Sc
else
    if command -v pacman &>/dev/null; then
        sudo pacman -Sc
    fi
fi

notify-send "Cache cleared!" "Remember to empty the trash! 🗑️"
