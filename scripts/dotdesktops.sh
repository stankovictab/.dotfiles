#!/bin/bash

# Dotdesktops
echo -e "$HOME/.local/share/applications <-- \033[0;34mYour own addons,\033[0m, Gear Lever, Proton and Wine. The sync.sh script puts dotdesktops in here."
echo "/usr/share/applications/ <-- Most of the system app stuff."
echo "/var/lib/flatpak/exports/share/applications/ <-- For Flatpaks"
# Icons
echo "/home/stankovictab/.local/share/icons/ <-- Icons from KDE icon packs" 

echo "You can run the following to update the dotdesktop list of your DE :"
echo -e "\033[0;34msudo update-desktop-database\033[0m"
echo "Make sure that the app and icons are available, if something isn't correctly set, the dotdesktop won't update."

# Ask the user whether he wants to open the following directories in Dolphin

read -p "Open dotdesktops in Dolphin? [y/N] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    dolphin /usr/share/applications $HOME/.local/share/applications /var/lib/flatpak/exports/share/applications /home/stankovictab/.local/share/icons/
fi
