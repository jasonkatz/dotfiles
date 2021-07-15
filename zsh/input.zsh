autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" up-line-or-search
bindkey "^[[B" down-line-or-search

bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^[A" beginning-of-line
bindkey "^[E" end-of-line
bindkey "^[^?" backward-kill-word
