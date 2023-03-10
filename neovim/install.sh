#!/bin/bash

mkdir -p ~/.config/nvim
INIT_PATH="$PWD/init.lua"
install_file $INIT_PATH ~/.config/nvim

PLUGIN_DIR=~/.config/nvim/after/plugin
mkdir -p $PLUGIN_DIR

LSP_PATH="$PWD/after/plugin/lsp.lua"
install_file $LSP_PATH $PLUGIN_DIR

TELESCOPE_PATH="$PWD/after/plugin/telescope.lua"
install_file $TELESCOPE_PATH $PLUGIN_DIR

TREESITTER_PATH="$PWD/after/plugin/treesitter.lua"
install_file $TREESITTER_PATH $PLUGIN_DIR

UNDOTREE_PATH="$PWD/after/plugin/undotree.lua"
install_file $UNDOTREE_PATH $PLUGIN_DIR

LUA_DIR=~/.config/nvim/lua/dotfiles
mkdir -p  $LUA_DIR

INIT_PATH="$PWD/lua/dotfiles/init.lua"
install_file $INIT_PATH $LUA_DIR

AUTOCMD_PATH="$PWD/lua/dotfiles/autocmd.lua"
install_file $AUTOCMD_PATH $LUA_DIR

PACKER_PATH="$PWD/lua/dotfiles/packer.lua"
install_file $PACKER_PATH $LUA_DIR

REMAP_PATH="$PWD/lua/dotfiles/remap.lua"
install_file $REMAP_PATH $LUA_DIR

SET_PATH="$PWD/lua/dotfiles/set.lua"
install_file $SET_PATH $LUA_DIR
