# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path $ZSHCACHE/.zcompdump
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# when completing environment variables, show their values (wrapped)
# in the preview window ("<unset>" if no value/empty string)
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" fzf-flags "--preview-window=wrap" "${FZF_TAB_DEFAULT_FZF_FLAGS[@]}"
zstyle ":fzf-tab:complete:(-command-|-parameter-|-brace-parameter-|export|unset|expand):*" fzf-preview "[[ -n \${(P)word} ]] && echo \${(P)word} || echo \<unset\>"
# set prefix to prepend to each option (empty string/disabled in this case)
FZF_TAB_OPTIONS_PREFIX_STRING=
zstyle ":fzf-tab:*" prefix "${FZF_TAB_OPTIONS_PREFIX_CHAR}"
# default fzf settings to apply globally
FZF_TAB_DEFAULT_FZF_FLAGS=(
    "--height=~95%"
    "--no-exact"
)
zstyle ":fzf-tab:*" fzf-flags "${FZF_TAB_DEFAULT_FZF_FLAGS[@]}"
# clean up namespace
unset FZF_TAB_SWITCH_GROUP_FORWARD_CHAR \
      FZF_TAB_SWITCH_GROUP_BACKWARD_CHAR \
      FZF_TAB_OPTIONS_PREFIX_STRING \
      FZF_TAB_DEFAULT_FZF_FLAGS

