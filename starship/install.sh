#!/bin/bash

STARSHIP_CONFIG_PATH="$PWD/starship.toml"
mkdir -p ~/.config
install_file $STARSHIP_CONFIG_PATH ~/.config/starship.toml
