#!/bin/bash
cd $HOME 

DOTFILES=".dotfiles"
REPO="https://github.com/lcontreras21/.dotfiles.git"

git clone --recurse-submodules ${REPO} ${DOTFILES}
cd "${HOME}/${DOTFILES}"

set -e
export PATH="$PATH:$HOME/.local/bin"

./install.sh
