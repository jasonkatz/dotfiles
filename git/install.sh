#!/bin/bash

GITCONFIG_PATH="$PWD/.gitconfig"
install_file $GITCONFIG_PATH ~/.gitconfig

GITIGNORE_PATH="$PWD/.gitignore_global"
install_file $GITIGNORE_PATH ~/.gitignore_global
