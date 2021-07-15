setopt auto_cd
setopt no_case_glob
setopt correct
setopt correct_all

HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history

setopt share_history
setopt append_history
setopt inc_append_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_reduce_blanks
