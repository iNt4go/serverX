# ┌─┐┌─┐┬ ┬┬─┐┌─┐
# ┌─┘└─┐├─┤├┬┘│  
# └─┘└─┘┴ ┴┴└─└─┘

# Powerlevel10k - Instant Prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ENV export
source $HOME/.config/zsh/env.zsh

# Aliases
source $ZSH/aliases.zsh

# Keybinds
source $ZSH/keybinds.zsh

# ZSH Options
# setopt globdots

# ZINNIT
source $ZSH/zinit.zsh

# Intigrations
source $ZSH/integrations.zsh

# History Configuration
HISTSIZE=5000
HISTFILE=$ZSHCACHE/zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' menu select
