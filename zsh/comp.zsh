autoload -Uz compinit && compinit

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

bindkey "^I" autosuggest-accept
bindkey "\x1b" autosuggest-clear

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/Users/jkatz97/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
