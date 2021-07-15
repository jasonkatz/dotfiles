#!/bin/bash

BASE_PATH="$PWD/base.zsh"
install_dotfile $BASE_PATH

ALIASES_PATH="$PWD/aliases.zsh"
install_dotfile $ALIASES_PATH

COMP_PATH="$PWD/comp.zsh"
install_dotfile $COMP_PATH

EXPORTS_PATH="$PWD/exports.zsh"
install_dotfile $EXPORTS_PATH

FUNCTIONS_PATH="$PWD/functions.zsh"
install_dotfile $FUNCTIONS_PATH

INPUT_PATH="$PWD/input.zsh"
install_dotfile $INPUT_PATH

PROMPT_PATH="$PWD/prompt.zsh"
install_dotfile $PROMPT_PATH

modify_zshrc() {
    local ZSHRC=~/.zshrc

    touch $ZSHRC

    local START_TAG="DOTFILES SETUP START"
    local END_TAG="DOTFILES SETUP END"

    local ZSHRC_CONTENTS=$(cat $ZSHRC)
    if [[ ! $ZSHRC_CONTENTS =~ $START_TAG ]] && [[ ! $ZSHRC_CONTENTS =~ $END_TAG ]]; then
        printf "# $START_TAG\n" >> $ZSHRC
        printf ". $LOAD_SCRIPT_PATH\nload\n" >> $ZSHRC
        printf "startup\n" >> $ZSHRC
        printf "# $END_TAG\n" >> $ZSHRC

        printf "🏠 Added dotfiles setup to $ZSHRC\n"
    else
        printf "🚫 Cannot add dotfiles setup to $ZSHRC; start and/or end tag already exist.\n"
    fi
}

modify_zshrc
