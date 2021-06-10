#!/bin/bash

ALIASES_PATH="$PWD/aliases"
uninstall_dotfile $ALIASES_PATH

EXPORTS_PATH="$PWD/exports"
uninstall_dotfile $EXPORTS_PATH

FUNCTIONS_PATH="$PWD/functions"
uninstall_dotfile $FUNCTIONS_PATH

PROMPT_PATH="$PWD/prompt"
uninstall_dotfile $PROMPT_PATH

unmodify_profile() {
    local PROFILE=~/.profile

    local START_TAG="DOTFILES SETUP START"
    local END_TAG="DOTFILES SETUP END"

    sed -i '' '/^#\ DOTFILES\ SETUP\ START/,/^#\ DOTFILES\ SETUP\ END/d' $PROFILE

    printf "🏚  Removed dotfiles setup from $PROFILE\n"
}

unmodify_profile
