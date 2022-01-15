# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install

# Extensions
. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Adding a XDG directory to fpath
fpath=( "${HOME}/.local/share/zsh/site-functions" $fpath )

# User configuration
. "${HOME}"/.config/shell/setup
. "${HOME}"/.config/shell/aliasrc

# Starting Spaceship Prompt
autoload -U promptinit; promptinit
prompt spaceship

# Loading Spaceship Configuration
. "${HOME}"/.config/spaceship-prompt/config.sh
