#!/bin/bash
set -e

if [ ! -d neovim ]; then
    git clone --depth=1 https://github.com/neovim/neovim
else
    cd neovim
    git pull
    cd ..
fi

