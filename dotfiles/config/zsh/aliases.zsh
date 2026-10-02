
alias n='nvim'
alias y='yazi'

# CLI
alias ls='ls -1p --color --group-directories-first'
alias lsa='LC_COLLATE=C ls -Aghp --color --group-directories-first'
alias c='clear'
alias q='exit'
alias dfa='df -h /mnt/*'
alias lt='eza --tree --level 3 --long --icons --git --follow-symlinks'
alias lta='eza -A --tree --level 3 --long --icons --git --follow-symlinks'
alias tree='tree -l'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias yolo='git commit -m "$(curl -s https://whatthecommit.com/index.txt)" && git push'
alias watch='watch -t'
alias rsync-copy='rsync -avz --no-perms --progress -h'
alias rsync-move='rsync -avz --no-perms --progress -h --remove-source-files'
alias rsync-update='rsync -avzu --progress -h'
alias rsync-synchronize='rsync -avzu --delete --progress -h'
alias mkdir='mkdir -pv'
alias wget='wget --hsts-file=/dev/null'
alias sssh='ssh'
alias zshr='source "$HOME"/.zshrc'
alias fastfetch='clear && fastfetch'

# Quickedit
nalias() {
  nvim "$ZSH/aliases.zsh" && source "$ZSH/aliases.zsh"
}
alias ralias='source "$ZSH/aliases.zsh"'

# SSH
alias loki='ssh lance@loki'
alias oden='ssh lance@oden'
alias unraid='ssh root@unraid'
alias cent='ssh cent@hermes-agent-cent'
alias sylphie='ssh sylphie@hermes-agent-sylphie'

centt() {
  if [[ "$(hostname)" == "hermes-agent-cent" ]]; then
    tmux new-session -A -s MAIN
  else
    ssh -t cent@hermes-agent-cent "bash -l -c 'tmux new-session -A -s MAIN'"
  fi
}
sylphiet() {
  if [[ "$(hostname)" == "hermes-agent-sylphie" ]]; then
    tmux new-session -A -s MAIN
  else
    ssh -t sylphie@hermes-agent-sylphie "bash -l -c 'tmux new-session -A -s MAIN'"
  fi
}

alias ct=odent
alias st=sylphiet

