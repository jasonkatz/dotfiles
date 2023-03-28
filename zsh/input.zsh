autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

bindkey "^[f" forward-word
bindkey "^[b" backward-word
bindkey "^[A" beginning-of-line
bindkey "^[E" end-of-line
bindkey "^[^?" backward-kill-word
