#!/bin/bash
cd $HOME 
FOLDER=".dotfiles"
git clone -b ansible-izing https://github.com/lcontreras21/.dotfiles.git ${FOLDER}
cd ${FOLDER}

set -e
export PATH=$PATH:.local/bin
pip install ansible --break-system-packages

export PATH="$PATH:~/.local/bin"
ansible-galaxy install -r bootstraps/requirements.yml

# ansible-playbook bootstraps/bootstrap.yml --ask-become-pass
ansible-playbook bootstraps/bootstrap.yml --extra-vars "ansible_sudo_pass=lcontreras21"

