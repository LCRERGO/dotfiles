# Lines configured by zsh-newuser-install
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
bindkey '^R' history-incremental-search-backward
# End of lines configured by zsh-newuser-install

# Extensions
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enabling functions
autoload -Uz compinit promptinit

# Caching compdump to a XDG directory
compinit -d "${HOME}/.local/share/zsh/zcompdump-${ZSH_VERSION}"
# Adding a XDG directory to fpath
fpath=( "${HOME}/.local/share/zsh/site-functions" $fpath )
# Using history with a XDG Specification
export HISTFILE="${HOME}/.local/state/zsh/history"

# User configuration
. "${HOME}"/.config/shell/setup
. "${HOME}"/.config/shell/aliasrc

# Starting Spaceship Prompt
promptinit
prompt spaceship

# Loading Spaceship Configuration
. "${HOME}"/.config/spaceship-prompt/config.sh
