#!/bin/bash

# This script will sync up all dotfiles' symlinks
# It is meant to be Linux distro agnostic, and able to be run at any time - it should be non-destructive
# NOTE: Don't run this script as super user! It's meant to be ran as the current user.

# ln fails if there is no directory, so mkdir -p is needed

# Check for root, as a failsafe
sudo echo -e "Root check passed!"

# Files

rm -rf ~/.bashrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc # The most basic bash config
# Don't need zsh, but if you want to use it some day, uncomment the ln commands
rm -rf ~/.zsh ~/.zshrc
# ln -sf ~/.dotfiles/.zshrc ~/.zshrc # Don't need zsh
# ln -sf ~/.dotfiles/.zsh ~/.zsh

rm -rf ~/.fzfrc
ln -sf ~/.dotfiles/.fzfrc ~/.fzfrc # fzf config and styling, sourced in shell config

rm -rf ~/.tmux.conf
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf
rm -rf ~/.shellcheckrc
ln -sf ~/.dotfiles/.shellcheckrc ~/.shellcheckrc

# Folders
# Every folder has `rm -rf` to avoid the infinite loop of symlinks bug

rm -rf ~/.local/share/konsole
ln -sf ~/.dotfiles/.local/share/konsole/ ~/.local/share/konsole

# KDE Color Schemes - custom ones go into ~/.local/share/color-schemes
# They can also be found in /usr/share/color-schemes for all users
mkdir -p ~/.local/share/color-schemes/
ln -sf ~/.dotfiles/.local/share/color-schemes/MGZTheme.colors ~/.local/share/color-schemes/MGZTheme.colors
ln -sf ~/.dotfiles/.local/share/color-schemes/Nobara.colors ~/.local/share/color-schemes/Nobara.colors

mkdir -p ~/.spicetify/Themes/
rm -rf ~/.spicetify/Themes/MGZ
ln -sf ~/.dotfiles/.spicetify/Themes/MGZ ~/.spicetify/Themes/MGZ
rm -rf ~/.spicetify/Themes/Jotaro
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro ~/.spicetify/Themes/Jotaro
rm -rf ~/.spicetify/Themes/Jotaro-Blue
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Blue ~/.spicetify/Themes/Jotaro-Blue
rm -rf ~/.spicetify/Themes/Jotaro-BnW
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-BnW ~/.spicetify/Themes/Jotaro-BnW
rm -rf ~/.spicetify/Themes/Jotaro-Desert
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Desert ~/.spicetify/Themes/Jotaro-Desert
rm -rf ~/.spicetify/Themes/Jotaro-Light
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Light ~/.spicetify/Themes/Jotaro-Light
rm -rf ~/.spicetify/Themes/Jotaro-Vapor
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Vapor ~/.spicetify/Themes/Jotaro-Vapor

ln -sf ~/.dotfiles/.config/konsolerc ~/.config/konsolerc
ln -sf ~/.dotfiles/.config/shapecornersrc ~/.config/shapecornersrc

# Fish shell for current user
rm -rf ~/.config/fish
ln -sf ~/.dotfiles/.config/fish ~/.config/fish
# Fish shell for super user
sudo rm -rf /root/.config/fish
sudo mkdir -p /root/.config/fish
sudo ln -sf /home/$USER/.dotfiles/.config/fish/ /root/.config/fish

rm -rf ~/.config/lazygit
ln -sf ~/.dotfiles/.config/lazygit ~/.config/lazygit
rm -rf ~/.config/nvim
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
rm -rf ~/.config/neovide
ln -sf ~/.dotfiles/.config/neovide ~/.config/neovide
rm -rf ~/.config/ranger
ln -sf ~/.dotfiles/.config/ranger ~/.config/ranger
mkdir -p ~/.config/spicetify/
ln -sf ~/.dotfiles/.config/spicetify/config-xpui.ini ~/.config/spicetify/config-xpui.ini
rm -rf ~/.config/micro
ln -sf ~/.dotfiles/.config/micro ~/.config/micro
rm -rf ~/.config/mpv
ln -sf ~/.dotfiles/.config/mpv ~/.config/mpv
rm -rf ~/.config/rofi
ln -sf ~/.dotfiles/.config/rofi ~/.config/rofi

