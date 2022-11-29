function cdp() {
  cd "$HOME/projects/$1"
}

function _cdp() {
  ((CURRENT == 2)) &&
  _files -/ -W "$HOME/projects"
}

compdef _cdp cdp

chpwd() {
    count=$(ls | wc -l);
    if [ $count -lt 100 ]
    then
        ls;
    fi
}

txdev() {
    local DIR=`pwd`

    local SESSION_NAME=$(echo "`basename $PWD`" | sed -r 's/\./\-/g')

    tmux start-server
    tmux new-session -d -s $SESSION_NAME
    tmux split-window -h -c $DIR
    tmux rename-window 'edit'
    tmux new-window -c $DIR
    tmux split-window -h -c $DIR
    tmux rename-window 'build'
    tmux new-window -c $DIR
    tmux split-window -h -c $DIR
    tmux rename-window 'git'
    tmux select-window -t 'git'
    tmux attach-session -t $SESSION_NAME
}

buffer() {
    cat $1 > ~/public_html/text
}

reinstall() {
    bash ~/dotfiles/uninstall.sh
    printf "\n---------------------------\n\n"
    bash ~/dotfiles/install.sh
    printf "\n---------------------------\n\n"
    load
}

start_agent() {
    printf "\nInitializing new SSH agent..."
    SSH_ENV="$HOME/.ssh/environment"
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}

startup() {
    if [ -f "${SSH_ENV}" ]; then
        . "${SSH_ENV}" > /dev/null
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
        }
    else
        start_agent;
    fi

    stty -ixon
}

dbash() {
    docker exec -it $1 bash
}

kselect() {
    env=$(k config current-context | sed -nE 's/.*((dev|staging|prod)(-cde)?).*/\1/p')
    namespace=$(k ns | grep $1 | head -n 1)
    k ns $namespace
}

kexec() {
    kubectl exec --stdin --tty $1 -- /bin/sh
}

pkill() {
    kill $(lsof -t -i:$1)
}

_fix_cursor() {
   echo -ne '\x1b[\x36 q'
}

precmd_functions+=(_fix_cursor)
