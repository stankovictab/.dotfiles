#!/bin/bash

# This is my script for installing and updating vital packages on *ANY* Linux distro. 
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

# Installing / updating LazyGit

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit*

# Installing / updating LazyDocker

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Installing / updating gdu

curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
sudo mv gdu_linux_amd64 /usr/bin/gdu