rm -rf ~/.config/xournalpp/
mkdir -p ~/.config/xournalpp/
ln -sf ~/.dotfiles/.config/xournalpp/settings.xml ~/.config/xournalpp/settings.xml

mkdir -p ~/.config/Code/User/
ln -sf ~/.dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json

rm -rf ~/.config/nomacs
ln -sf ~/.dotfiles/.config/nomacs ~/.config/nomacs
rm -rf ~/.config/flameshot
ln -sf ~/.dotfiles/.config/flameshot ~/.config/flameshot
rm -rf ~/.config/htop
ln -sf ~/.dotfiles/.config/htop ~/.config/htop
rm -rf ~/.config/alacritty
ln -sf ~/.dotfiles/.config/alacritty ~/.config/alacritty
rm -rf ~/.config/wezterm
ln -sf ~/.dotfiles/.config/wezterm ~/.config/wezterm
rm -rf ~/.config/qtile
ln -sf ~/.dotfiles/.config/qtile ~/.config/qtile
rm -rf ~/.config/picom
ln -sf ~/.dotfiles/.config/picom ~/.config/picom
rm -rf ~/.config/nsxiv
ln -sf ~/.dotfiles/.config/nsxiv ~/.config/nsxiv
rm -rf ~/.config/qimgv
ln -sf ~/.dotfiles/.config/qimgv ~/.config/qimgv
rm -rf ~/.config/zellij
ln -sf ~/.dotfiles/.config/zellij ~/.config/zellij
rm -rf ~/.config/spotify-player
ln -sf ~/.dotfiles/.config/spotify-player ~/.config/spotify-player
rm -rf ~/.config/btop
ln -sf ~/.dotfiles/.config/btop ~/.config/btop
sudo rm -rf /root/.config/btop
sudo mkdir -p /root/.config/btop
sudo ln -sf /home/$USER/.dotfiles/.config/btop/ /root/.config/btop
rm -rf ~/.config/MangoHud
ln -sf ~/.dotfiles/.config/MangoHud ~/.config/MangoHud
rm -rf ~/.config/musikcube
ln -sf ~/.dotfiles/.config/musikcube ~/.config/musikcube
rm -rf ~/.config/systemd
ln -sf ~/.dotfiles/.config/systemd ~/.config/systemd
rm -rf ~/.config/zed
ln -sf ~/.dotfiles/.config/zed ~/.config/zed

rm -rf ~/scripts
ln -sf ~/.dotfiles/scripts ~/scripts
rm -rf ~/binaries
ln -sf ~/.dotfiles/binaries ~/binaries

echo -e "links created ✅"

# Fonts
sudo cp -r ~/.dotfiles/fonts/* /usr/share/fonts/

echo -e "fonts installed ✅"

# Dotdesktops
# They should go into ~/.local/share/applications/

# rm -rf ~/.local/share/applications/1Password.desktop
# ln -sf ~/.dotfiles/dotdesktops/1Password/1Password.desktop ~/.local/share/applications/1Password.desktop

# rm -rf ~/.local/share/applications/Vesktop.desktop
# ln -sf ~/.dotfiles/dotdesktops/Vesktop/Vesktop.desktop ~/.local/share/applications/Vesktop.desktop

rm -rf ~/.local/share/applications/obsidian.desktop
ln -sf ~/.dotfiles/dotdesktops/Obsidian/obsidian.desktop ~/.local/share/applications/obsidian.desktop

echo -e "dotdesktops moved ✅"

echo "🎉 Sync finished! 🎉"
