#!/bin/bash

# TODO: need to configure post install settings so that it doesn't get spammed with errors
nvim_dir=/usr/bin/nvim

# neovim btw
if [ ! -d $nvim_dir ]; then
    sudo git clone --depth 1 --branch stable https://github.com/neovim/neovim.git $nvim_dir
fi

sudo apt -y install cmake gettext

cd $nvim_dir

sudo make distclean
sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
