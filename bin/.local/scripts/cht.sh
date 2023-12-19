#!/usr/bin/env bash

languages=`echo "python golang javascript cpp django" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk" | tr ' ' '\n'`  # TODO Add more core-utils

selected=`printf "$languages\n$coreutils" | fzf`
read -p "query: " query

if printf "$languages" | grep -qs $selected; then
    tmux neww bash -c " curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    tmux neww bash -c "curl cht.sh/$selected-$query & while [ : ]; do sleep 1; done"
fi

