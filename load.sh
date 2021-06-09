#!/bin/bash

load() {
    local DOTFILES_LOCATION=~/installed-dotfiles

    printf "🌤  Loading environment...\n\n"

    OLDPATH=$PWD
    cd "$DOTFILES_LOCATION" > /dev/null 2>&1

    for DOTFILE in `ls`
    do
        [ -f "$DOTFILE" ] && source "$DOTFILE"
        printf "$DOTFILE has run\n"
    done

    cd $OLDPATH > /dev/null 2>&1

    printf "\n☀️  Successfully loaded environment.\n"
}
