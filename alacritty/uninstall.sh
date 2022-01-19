#!/bin/bash

ALACRITTY_CONFIG_PATH="$PWD/alacritty.yml"
uninstall_file $ALACRITTY_CONFIG_PATH ~/$(basename $ALACRITTY_CONFIG_PATH)
