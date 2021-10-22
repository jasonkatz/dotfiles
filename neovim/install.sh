#!/bin/bash

mkdir -p ~/.config/nvim

NVIMINIT_PATH="$PWD/init.vim"
install_file $NVIMINIT_PATH ~/.config/nvim
