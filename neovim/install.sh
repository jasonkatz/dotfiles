#!/bin/bash

mkdir -p ~/.config/nvim

NVIMINIT_PATH="$PWD/init.vim"
install_file $NVIMINIT_PATH ~/.config/nvim

COCSETTINGS_PATH="$PWD/coc-settings.json"
install_file $COCSETTINGS_PATH ~/.config/nvim
