#!/bin/bash

OLDPATH=$PWD
cd "$(dirname "$0")"

printf "🛠  Installing dotfiles package...\n\n"

DOTFILES_DEST=~/installed-dotfiles
mkdir -p $DOTFILES_DEST

LOAD_SCRIPT_PATH="$PWD/load.sh"

. ./install-functions.sh

install_configs clang-format
install_configs iterm
install_configs tmux
install_configs unix
install_configs vim
install_configs X11
install_configs zsh

printf "✅ Successfully installed dotfiles package\n"

cd "$OLDPATH" /dev/null 2>&1
