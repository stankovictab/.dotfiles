#!/usr/bin/env bash

# Universal script for installing and updating vital packages on *ANY* Linux distro.
# Needed for when devs publish releases on GitHub and don't update distro repositories.
# It's important to link the latest release, obviously, to always pull the latest one - it needs to be dynamic (to remove or replace old installation).

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

# System detection
IS_ARCH=false
AUR_HELPER=""
if command -v pacman >/dev/null; then
    IS_ARCH=true
    # Detect AUR helper
    if command -v paru >/dev/null; then
        AUR_HELPER="paru"
    fi
fi

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

print_warning() {
    echo -e "${YELLOW}$1${NC}"
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

# Try to install via AUR helper first if on Arch, returns true if successful
try_aur_install() {
    local package=$1
    if [[ "$IS_ARCH" == true && -n "$AUR_HELPER" ]]; then
        print_info "Installing/updating $package via $AUR_HELPER..."
        $AUR_HELPER -S --needed $package
        if [ $? -eq 0 ]; then
            print_success "$package installed via $AUR_HELPER."
            return 0
        else
            print_warning "$AUR_HELPER installation failed. Falling back to direct method."
            return 1
        fi
    fi
    return 1 # Not Arch or no AUR helper
}

# --- Installation Functions ---

install_fisher() {
    if confirm_install "Fisher"; then
        # Try AUR install first if on Arch
        if try_aur_install "fisher"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Setting up Fisher directly..."
        cat >setup_fisher.fish <<'EOF'
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
echo -e "\033[32mFisher Installed! \033[0m"
EOF
        fish setup_fisher.fish
        rm setup_fisher.fish
        print_success "Fisher installed!"
    fi
}

# Installing fisher plugins (which also updates)
install_fisher_plugins() {
    if confirm_install "Fisher Plugins"; then
        cat >setup_fisher_plugins.fish <<'EOF'
fisher install jorgebucaran/nvm.fish
fisher install jethrokuan/z
fisher install franciscolourenco/done
fisher install decors/fish-colors
EOF
        fish setup_fisher_plugins.fish
        rm setup_fisher_plugins.fish
        print_success "Fisher plugins installed!"
    fi
}

# Node will be set up by the Fisher plugin nvm.fish
# As fisher is only available through fish, this needs to be done through it
install_node() {
    if confirm_install "Node"; then
        cat >setup_fisher_node.fish <<'EOF'
# Installing / updating node, npm and yarn
nvm install lts
npm install -g npm yarn
set --universal nvm_default_version lts # Set the default node version to LTS for all programs
EOF
        fish setup_fisher_node.fish
        rm setup_fisher_node.fish
        print_success "Node, npm and yarn installed!"
    fi
}

install_neovim() {
    if confirm_install "NeoVim"; then
        # Try AUR install first if on Arch
        if try_aur_install "neovim"; then
            print_info "-> Make sure to run the script for the Markdown plugin!"
            print_info "-> Make sure to do :Codeium Auth!"
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating NeoVim directly..."
        wget -O nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        if [ $? -ne 0 ]; then
            print_error "Error downloading NeoVim"
            return 1
        fi

        sudo rm -rf /opt/nvim
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        if [ $? -ne 0 ]; then
            print_error "Error extracting archive"
            rm nvim-linux-x86_64.tar.gz
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
        # Try AUR install first if on Arch
        if try_aur_install "zellij"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating Zellij directly..."
        wget "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
        tar -xzvf zellij-x86_64-unknown-linux-musl.tar.gz
        sudo mv zellij /usr/bin/
        rm zellij-x86_64-unknown-linux-musl.tar.gz

        print_success "Zellij Installed!"
    fi
}

install_lazygit() {
    if confirm_install "LazyGit"; then
        # Try AUR install first if on Arch
        if try_aur_install "lazygit"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating LazyGit directly..."
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
        # Try AUR install first if on Arch
        if try_aur_install "lazydocker"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating LazyDocker directly..."
        curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

        print_success "LazyDocker Installed!"
    fi
}

install_gdu() {
    if confirm_install "gdu"; then
        # Try AUR install first if on Arch
        if try_aur_install "gdu"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating gdu directly..."
        curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
        chmod +x gdu_linux_amd64
        sudo mv gdu_linux_amd64 /usr/bin/gdu

        print_success "gdu Installed!"
    fi
}

install_1password() {
    if confirm_install "1Password"; then
        # Try AUR install first if on Arch
        if try_aur_install "1password"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating 1Password directly..."
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
        # Try AUR install first if on Arch
        if try_aur_install "1password-cli"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating 1Password CLI directly..."
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

# install_zed() {
#     if confirm_install "Zed"; then
#         # Try AUR install first if on Arch
#         if try_aur_install "zed-editor"; then
#             return 0
#         fi

#         # Fall back to direct install
#         print_info "Installing/updating Zed directly..."
#         curl https://zed.dev/install.sh | sh

#         print_success "Zed Installed!"
#     fi
# }

# AWS CLI is recommended to be installed directly, not via AUR
install_aws_cli() {
    if confirm_install "AWS CLI v2 (directly)"; then
        print_info "Installing/updating AWS CLI v2 directly (special installation method)..."
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
        # Try AUR install first if on Arch
        if try_aur_install "kubectl"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating kubectl directly..."
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
        # Try AUR install first if on Arch
        if try_aur_install "vivify-bin"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating vivify directly (special installation method)..."
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

# Terraform itself doesn't need to be installed, as OpenTofu handles it
install_opentofu() {
    if confirm_install "OpenTofu"; then
        # Try AUR install first if on Arch
        if try_aur_install "opentofu"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating OpenTofu directly..."
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
    fi
}

install_terragrunt() {
    if confirm_install "TerraGrunt"; then
        # Try AUR install first if on Arch
        if try_aur_install "terragrunt"; then
            return 0
        fi

        # Fall back to direct install
        print_info "Installing/updating terragrunt directly..."
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

if [[ "$IS_ARCH" == true ]]; then
    print_info "Detected Arch Linux. Will use AUR packages where possible."
    if [[ -n "$AUR_HELPER" ]]; then
        print_info "Using AUR helper: $AUR_HELPER"
    else
        print_warning "No AUR helper found. Will use manual installation methods."
        print_warning "Consider installing 'paru' or 'yay' for easier package management."
    fi
else
    print_info "Non-Arch Linux distro detected. Using direct installation methods."
fi

cd "/home/stankovictab/Downloads/" || exit

# Install programs
install_fisher
install_fisher_plugins
install_node
install_neovim
install_zellij
install_lazygit
install_lazydocker
install_gdu
install_1password
install_1password_cli
# install_zed
install_aws_cli
install_kubectl
install_vivify
install_opentofu
install_terragrunt

print_success "All installations completed!   "

print_success "\nPlease remember to update Flatpak packages with \`flatpak update\`!"
