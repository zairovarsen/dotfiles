# Dotfiles

My personal dotfiles managed with GNU Stow. These dotfiles are designed for macOS but can be adapted for other systems.

## What's Inside

- `zsh/` - ZSH shell configuration with Oh My Zsh
- `vim/` - Vim editor configuration
- `tmux/` - Terminal multiplexer configuration
- `git/` - Git configuration and global gitignore
- `brew.sh` - Homebrew package installation script
- `bootstrap.sh` - Setup script for new machines

## Prerequisites

- macOS
- Basic command line knowledge
- Git (will be installed by the script if not present)

## Installed Packages

The `brew.sh` script will install these essential tools:

- git (Version control)
- tmux (Terminal multiplexer)
- python3 (Python programming language)
- htop (Process viewer)
- tree (Directory listing)
- fzf (Fuzzy finder)
- jq (JSON processor)
- coreutils (GNU core utilities)
- node (Node.js)
- stow (Symlink farm manager)
- zsh (Better shell)
- vim (Text editor)
- ripgrep (Better grep)
- fd (Better find)

## Quick Start

```bash
# Clone this repository
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles

# Go to the dotfiles directory
cd ~/dotfiles

# Make scripts executable
chmod +x bootstrap.sh brew.sh

# Run the bootstrap script
./bootstrap.sh
```

## Manual Installation

If you prefer to install step by step:

1. Install Homebrew packages:

```bash
./brew.sh
```

2. Create symlinks with stow:

```bash
stow git tmux vim zsh
```

## Structure

```
dotfiles/
├── git/
│   ├── .gitconfig
│   └── .gitignore
├── tmux/
│   └── .tmux.conf
├── vim/
│   └── .vimrc
├── zsh/
│   └── .zshrc
├── bootstrap.sh
├── brew.sh
└── README.md
```

## Customization

1. Fork this repository
2. Update configurations in each directory
3. Modify `brew.sh` to add/remove packages
4. Update bootstrap.sh if needed

## Adding New Configurations

1. Create a new directory for your config:

```bash
mkdir mynewconfig
```

2. Move your config file into it, maintaining the home directory structure:

```bash
# If the config file is normally at ~/.myconfig
mv ~/.myconfig mynewconfig/.myconfig
```

3. Use stow to create the symlink:

```bash
stow mynewconfig
```

## Updating

To update your configurations:

1. Make changes to the files in the dotfiles directory
2. Commit and push your changes
3. On other machines, pull the changes and re-run stow if needed:

```bash
cd ~/dotfiles
git pull
stow git tmux vim zsh  # or whichever configs you updated
```

## Credit

These dotfiles are maintained by Arsen Zairov. Feel free to use them as a starting point for your own dotfiles!
