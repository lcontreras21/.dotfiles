#!/bin/bash

choices=`echo "pop_os-dotfiles-direct pop_os-dotfiles-indirect ubuntu-dotfiles-indirect ubuntu-dotfiles-direct" | tr ' ' '\n'`

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=`printf "$choices" | fzf`
fi

if [[ -z $selected ]]; then
    exit 0
fi

echo $selected
sudo docker compose -f bootstraps/docker-compose.yml up --build -d $selected 
