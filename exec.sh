#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=`printf "$choices" | fzf`
fi

if [[ -z $selected ]]; then
    exit 0
fi

sudo docker exec -it dotfiles-indirect zsh
