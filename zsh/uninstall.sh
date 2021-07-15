#!/bin/bash

BASE_PATH="$PWD/base.zsh"
uninstall_dotfile $BASE_PATH

ALIASES_PATH="$PWD/aliases.zsh"
uninstall_dotfile $ALIASES_PATH

COMP_PATH="$PWD/comp.zsh"
uninstall_dotfile $COMP_PATH

EXPORTS_PATH="$PWD/exports.zsh"
uninstall_dotfile $EXPORTS_PATH

FUNCTIONS_PATH="$PWD/functions.zsh"
uninstall_dotfile $FUNCTIONS_PATH

INPUT_PATH="$PWD/input.zsh"
uninstall_dotfile $INPUT_PATH

PROMPT_PATH="$PWD/prompt"
uninstall_dotfile $PROMPT_PATH

unmodify_zshrc() {
    local ZSHRC=~/.zshrc

    local START_TAG="DOTFILES SETUP START"
    local END_TAG="DOTFILES SETUP END"

    sed -i '' '/^#\ DOTFILES\ SETUP\ START/,/^#\ DOTFILES\ SETUP\ END/d' $ZSHRC

    printf "🏚  Removed dotfiles setup from $ZSHRC\n"
}

unmodify_zshrc
