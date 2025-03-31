#!/bin/bash

source ./env.sh

sudo -A apt install -y stow

files_to_remove=(".zshrc")

# Loop over files and remove them if they exist
for file in "${files_to_remove[@]}"; do
    if [ -f "$HOME/$file" ]; then
        rm "$HOME/$file"
    fi
done

# Function to delete previous stowed folders
stow_folders=("bin" "nvim" "tmux" "tmuxp" "zsh" "fastfetch" "kitty")

# Loop over folders and delete stowed ones using stow
for folder in "${stow_folders[@]}"; do
    stow -D "$folder" -t "$HOME" --verbose=2 --dir="${dotfiles}/configs"
done

# Function to run stow on the necessary directories
# Loop over folders and apply stow
for folder in "${stow_folders[@]}"; do
    stow "$folder" -t "$HOME" --verbose=2 --dir="${dotfiles}/configs"
done
