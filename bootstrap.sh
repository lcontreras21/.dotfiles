#!/bin/bash
cd $HOME 

FOLDER=".dotfiles"
REPO="https://github.com/lcontreras21/.dotfiles.git"

git clone -b ansible-izing --recurse-submodules ${REPO} ${FOLDER}
cd ${FOLDER}

set -e
export PATH=$PATH:.local/bin
pip install ansible --break-system-packages

ansible-galaxy install -r bootstraps/requirements.yml

# TODO: Use ask-become pass command on Prod or use some sort of test env
# ansible-playbook bootstraps/bootstrap.yml --ask-become-pass

ansible-playbook bootstraps/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras21"
