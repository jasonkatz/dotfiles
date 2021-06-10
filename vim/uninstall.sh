#!/bin/bash

VIMRC_PATH="$PWD/.vimrc"
uninstall_file $VIMRC_PATH ~/$(basename $VIMRC_PATH)

DOCKERFILE_VIM_PATH="$PWD/vimfiles/syntax/dockerfile.vim"
uninstall_file $DOCKERFILE_VIM_PATH ~/.vim/syntax/$(basename $DOCKERFILE_VIM_PATH)

MONOKAI_VIM_PATH="$PWD/vimfiles/colors/monokai.vim"
uninstall_file $MONOKAI_VIM_PATH ~/.vim/colors/$(basename $MONOKAI_VIM_PATH)
