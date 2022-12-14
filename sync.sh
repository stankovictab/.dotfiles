# This script will sync up all dotfiles' symlinks

# Files

# ln -sf ~/.dotfiles/.zshrc ~/.zshrc # Don't need zsh
# ln -sf ~/.dotfiles/.bashrc ~/.bashrc # Don't need bash

rm ~/.tmux.conf
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf 

# Folders
# Every folder has `rm -rf` to avoid the infinite loop of symlinks bug

rm -rf ~/.local/share/konsole
ln -sf ~/.dotfiles/.local/share/konsole/ ~/.local/share/konsole

# ln fails if there is no directory, so mkdir is needed (-p is so that it isn't dumb)
mkdir -p ~/.local/share/color-schemes/
ln -sf ~/.dotfiles/.local/share/color-schemes/MGZTheme.colors ~/.local/share/color-schemes/MGZTheme.colors

# Don't need zsh
# rm -rf ~/.zsh
# ln -sf ~/.dotfiles/.zsh ~/.zsh

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

# Shell for current user
mkdir -p ~/.config/fish/
ln -sf ~/.dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
rm -rf ~/.config/fish/functions
ln -sf ~/.dotfiles/.config/fish/functions ~/.config/fish/functions
ln -sf ~/.dotfiles/.config/fish/fish_variables ~/.config/fish/fish_variables
# Shell for sudo
sudo rm -rf /root/.config/fish/
sudo mkdir -p /root/.config/fish/
sudo cp -r /home/$USER/.dotfiles/.config/fish/ /root/.config/

rm -rf ~/.config/lazygit
ln -sf ~/.dotfiles/.config/lazygit ~/.config/lazygit
rm -rf ~/.config/nvim
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim

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
rm -rf ~/.config/BetterDiscord
ln -sf ~/.dotfiles/.config/BetterDiscord ~/.config/BetterDiscord
rm -rf ~/.config/htop
ln -sf ~/.dotfiles/.config/htop ~/.config/htop
rm -rf ~/.config/alacritty
ln -sf ~/.dotfiles/.config/alacritty ~/.config/alacritty
rm -rf ~/.config/qtile
ln -sf ~/.dotfiles/.config/qtile ~/.config/qtile
rm -rf ~/.config/picom
ln -sf ~/.dotfiles/.config/picom ~/.config/picom
rm -rf ~/.config/nsxiv
ln -sf ~/.dotfiles/.config/nsxiv ~/.config/nsxiv

rm -rf ~/scripts
ln -sf ~/.dotfiles/scripts ~/scripts

# Fonts
sudo cp -r ~/.dotfiles/fonts/Hack\ NF/ /usr/share/fonts/
sudo cp -r ~/.dotfiles/fonts/JetBrainsMono\ NF/ /usr/share/fonts/
sudo cp -r ~/.dotfiles/fonts/FiraCode\ NF/ /usr/share/fonts/
sudo cp -r ~/.dotfiles/fonts/RobotoMono\ NF/ /usr/share/fonts/
sudo cp ~/.dotfiles/fonts/impact.ttf /usr/share/fonts/
echo "🎉 Sync finished! 🎉"
