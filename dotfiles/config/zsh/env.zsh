# PATH
export PATH=$HOME/.local/bin:/usr/local/bin:$XDG_DATA_HOME/npm/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p \
  "$XDG_CONFIG_HOME" \
  "$XDG_DATA_HOME" \
  "$XDG_CACHE_HOME"

export ZSH=$HOME/.config/zsh
export ZSHCACHE=$HOME/.cache/zsh
export ZSH_COMPDUMP=$ZSHCACHE/zcompdump-$HOST

: ${ZSH:=$HOME/.config/zsh}
: ${ZSHCACHE:=$HOME/.cache/zsh}
mkdir -p $ZSHCACHE

# FZF
export FZF_DEFAULT_OPTS="--style full --color 16 --layout=reverse --height 30% --preview='$HOME/.config/zsh/bin/fzf-preview {}'"
export FZF_CTRL_R_OPTS="--style minimal --color 16 --info inline --no-sort --no-preview'"

