#!/bin/bash

# Universal script for installing and updating vital packages on *ANY* Linux distro.
# Needed for when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic (to remove or replace old installation).

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_success() {
    echo -e "${GREEN}$1${NC}"
}

print_info() {
    echo -e "${BLUE}$1${NC}"
}

print_error() {
    echo -e "${RED}$1${NC}"
}

# Confirmation function
confirm_install() {
    local program=$1
    read -p "Do you want to install/update $program? [Y/n] " response
    response=${response,,} # Convert to lowercase
    if [[ $response =~ ^(no|n)$ ]]; then
        return 1
    fi
    return 0
}

# Installation functions

install_fisher() {
    if confirm_install "Fisher"; then
        print_info "Setting up Fisher..."

        cat >fisher_setup.fish <<'EOF'
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

        fish fisher_setup.fish
        rm fisher_setup.fish
        print_success "Fisher setup completed!"
    fi
}

install_neovim() {
    if confirm_install "NeoVim"; then
        print_info "Installing/updating NeoVim..."

        wget -O nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        if [ $? -ne 0 ]; then
            print_error "Error downloading NeoVim"
            return 1
        fi

        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        if [ $? -ne 0 ]; then
            print_error "Error extracting archive"
            rm nvim-linux64.tar.gz
            return 1
        fi

        rm nvim-linux-x86_64.tar.gz
        sudo mv /opt/nvim-linux-x86_64 /opt/nvim
        sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim

        print_success "NeoVim Installed!"
        print_info "-> Make sure to run the script for the Markdown plugin!"
        print_info "-> Make sure to do :Codeium Auth!"
    fi
}

install_zellij() {
    if confirm_install "Zellij"; then
        print_info "Installing/updating Zellij..."

        wget "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
        tar -xzvf zellij-x86_64-unknown-linux-musl.tar.gz
        sudo mv zellij /usr/bin/
        rm zellij-x86_64-unknown-linux-musl.tar.gz

        print_success "Zellij Installed!"
    fi
}

install_lazygit() {
    if confirm_install "LazyGit"; then
        print_info "Installing/updating LazyGit..."

        LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
        curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
        tar xf lazygit.tar.gz lazygit
        sudo install lazygit /usr/local/bin
        rm lazygit*

        print_success "LazyGit Installed!"
    fi
}

install_lazydocker() {
    if confirm_install "LazyDocker"; then
        print_info "Installing/updating LazyDocker..."

        curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

        print_success "LazyDocker Installed!"
    fi
}

install_gdu() {
    if confirm_install "gdu"; then
        print_info "Installing/updating gdu..."

        curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
        chmod +x gdu_linux_amd64
        sudo mv gdu_linux_amd64 /usr/bin/gdu

        print_success "gdu Installed!"
    fi
}

