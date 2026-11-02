#!/bin/bash

# TODO: need to configure post install settings so that it doesn't get spammed with errors
nvim_dir=/usr/bin/nvim

# neovim btw
if [ -d $nvim_dir  || -f $nvim_dir ]; then
    rm -r $nvim_dir
fi
sudo git clone --depth 1 --branch stable https://github.com/neovim/neovim.git $nvim_dir

sudo apt -y install cmake gettext

cd $nvim_dir

sudo make distclean
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
make install

if [ ! -d "~/.config" ]; then
    mkdir ~/.config
fi

if [ ! -d "~/.config/nvim" ]; then
    cd ~/.config
    git clone --depth 1 https://github.com/lcontreras21/init.lua.git nvim
fi

sudo apt -y install tree-sitter-cli
