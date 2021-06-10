#!/bin/bash

XRESOURCES_PATH="$PWD/.Xresources" 
uninstall_file $XRESOURCES_PATH ~/$(basename $XRESOURCES_PATH)

XINITRC_PATH="$PWD/xinitrc"
uninstall_dotfile $XINITRC_PATH
