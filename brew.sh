
# Make sure we are using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade 

brew install git
brew install tmux
brew install python3
brew install htop3
brew install tree
brew install fzf
brew install jq

# Install GNU core utilities (those that come with macOS are outdated).
brew install coreutils
brew install node

# Remove outdated versions from the cellar.
brew cleanup
