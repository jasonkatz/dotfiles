#!/bin/bash

NVIMINIT_PATH="$PWD/init.vim"
uninstall_file $NVIMINIT_PATH ~/.config/nvim/$(basename $NVIMINIT_PATH)

COCSETTINGS_PATH="$PWD/init.vim"
uninstall_file $COCSETTINGS_PATH ~/.config/nvim/$(basename $COCSETTINGS_PATH)
