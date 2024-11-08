#!/bin/bash

# This is my script for installing and updating vital packages on *ANY* Linux distro. 
# Usually this happens when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic (to remove or replace old installation). 

set -euo pipefail  # Exit on error, undefined vars, and pipe failures

# Constants
DOWNLOAD_DIR="/home/stankovictab/Downloads"
TEMP_DIR=$(mktemp -d)
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"

# Helper functions
print_success() {
    echo -e "${GREEN}$1 Installed!${RESET}"
}

print_info() {
    echo -e "${BLUE}$1${RESET}"
}

cleanup() {
    cd "$DOWNLOAD_DIR"
    rm -rf "$TEMP_DIR"
}

install_node_deps() {
    # Add Node.js, npm, and yarn installation here
    curl -fsSL https://fnm.vercel.app/install | bash
    eval "$(fnm env --use-on-cd)"
    fnm install --lts
    npm install -g yarn
}

# Set up error handling and cleanup
trap cleanup EXIT

# Create and enter temporary directory
cd "$TEMP_DIR" || exit 1

# Install Node dependencies first
install_node_deps
print_success "Node.js, npm, and yarn"

# Install NeoVim
curl -fsSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo mv /opt/nvim-linux64/ /opt/nvim/
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
print_success "NeoVim"
print_info "Make sure to run the script for the Markdown plugin!"
print_info "Make sure to do :Codeium Auth!"

# Install Zellij
curl -fsSLO "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
tar -xzf zellij-x86_64-unknown-linux-musl.tar.gz
sudo install -m 755 zellij /usr/bin/
print_success "Zellij"

# Install LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -fsSLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install -m 755 lazygit /usr/local/bin/
print_success "LazyGit"

# Install LazyDocker
curl -fsSL https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
print_success "LazyDocker"

# Install gdu
curl -fsSL https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
sudo install -m 755 gdu_linux_amd64 /usr/bin/gdu
print_success "gdu"

# Install 1Password
curl -fsSO https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz
tar -xf 1password-latest.tar.gz
sudo rm -rf /opt/1Password
sudo mkdir -p /opt/1Password
sudo mv 1password-*/* /opt/1Password
sudo /opt/1Password/after-install.sh
print_success "1Password"

# Install 1Password CLI
OP_VERSION="2.29.0"  # Consider making this a variable at the top
curl -fsSLO "https://cache.agilebits.com/dist/1P/op2/pkg/v${OP_VERSION}/op_linux_amd64_v${OP_VERSION}.zip"
unzip -q op_linux_amd64_v${OP_VERSION}.zip -d op
sudo install -m 755 op/op /usr/local/bin/
sudo groupadd -f onepassword-cli
sudo chgrp onepassword-cli /usr/local/bin/op
sudo chmod g+s /usr/local/bin/op
print_success "1Password CLI"

# Install Zed
curl -fsSL https://zed.dev/install.sh | sh
print_success "Zed"

# Install AWS CLI v2
curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -q awscliv2.zip
sudo ./aws/install --update
print_success "AWS CLI v2"

# Install kubectl
KUBECTL_VERSION=$(curl -L -s https://dl.k8s.io/release/stable.txt)
curl -fsSLO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
sudo install -m 755 kubectl /usr/local/bin/
kubectl version --client
print_success "kubectl"
