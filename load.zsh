#!/bin/zsh

load() {
    local DOTFILES_LOCATION=~/installed-dotfiles
    for f in "$DOTFILES_LOCATION"/*.zsh(N); do
        source "$f"
    done
}
