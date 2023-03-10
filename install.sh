#!/bin/bash

OLDPATH=$PWD
cd "$(dirname "$0")"

printf "🛠  Installing dotfiles package...\n\n"

DOTFILES_DEST=~/installed-dotfiles
mkdir -p $DOTFILES_DEST

LOAD_SCRIPT_PATH="$PWD/load.zsh"

. ./install-functions.sh

install_configs alacritty
install_configs git
install_configs iterm
install_configs neovim
install_configs powerlevel10k
install_configs tmux
install_configs unix
install_configs zsh

printf "✅ Successfully installed dotfiles package\n"

cd "$OLDPATH" /dev/null 2>&1
