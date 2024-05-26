#!/bin/bash

# This is my script for installing and updating vital packages on any Linux distro. 
# Usually this happens when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic. 

# Installing / updating NeoVim

cd ~
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz

# Installing / updating Zellij

wget "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xzvf zellij-x86_64-unknown-linux-musl.tar.gz
sudo mv zellij /usr/bin/
rm zellij-x86_64-unknown-linux-musl.tar.gz

# Installing / updating LazyDocker

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
