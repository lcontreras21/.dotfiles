#!/bin/bash

source ./env.sh

[ -d ${config}/tmux/plugins/tpm] || mkdir -p ${config}/tmux/plugins/tpm

# chown "$USERNAME:$USERNAME" "${config}/tmux/plugins/tpm"
# chmod 0777 "${config}/tmux/plugins/tpm"

# Clone the TPM repository
git clone --depth 1 https://github.com/tmux-plugins/tpm "${config}/tmux/plugins/tpm"

# Create symlink for git_status.sh
ln -sf "${config}/tmux/git_status.sh" "${config}/tmux/plugins/tmux/custom/git_status.sh"
