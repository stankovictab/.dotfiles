# This script will sync up all dotfiles' symlinks

# Files

ln -sf ~/.dotfiles/startup.sh ~/startup.sh
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.bashrc ~/.bashrc
ln -sf ~/.dotfiles/.tmux.conf ~/.tmux.conf 

# Folders

rm -rf ~/.local/share/konsole
ln -sf ~/.dotfiles/.local/share/konsole/ ~/.local/share/konsole

ln -sf ~/.dotfiles/.local/share/color-schemes/MGZTheme.colors ~/.local/share/color-schemes/MGZTheme.colors

rm -rf ~/.zsh
ln -sf ~/.dotfiles/.zsh ~/.zsh

ln -sf ~/.dotfiles/.spicetify/Themes/MGZ ~/.spicetify/Themes/MGZ
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro ~/.spicetify/Themes/Jotaro
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Blue ~/.spicetify/Themes/Jotaro-Blue
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-BnW ~/.spicetify/Themes/Jotaro-BnW
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Desert ~/.spicetify/Themes/Jotaro-Desert
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Light ~/.spicetify/Themes/Jotaro-Light
ln -sf ~/.dotfiles/.spicetify/Themes/Jotaro-Vapor ~/.spicetify/Themes/Jotaro-Vapor

ln -sf ~/.dotfiles/.config/konsolerc ~/.config/konsolerc
ln -sf ~/.dotfiles/.config/shapecornersrc ~/.config/shapecornersrc

ln -sf ~/.dotfiles/.config/fish/config.fish ~/.config/fish/config.fish
rm -rf ~/.config/fish/functions
ln -sf ~/.dotfiles/.config/fish/functions ~/.config/fish/functions
ln -sf ~/.dotfiles/.config/fish/fish_variables ~/.config/fish/fish_variables

ln -sf ~/.dotfiles/.config/lazygit ~/.config/lazygit
ln -sf ~/.dotfiles/.config/nvim ~/.config/nvim
ln -sf ~/.dotfiles/.config/spicetify/config-xpui.ini ~/.config/spicetify/config-xpui.ini
ln -sf ~/.dotfiles/.config/micro ~/.config/micro
ln -sf ~/.dotfiles/.config/mpv ~/.config/mpv
ln -sf ~/.dotfiles/.config/Code/User/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/.config/Code/User/keybindings.json ~/.config/Code/User/keybindings.json
ln -sf ~/.dotfiles/.config/nomacs ~/.config/nomacs
ln -sf ~/.dotfiles/.config/flameshot ~/.config/flameshot
ln -sf ~/.dotfiles/.config/BetterDiscord ~/.config/BetterDiscord
ln -sf ~/.dotfiles/.config/htop ~/.config/htop
