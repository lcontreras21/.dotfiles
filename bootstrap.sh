#!/bin/bash
cd $HOME 

DOTFILES=".dotfiles"
REPO="https://github.com/lcontreras21/.dotfiles.git"

# TODO: remove branch arg when merged in
git clone -b ansible-izing --recurse-submodules ${REPO} ${DOTFILES}
cd "${HOME}/${DOTFILES}"

set -e
export PATH="$PATH:$HOME/.local/bin"
pip install ansible --break-system-packages

ansible-galaxy install -r bootstraps/requirements.yml

# TODO: Use ask-become pass command on Prod or use some sort of test env
# ansible-playbook bootstraps/bootstrap.yml --ask-become-pass

ansible-playbook bootstraps/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras"
