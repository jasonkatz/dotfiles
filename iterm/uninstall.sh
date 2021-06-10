#!/bin/bash

ITERM_DYNAMIC_PROFILES_PATH="$PWD/iterm-dynamic-profiles.json"
ITERM_DYNAMIC_PROFILES_DEST=~/Library/Application\ Support/iTerm2/DynamicProfiles/toolkit-dynamic-profiles.json
uninstall_file $ITERM_DYNAMIC_PROFILES_PATH "$ITERM_DYNAMIC_PROFILES_DEST"
