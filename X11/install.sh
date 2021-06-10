#!/bin/bash

XRESOURCES_PATH="$PWD/.Xresources" 
install_file $XRESOURCES_PATH ~/$(basename $XRESOURCES_PATH)

XINITRC_PATH="$PWD/xinitrc"
install_dotfile $XINITRC_PATH
