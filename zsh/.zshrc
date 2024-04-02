# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Gnu toolchain path
# export PATH="$PATH:/usr/local/opt/riscv-gnu-toolchain/bin"

# Homebrew path
export PATH=/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Default editor
export EDITOR="vim"

ZSH_THEME="powerlevel9k/powerlevel9k"

# Elements options of left prompt (remove the @username context)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)

# Elements options of right prompt
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()

plugins=(git
	zsh-syntax-highlighting
	zsh-autosuggestions
  vi-mode
)

# History 
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export CPATH=/opt/homebrew/opt/libomp/include:$CPATH
export LIBRARY_PATH=/opt/homebrew/opt/libomp/lib:$LIBRARY_PATH
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey '^F' fzf-cd-widget

export FZF_CTRL_T_OPTS="--height 60% \
--border sharp \
--layout reverse \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"

################# ALIASES #########################

alias la=tree

# Dirs
alias ..="cd .."
alias ...="cd ../.."

# GO
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# Vim
alias vim="/opt/homebrew/bin/vim"

# Ctags
alias ctags=/opt/homebrew/bin/ctags

# Shortcuts 
alias cl='clear'
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"

# Procrastination
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'


