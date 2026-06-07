#!/bin/bash

# Install zsh, nvim only
#
# curl -fsSL https://raw.githubusercontent.com/lcontreras21/.dotfiles/refs/heads/main/base_install.sh | bash


git clone https://github.com/lcontreras21/.dotfiles.git --depth 1 /tmp/.dotfiles
cd /tmp/.dotfiles

if command -v apt &> /dev/null; then
    apt-get update
fi

rm -r ~/.oh-my-zsh/
./install.sh zsh
cp configs/zsh/.* ~/

./install.sh nvim
