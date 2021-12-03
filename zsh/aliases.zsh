# Edit dotfiles
alias config="vim ~/dotfiles"

# root
alias root="sudo -i"

# ls aliases
if [[ $(uname) =~ "Darwin" ]]; then
    alias ls="ls -F -G"
else
    alias ls="ls -F --color=always"
fi
alias l="ls"
alias la="l -a"
alias ll="l -lh"
alias lla="l -lha"
alias c="clear"
alias cl="clear; ll"
alias cla="clear; lla"

alias rm="rm -i"

alias v="nvim"

alias cml="vim CMakeLists.txt"

# git aliases
alias gst="git status -sb"
alias ga="git add"
alias gcm="git commit"
alias gam="gcm --amend --no-edit"
alias gpl="git pull"
alias gps="git push"
alias glg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gsh="git show"
alias gshn="git show --name-only"
alias gbl="git blame"
alias gbr="git branch"
alias gco="git checkout"
alias gmr="git merge"
alias gd="git diff"
alias grb="git rebase"
alias gcp="git cherry-pick"
alias grs="git reset"
alias gpr="git remote prune origin"
alias gg="git grep -n"

# tmux aliases
alias tmux="tmux -u2"
alias txl="tmux ls"
alias txn="tmux new -s"
alias txa="tmux attach -t"
alias txk="tmux kill-session -t"

# xterm alias
alias new="xterm &"

# ssh aliases
alias remote="ssh -Y jason@jasonkatz.me"

# Apache aliases
alias astop="sudo systemctl stop apache2"
alias astart="sudo systemctl start apache2"
alias arestart="sudo systemctl restart apache2"
alias areload="sudo systemctl reload apache2"

# nginx aliases
alias nstart="sudo nginx"
alias nstop="sudo nginx -s stop"
alias nrestart="sudo nginx -s stop && sudo nginx"
alias nreload="sudo nginx -s reload"

# Mongodb aliases
alias mstop="sudo service mongodb stop"
alias mstart="sudo service mongodb start"
alias mrestart="sudo service mongodb restart"

# Python aliases
alias venv="source venv/bin/activate"

# kubernetes aliases
alias k="kubectl"
alias tp="telepresence"

# terraform aliases
alias tf="terraform"
