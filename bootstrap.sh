#!/bin/bash
cd $HOME 

DOTFILES=".dotfiles"
REPO="https://github.com/lcontreras21/.dotfiles.git"

git clone --recurse-submodules ${REPO} ${DOTFILES}
cd "${HOME}/${DOTFILES}"

set -e
export PATH="$PATH:$HOME/.local/bin"

# Install ansible
# --break-system-packages needed here for certain systems (cough ubuntu) that are more stingy with package managers
PIP_BREAK_SYSTEM_PACKAGES=1 pip install ansible

ansible-galaxy install -r docker/requirements.yml

DEBUG=""
if [[ $# -eq 1 ]]; then
    DEBUG=$1
fi


if [ "$DEBUG" = "debug" ]; then
    ansible-playbook docker/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras"
else
    ansible-playbook docker/bootstrap.yml --ask-become-pass
fi
