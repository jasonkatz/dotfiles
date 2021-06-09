#!/bin/bash

ALIASES_PATH="$PWD/aliases"
install_dotfile $ALIASES_PATH

EXPORTS_PATH="$PWD/exports"
install_dotfile $EXPORTS_PATH

FUNCTIONS_PATH="$PWD/functions"
install_dotfile $FUNCTIONS_PATH

PROMPT_PATH="$PWD/prompt"
install_dotfile $PROMPT_PATH

modify_profile() {
    local PROFILE=~/.profile

    local START_TAG="DOTFILES SETUP START"
    local END_TAG="DOTFILES SETUP END"

    local PROFILE_CONTENTS=$(cat $PROFILE)
    if [[ ! $PROFILE_CONTENTS =~ $START_TAG ]] && [[ ! $PROFILE_CONTENTS =~ $END_TAG ]]; then
        printf "\n# $START_TAG\n" >> $PROFILE
        printf ". $LOAD_SCRIPT_PATH\nload\n" >> $PROFILE
        printf "startup\n" >> $PROFILE
        printf "# $END_TAG\n" >> $PROFILE

        printf "🏠 Added dotfiles setup to $PROFILE\n"
    else
        printf "🚫 Cannot add dotfiles setup to $PROFILE; start and/or end tag already exist.\n"
    fi
}

modify_profile
