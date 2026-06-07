#!/bin/bash

# Install zsh, nvim only
#
# curl -fsSL https://raw.githubusercontent.com/lcontreras21/.dotfiles/refs/heads/main/base_install.sh | bash

if command -v apt &> /dev/null; then
    apt-get update
    apt-get install git
fi

git clone https://github.com/lcontreras21/.dotfiles.git --depth 1 /tmp/.dotfiles
cd /tmp/.dotfiles

if [ -d "~/.oh-my-zsh" ]; then
    rm -r ~/.oh-my-zsh/
fi

./install.sh zsh
cp configs/zsh/.* ~/

./install.sh nvim
