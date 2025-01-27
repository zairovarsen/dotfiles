#!/bin/bash

# Exit on error
set -e

echo "Starting dotfiles bootstrap..."

# Update Homebrew and run brew.sh script
echo "Running brew.sh to install packages..."
chmod +x brew.sh
./brew.sh

# Stow all configuration directories
echo "Stowing configuration files..."
for dir in git tmux vim zsh; do
    if [ -d "$dir" ]; then
        echo "Stowing $dir configuration..."
        stow -v $dir -t ~
    else
        echo "Warning: $dir directory not found"
    fi
done

echo "Bootstrap complete! Please restart your terminal for all changes to take effect."
