#!/bin/bash

TMUX_CONF_PATH="$PWD/.tmux.conf"
uninstall_file $TMUX_CONF_PATH ~/$(basename $TMUX_CONF_PATH)

TMUX_CONF_LOCAL_PATH="$PWD/.tmux.conf.local"
uninstall_file $TMUX_CONF_LOCAL_PATH ~/$(basename $TMUX_CONF_LOCAL_PATH)
