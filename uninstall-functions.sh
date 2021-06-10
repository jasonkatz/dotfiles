#!/bin/bash

uninstall_configs() {
    printf "🔧 Removing $1 configs...\n"

    local OLDPATH=$PWD
    cd "$1"

    . uninstall.sh

    cd $OLDPATH > /dev/null 2>&1

    printf "\n"
}

uninstall_dotfile() {
    printf "🔨 Removing dotfile $1...\n"
    rm -f $DOTFILES_DEST/$(basename $1) > /dev/null 2>&1
}

uninstall_file() {
    printf "🔨 Removing $1 from $2...\n"
    rm -f "$2" > /dev/null 2>&1
}
