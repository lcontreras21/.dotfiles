#!/bin/bash

sudo -A apt install -y zsh

# Download the Oh My Zsh installation script
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O /tmp/install_ohmyzsh.sh

# Run the Oh My Zsh installation script without any user interaction
sh /tmp/install_ohmyzsh.sh --unattended

# Install powerlevel10k theme for Zsh
git clone --depth 1 https://github.com/romkatv/powerlevel10k.git "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

sudo -A chsh -s /usr/bin/zsh
