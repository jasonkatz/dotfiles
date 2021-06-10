#!/bin/bash

OLDPATH=$PWD
cd "$(dirname "$0")"

printf "🛠  Removing dotfiles package...\n\n"

DOTFILES_DEST=~/installed-dotfiles
rm -rf $DOTFILES_DEST

. ./uninstall-functions.sh

uninstall_configs bash
uninstall_configs clang-format
uninstall_configs git
uninstall_configs iterm
uninstall_configs tmux
uninstall_configs unix
uninstall_configs vim
uninstall_configs X11

printf "✅ Successfully removed dotfiles package.\n"

cd "$OLDPATH" /dev/null 2>&1
