#!/bin/bash
cd $HOME 

DOTFILES=".dotfiles"
REPO="https://github.com/lcontreras21/.dotfiles.git"

# TODO: remove branch arg when on Prod
git clone -b ansible-izing --recurse-submodules ${REPO} ${DOTFILES}
cd "${HOME}/${DOTFILES}"

set -e
export PATH="$PATH:$HOME/.local/bin"

# Install ansible
# --break-system-packages needed here for certain systems (cough ubuntu) that are more stingy with package managers
PIP_BREAK_SYSTEM_PACKAGES=1 pip install ansible

ansible-galaxy install -r docker/requirements.yml

# TODO: Use ask-become pass command on Prod or use some sort of test env
# ansible-playbook docker/bootstrap.yml --ask-become-pass

ansible-playbook docker/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras"
