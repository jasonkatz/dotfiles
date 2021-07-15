cd() {
    builtin cd "$@"
    count=$(ls | wc -l);
    if [ $count -lt 100 ]
    then
        ls;
    fi
}

txdev() {
    local DIR=`pwd`

    tmux start-server
    tmux new-session -d -s $1
    tmux split-window -h -c $DIR
    tmux rename-window 'edit'
    tmux new-window -c $DIR
    tmux split-window -h -c $DIR
    tmux rename-window 'build'
    tmux new-window -c $DIR
    tmux split-window -h -c $DIR
    tmux rename-window 'git'
    tmux select-window -t 'git'
    tmux attach-session -t $1
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
