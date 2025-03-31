#!/bin/bash

source ./env.sh

# INITIALIZATION
# Set default starting branch to main instead of master
git config --global init.defaultBranch "main"

# USER
# user.name for git config
git config --global user.name "$git_username"

# user.email for git config
git config --global user.email "$git_email"

# SAFETY
# Silence all safe.directory warnings
git config --global safe.directory "*"

# CORE
# Set default editor to Neovim (btw)
git config --global core.editor "vim"

# Core - autocrlf
git config --global core.autocrlf "input"

# Core - autolf
git config --global core.autolf "input"

# Core - whitespace
git config --global core.whitespace "trailing-space"

# FETCH
# Set fetch to auto prune remote tracking branches that have been deleted
git config --global fetch.prune "true"

# CREDENTIALS
# Credential - store
git config --global credential.helper "store"

# SUBMODULES
# Set submodule status to show more info
git config --global status.submoduleSummary "true"

# Set submodule diff to show more info
git config --global diff.submodule "log"

# Set git to recurse into submodules
git config --global submodule.recurse "true"

# BRANCHES
# Set branch sort to be recently used
git config --global branch.sort "committerdate"
