#!/bin/bash

# Install must-have CLI tools
if command -v apt &> /dev/null; then
    echo "Using apt package manager."
    sudo -A apt install -y curl tmuxp tmux ripgrep fd-find jq fzf fastfetch
elif command -v pacman &> /dev/null; then
    echo "Using pacman package manager."
    # pacman commands can be executed here, e.g., sudo pacman -Syu
    sudo pacman -Sy curl tmuxp tmux ripgrep fd-find jq fzf fastfetch
else
    echo "Neither apt nor pacman found. Unknown package manager."
fi

