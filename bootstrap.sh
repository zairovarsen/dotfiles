#!/bin/bash

# Update Homebrew and run brew.sh script
echo "Updating Homebrew and installing packages..."
./brew.sh

# ~ Symlinking to home directory
echo "Symlinking dotfiles using GNU Stow..."
stow zsh vim tmux git -t ~

echo "Bootstrap process complete!"
