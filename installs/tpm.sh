#!/bin/bash

source ./env.sh

if [ ! -d ${config}/tmux/plugins/tpm]; then
    mkdir -p ${config}/tmux/plugins/tpm
    git clone --depth 1 https://github.com/tmux-plugins/tpm "${config}/tmux/plugins/tpm"
fi

# chown "$USERNAME:$USERNAME" "${config}/tmux/plugins/tpm"
# chmod 0777 "${config}/tmux/plugins/tpm"

# Clone the TPM repository


# Create symlink for git_status.sh
[ -d ${config}/tmux/plugins/tmux] || mkdir -p ${config}/tmux/plugins/tmux
[ -d ${config}/tmux/plugins/tmux/custom ] || mkdir ${config}/tmux/plugins/tmux/custom
ln -sf "${config}/tmux/git_status.sh" "${config}/tmux/plugins/tmux/custom/git_status.sh"
