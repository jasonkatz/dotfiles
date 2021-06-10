#!/bin/bash

install_configs() {
    printf "🔧 Installing $1 configs...\n"

    local OLDPATH=$PWD
    cd "$1"

    . install.sh

    cd $OLDPATH > /dev/null 2>&1

    printf "\n"
}

install_dotfile() {
    printf "🔨 Installing dotfile $1...\n"
    ln -s "$1" $DOTFILES_DEST/$(basename $1) > /dev/null 2>&1
}

install_file() {
    printf "🔨 Installing $1 to $2...\n"
    ln -s "$1" "$2" > /dev/null 2>&1
}
