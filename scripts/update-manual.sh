#!/bin/bash

# Universal script for installing and updating vital packages on *ANY* Linux distro.
# Needed for when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic (to remove or replace old installation). 

cd "/home/stankovictab/Downloads/" || exit

echo "Welcome to the updater! Please authenticate."
sudo -v # Allow sudo commands (extend sudo timeout period)

# --- fisher installation and updates ---
# Needs to be run inside of fish shell in non-sudo mode, so a seperate fish script is needed

cat > fisher_setup.fish << 'EOF'
# Check if fisher is installed, if not install it, if yes update the plugins
if not functions -q fisher
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
    echo -e "\033[32mFisher Installed! \033[0m"

    # Installing / updating fisher plugins
    fisher install jorgebucaran/nvm.fish
    fisher install jethrokuan/z
    fisher install franciscolourenco/done
    echo -e "\033[32mFisher Plugins Installed! \033[0m"
else
    fisher update
    echo -e "\033[32mFisher Updated! \033[0m"
end

# Installing / updating node, npm and yarn
nvm install lts
npm install -g npm yarn
set --universal nvm_default_version lts # Set the default node version to LTS for all programs
echo -e "\033[32mNode LTS Installed! \033[0m"
EOF

# Execute the fish script as the current user
fish fisher_setup.fish

# Clean up the temporary fish script
rm fisher_setup.fish

# ---

# Installing / updating NeoVim

echo -e "\033[34mInstalling/updating NeoVim... \033[0m"
# Download the latest release
wget -O nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
# Check if download was successful
if [ $? -ne 0 ]; then
    echo -e "\033[31mError downloading NeoVim\033[0m"
    exit 1
fi
sudo rm -rf /opt/nvim # Remove old installation if it exists
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz # Extract the archive
# Check if extraction was successful
if [ $? -ne 0 ]; then
    echo -e "\033[31mError extracting archive\033[0m"
    rm nvim-linux64.tar.gz
    exit 1
fi
# Clean up downloaded archive
rm nvim-linux-x86_64.tar.gz
# Move to final location
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
# Create symlink (with force flag to handle existing link)
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
echo -e "\033[32mNeoVim Installed! \033[0m"
echo -e "\033[34m-> Make sure to run the script for the Markdown plugin!\033[0m"
echo -e "\033[34m-> Make sure to do :Codeium Auth!\033[0m"

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
