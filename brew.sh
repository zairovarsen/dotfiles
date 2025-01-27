#!/bin/bash

# Exit on error
set -e

# Existing files won't be replaced
REPLACE_FILES=false

# Get the current directory
current_path=$(pwd)

# Helper function to check if a command exists
command_exists() {
    type "$1" &>/dev/null
}

# Helper function to install oh-my-zsh
install_oh_my_zsh() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    if [ -f "$current_path/zsh/custom.zsh-theme" ]; then
        ln -sf "$current_path/zsh/custom.zsh-theme" ~/.oh-my-zsh/themes/
    fi
}

echo "Starting installation..."

# Check for Homebrew and install if not found
if ! command_exists brew; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we are using the latest Homebrew
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install essential command line tools
echo "Installing command line tools..."
PACKAGES=(
    "git"           # Version control
    "tmux"          # Terminal multiplexer
    "python3"       # Python programming language
    "htop"          # Process viewer
    "tree"          # Directory listing
    "fzf"           # Fuzzy finder
    "jq"            # JSON processor
    "coreutils"     # GNU core utilities
    "node"          # Node.js
    "stow"          # Symlink farm manager
    "zsh"           # Better shell
    "vim"           # Text editor
    "ripgrep"       # Better grep
    "fd"            # Better find
)

for package in "${PACKAGES[@]}"; do
    echo "Installing $package..."
    brew install "$package"
done

# Remove outdated versions
brew cleanup

# ZSH Configuration
echo "Configuring ZSH..."
if [ ! -d ~/.oh-my-zsh ] && command_exists zsh; then
    echo "Installing Oh My Zsh..."
    install_oh_my_zsh
fi

if [ ! -f ~/.zshrc ]; then
    echo "Creating zshrc..."
    stow -v zsh -t ~
elif $REPLACE_FILES; then
    echo "Replacing existing zshrc..."
    rm ~/.zshrc
    stow -v zsh -t ~
else
    echo "Keeping existing zshrc..."
fi

# Vim Configuration
echo "Configuring Vim..."
if [ -d "vim" ]; then
    if [ ! -f ~/.vimrc ] || $REPLACE_FILES; then
        echo "Setting up vim configuration..."
        stow -v vim -t ~
    else
        echo "Keeping existing vim configuration..."
    fi
fi

echo "Installation complete! Please restart your terminal for all changes to take effect."
