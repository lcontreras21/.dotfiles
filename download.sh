#!/bin/bash
FOLDER=".dotfiles"
cd ~
git clone -b ansible-izing https://github.com/lcontreras21/.dotfiles.git ${FOLDER}
cd ${FOLDER}

./install
