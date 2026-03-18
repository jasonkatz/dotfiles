#!/bin/bash

OLDPATH=$PWD
cd "$(dirname "$0")"

printf "🛠  Removing dotfiles package...\n\n"

DOTFILES_DEST=~/installed-dotfiles
rm -rf $DOTFILES_DEST

. ./uninstall-functions.sh

uninstall_configs alacritty
uninstall_configs git
uninstall_configs iterm
uninstall_configs neovim
uninstall_configs tmux
uninstall_configs unix
uninstall_configs starship
uninstall_configs zsh

printf "✅ Successfully removed dotfiles package.\n"

cd "$OLDPATH" /dev/null 2>&1
