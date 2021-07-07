#!/bin/bash

VIMRC_PATH="$PWD/.vimrc"
install_file $VIMRC_PATH ~/$(basename $VIMRC_PATH)

mkdir -p ~/.vim/syntax
DOCKERFILE_VIM_PATH="$PWD/vimfiles/syntax/dockerfile.vim"
install_file $DOCKERFILE_VIM_PATH ~/.vim/syntax

mkdir -p ~/.vim/colors
MONOKAI_VIM_PATH="$PWD/vimfiles/colors/monokai.vim"
install_file $MONOKAI_VIM_PATH ~/.vim/colors