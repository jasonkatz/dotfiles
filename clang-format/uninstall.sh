#!/bin/bash

CLANG_FORMAT_PATH="$PWD/clang-format.py"
uninstall_file $CLANG_FORMAT_PATH ~/$(basename $CLANG_FORMAT_PATH)
