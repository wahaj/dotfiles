# ZSH Config

# Locale Exports
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8


# XDG Exports
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="agnoster"

HISTSIZE=6000
SAVEHIST=6000

plugins=(git docker )

source $ZSH/oh-my-zsh.sh

# User configuration

# Dotfiles Config
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='nvim'
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# User Exports
export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KDEHOME="$XDG_CONFIG_HOME"/kde
export KODI_DATA="$XDG_DATA_HOME"/kodi
export NVM_DIR="$XDG_DATA_HOME"/nvm 
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

# GCloud Export
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# Path Exports
export NVM_DIR="$HOME/.local/share/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
