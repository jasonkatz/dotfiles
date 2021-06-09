#!/bin/bash

mkdir ~/Library/Application\ Support/iTerm2/DynamicProfiles/ > /dev/null 2>&1

ITERM_DYNAMIC_PROFILES_PATH="$PWD/iterm-dynamic-profiles.json"
ITERM_DYNAMIC_PROFILES_DEST=~/Library/Application\ Support/iTerm2/DynamicProfiles/toolkit-dynamic-profiles.json
install_file $ITERM_DYNAMIC_PROFILES_PATH "$ITERM_DYNAMIC_PROFILES_DEST"
