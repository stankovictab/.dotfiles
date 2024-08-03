#!/bin/bash

# This is my script for installing and updating vital packages on *ANY* Linux distro. 
# Usually this happens when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic (to remove or replace old installation). 

# TODO: Add npm, node, yarn - before NeoVim!
# TODO: Rerunning gives errors I think

cd "/home/stankovictab/Downloads/" || exit

# Installing / updating NeoVim

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo mv /opt/nvim-linux64/ /opt/nvim/ # The /opt/nvim/bin folder needs to be in fish PATH
echo -e "\033[32mNeoVim Installed! \033[0m"
echo -e "\033[34mMake sure to install node, npm and yarn!\033[0m"
echo -e "\033[34mMake sure to run the script for the Markdown plugin!\033[0m"
echo -e "\033[34mMake sure to do :Codeium Auth!\033[0m"

# Installing / updating Zellij

wget "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xzvf zellij-x86_64-unknown-linux-musl.tar.gz
sudo mv zellij /usr/bin/
rm zellij-x86_64-unknown-linux-musl.tar.gz
echo -e "\033[32mZellij Installed! \033[0m"

# Installing / updating LazyGit

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit*
echo -e "\033[32mLazyGit Installed! \033[0m"

# Installing / updating LazyDocker

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
echo -e "\033[32mLazyDocker Installed! \033[0m"

# Installing / updating gdu

curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
sudo mv gdu_linux_amd64 /usr/bin/gdu
echo -e "\033[32mgdu Installed! \033[0m"

# Installing / updating 1Password

curl -sSO https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz
sudo tar -xf 1password-latest.tar.gz
sudo rm -rf /opt/1Password
sudo mkdir -p /opt/1Password
sudo mv 1password-*/* /opt/1Password
sudo /opt/1Password/after-install.sh
sudo rm -rf 1password-*
echo -e "\033[32m1Password Installed! \033[0m"

# Installing / updating 1Password CLI

# NOTE: THEY LOCK THE VERSION HERE, NO LATEST RELEASE URL
# SEE THE DOCS FOR NEWER RELEASES
wget "https://cache.agilebits.com/dist/1P/op2/pkg/v2.29.0/op_linux_amd64_v2.29.0.zip" -O op.zip
unzip -d op op.zip
sudo rm -rf /usr/local/bin/op
sudo mv op/op /usr/local/bin/
sudo rm -rf op.zip op
sudo groupadd -f onepassword-cli
sudo chgrp onepassword-cli /usr/local/bin/op
sudo chmod g+s /usr/local/bin/op
echo -e "\033[32m1Password CLI Installed! \033[0m"

# Installing / updating zed

# When installed zed does automatic updates itself
curl https://zed.dev/install.sh | sh
echo -e "\033[32mZed Installed! \033[0m"

# Installing / updating AWS CLI v2

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" 
nohup unzip awscliv2.zip
sudo rm nohup.out
sudo nohup ./aws/install # Run the script in the background so that it doesn't fill up the log
sudo rm nohup.out # NOTE: Optional, comment out if you want to see the aws install output
rm awscliv2.zip && rm -rf aws/
# Run `aws configure` and enter in your details
echo -e "\033[32mAWS CLI v2 Installed! \033[0m"

# Installing / updating kubectl

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl
kubectl version --client
echo -e "\033[32mkubectl Installed! \033[0m"