install_1password() {
    if confirm_install "1Password"; then
        print_info "Installing/updating 1Password..."

        curl -sSO https://downloads.1password.com/linux/tar/stable/x86_64/1password-latest.tar.gz
        sudo tar -xf 1password-latest.tar.gz
        sudo rm -rf /opt/1Password
        sudo mkdir -p /opt/1Password
        sudo mv 1password-*/* /opt/1Password
        sudo /opt/1Password/after-install.sh
        sudo rm -rf 1password-*

        print_success "1Password Installed!"
    fi
}

install_1password_cli() {
    if confirm_install "1Password CLI"; then
        print_info "Installing/updating 1Password CLI..."

        wget "https://cache.agilebits.com/dist/1P/op2/pkg/v2.29.0/op_linux_amd64_v2.29.0.zip" -O op.zip
        unzip -d op op.zip
        sudo rm -rf /usr/local/bin/op
        sudo mv op/op /usr/local/bin/
        sudo rm -rf op.zip op
        sudo groupadd -f onepassword-cli
        sudo chgrp onepassword-cli /usr/local/bin/op
        sudo chmod g+s /usr/local/bin/op

        print_success "1Password CLI Installed!"
    fi
}

install_zed() {
    if confirm_install "Zed"; then
        print_info "Installing/updating Zed..."

        curl https://zed.dev/install.sh | sh

        print_success "Zed Installed!"
    fi
}

install_aws_cli() {
    if confirm_install "AWS CLI v2"; then
        print_info "Installing/updating AWS CLI v2..."

        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        nohup unzip awscliv2.zip
        sudo rm nohup.out
        sudo nohup ./aws/install
        sudo rm nohup.out
        rm awscliv2.zip && rm -rf aws/

        print_success "AWS CLI v2 Installed!"
        print_info "Remember to run 'aws configure' to set up your credentials."
    fi
}

install_kubectl() {
    if confirm_install "kubectl"; then
        print_info "Installing/updating kubectl..."

        curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
        sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
        rm kubectl
        kubectl version --client

        print_success "kubectl Installed!"
    fi
}

# Markdown previewer, both standalone and a dependency for the NeoVim plugin
install_vivify() {
    if confirm_install "vivify"; then
        print_info "Installing/updating vivify..."

        wget -O vivify-linux.tar.gz https://github.com/jannis-baum/vivify/releases/latest/download/vivify-linux.tar.gz

        if [ $? -ne 0 ]; then
            print_error "Error downloading vivify"
            return 1
        fi

        sudo mkdir -p /opt/vivify
        sudo tar -C /opt/vivify -xzf vivify-linux.tar.gz
        if [ $? -ne 0 ]; then
            print_error "Error extracting archive"
            rm vivify-linux.tar.gz
            return 1
        fi
        sudo ln -sf /opt/vivify/viv /usr/bin/viv
        sudo ln -sf /opt/vivify/vivify-server /usr/bin/vivify-server
        rm vivify-linux.tar.gz
        print_success "vivify Installed!"
    fi
}

install_opentofu_terragrunt() {
    if confirm_install "opentofu_terragrunt"; then
        print_info "Installing/updating opentofu and terragrunt..."

        # Terraform itself doesn't need to be installed, as OpenTofu handles it

        # --- OpenTofu
        # https://opentofu.org/docs/intro/install/standalone/
        # Download the installer script:
        curl --proto '=https' --tlsv1.2 -fsSL https://get.opentofu.org/install-opentofu.sh -o install-opentofu.sh
        # Alternatively: wget --secure-protocol=TLSv1_2 --https-only https://get.opentofu.org/install-opentofu.sh -O install-opentofu.sh

        # Grant execution permissions:
        chmod +x install-opentofu.sh

        # Please inspect the downloaded script at this point.

        # Run the installer:
        ./install-opentofu.sh --install-method standalone

        # Remove the installer:
        rm -f install-opentofu.sh
        print_success "OpenTofu Installed!"

        # --- Terragrunt
        wget -O terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.77.17/terragrunt_linux_amd64

        if [ $? -ne 0 ]; then
            print_error "Error downloading terragrunt"
            return 1
        fi

        chmod +x terragrunt
        sudo mv terragrunt /usr/local/bin/terragrunt
        print_success "Terragrunt Installed!"
    fi
}

# --- Main Section ---

print_info "Welcome to the manual updater! Please authenticate."
sudo -v # Allow sudo commands

if command -v pacman >/dev/null; then
    print_info "We've detected that you're on Arch Linux, for which this script is not recommended."
    print_info "As all of these packages are already available on the AUR, please run the following command to update your system :"

    # TODO: This command is not tested.
    # TODO: Things like vivify need manual intervention, idk if just the AUR package is enough
    # Think about other packages that might not be working out of the box from the AUR
    print_success "paru -S fisher nvim zellij lazygit lazydocker gdu 1password 1password-cli zed awscli kubectl vivify opentofu terragrunt"
    exit
fi

cd "/home/stankovictab/Downloads/" || exit

# Install programs
install_fisher
install_neovim
install_zellij
install_lazygit
install_lazydocker
install_gdu
install_1password
install_1password_cli
install_zed
install_aws_cli
install_kubectl
install_vivify
install_opentofu_terragrunt

print_success "All installations completed!   "

print_success "\nPlease remember to update Flatpak packages with \`flatpak update\`!"
