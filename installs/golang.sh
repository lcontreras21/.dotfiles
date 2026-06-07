#!/bin/bash

source ./env.sh


if command -v apt &> /dev/null; then
    echo "Using apt package manager."
    # 1. Download Go tar file
    wget https://go.dev/dl/go${golang_version}.linux-amd64.tar.gz

    # 2. Delete previous Go installation
    sudo -A rm -rf /usr/local/go

    # 3. Extract and move new Go folder to /usr/local
    sudo -A tar -C /usr/local -xzf go${golang_version}.linux-amd64.tar.gz

    # 4. Delete downloaded tar file
    sudo -A rm -rf go${golang_version}.linux-amd64.tar.gz
elif command -v pacman &> /dev/null; then
    sudo pacman -S go
fi
