#!/bin/bash

set -euo pipefail

# Constants
DOWNLOAD_DIR="/home/stankovictab/Downloads"
TEMP_DIR=$(mktemp -d)
GREEN="\033[32m"
BLUE="\033[34m"
RED="\033[31m"
RESET="\033[0m"

# Helper functions
print_success() {
    echo -e "${GREEN}$1 Installed!${RESET}"
}

print_info() {
    echo -e "${BLUE}$1${RESET}"
}

print_error() {
    echo -e "${RED}$1${RESET}"
}

# Progress bar function
show_progress() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

# Installation function with progress indicator
install_with_progress() {
    local name=$1
    local cmd=$2
    echo "Installing $name..."
    eval "$cmd" &>/dev/null &
    show_progress $!
    print_success "$name"
}

# Ask for confirmation
confirm_install() {
    local package=$1
    while true; do
        read -rp "Do you want to install $package? (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

cleanup() {
    cd "$DOWNLOAD_DIR"
    rm -rf "$TEMP_DIR"
}

# Set up error handling and cleanup
trap cleanup EXIT

# Create and enter temporary directory
cd "$TEMP_DIR" || exit 1

# Main installation menu
echo "Welcome to the package installer!"
echo "--------------------------------"

# Node.js and dependencies
if confirm_install "Node.js and dependencies"; then
    install_with_progress "Node.js" "
        curl -fsSL https://fnm.vercel.app/install | bash
        eval \"\$(fnm env --use-on-cd)\"
        fnm install --lts
        npm install -g yarn
    "
fi

# NeoVim
if confirm_install "NeoVim"; then
    install_with_progress "NeoVim" "
        curl -fsSLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux64.tar.gz
        sudo mv /opt/nvim-linux64/ /opt/nvim/
        sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
    "
    print_info "Make sure to run the script for the Markdown plugin!"
    print_info "Make sure to do :Codeium Auth!"
fi

# Zellij
if confirm_install "Zellij"; then
    install_with_progress "Zellij" "
        curl -fsSLO 'https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz'
        tar -xzf zellij-x86_64-unknown-linux-musl.tar.gz
        sudo install -m 755 zellij /usr/bin/
    "
fi

# LazyGit
if confirm_install "LazyGit"; then
    install_with_progress "LazyGit" "
        LAZYGIT_VERSION=\$(curl -s 'https://api.github.com/repos/jesseduffield/lazygit/releases/latest' | grep -Po '\"tag_name\": \"v\K[^\"]*')
        curl -fsSLo lazygit.tar.gz \"https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_\${LAZYGIT_VERSION}_Linux_x86_64.tar.gz\"
        tar xf lazygit.tar.gz lazygit
        sudo install -m 755 lazygit /usr/local/bin/
    "
fi

# Add similar blocks for other applications...

# Example with a different progress indicator style
if confirm_install "1Password"; then
    echo -n "Installing 1Password... "
    (
        curl -fsSO https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz
        tar -xf 1password-latest.tar.gz
        sudo rm -rf /opt/1Password
        sudo mkdir -p /opt/1Password
        sudo mv 1password-*/* /opt/1Password
        sudo /opt/1Password/after-install.sh
    ) &>/dev/null &
    
    pid=$!
    chars="⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏"
    while kill -0 $pid 2>/dev/null; do
        for (( i=0; i<${#chars}; i++ )); do
            sleep 0.1
            echo -en "\b${chars:$i:1}"
        done
    done
    echo -e "\b${GREEN}✓${RESET}"
    print_success "1Password"
fi

# Summary at the end
echo "--------------------------------"
echo "Installation complete!"
echo "Please check above for any post-installation notes."
