#!/bin/bash

INIT_PATH="$PWD/init.lua"
uninstall_file $INIT_PATH ~/.config/nvim/$(basename $INIT_PATH)

PLUGIN_DIR=~/.config/nvim/after/plugin

LSP_PATH="$PWD/after/plugin/lsp.lua"
uninstall_file $LSP_PATH $PLUGIN_DIR $(basename $LSP_PATH)

TELESCOPE_PATH="$PWD/after/plugin/telescope.lua"
uninstall_file $TELESCOPE_PATH $PLUGIN_DIR $(basename $TELESCOPE_PATH)

TREESITTER_PATH="$PWD/after/plugin/treesitter.lua"
uninstall_file $TREESITTER_PATH $PLUGIN_DIR $(basename $TREESITTER_PATH)

UNDOTREE_PATH="$PWD/after/plugin/undotree.lua"
uninstall_file $UNDOTREE_PATH $PLUGIN_DIR $(basename $UNDOTREE_PATH)

LUA_DIR=~/.config/nvim/lua/dotfiles

INIT_PATH="$PWD/lua/dotfiles/init.lua"
uninstall_file $INIT_PATH $LUA_DIR $(basename $INIT_PATH)

AUTOCMD_PATH="$PWD/lua/dotfiles/autocmd.lua"
uninstall_file $AUTOCMD_PATH $LUA_DIR $(basename $AUTOCMD_PATH)

PACKER_PATH="$PWD/lua/dotfiles/packer.lua"
uninstall_file $PACKER_PATH $LUA_DIR $(basename $PACKER_PATH)

REMAP_PATH="$PWD/lua/dotfiles/remap.lua"
uninstall_file $REMAP_PATH $LUA_DIR $(basename $REMAP_PATH)

SET_PATH="$PWD/lua/dotfiles/set.lua"
uninstall_file $SET_PATH $LUA_DIR $(basename $SET_PATH)
