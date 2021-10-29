#!/bin/bash

GITCONFIG_PATH="$PWD/.gitconfig"
uninstall_file $GITCONFIG_PATH ~/$(basename $GITCONFIG_PATH)

GITIGNORE_PATH="$PWD/.gitignore_global"
uninstall_file $GITIGNORE_PATH ~/$(basename $GITIGNORE_PATH)
