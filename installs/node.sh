#!/bin/bash

source ./env.sh

# 1. Delete previous NVM installation (if any)
rm -rf "$config/.nvm"

# 2. Create NVM directory if it does not exist
# mkdir -p "$config/.nvm"
# chown "$username:$username" "$config/.nvm"
# chmod 0755 "$config/.nvm"

# 3. Download NVM installer
wget -O /tmp/install-nvm.sh "https://raw.githubusercontent.com/nvm-sh/nvm/$nvm_version/install.sh"
chmod 0550 /tmp/install-nvm.sh

# 4. Run the NVM installer
bash /tmp/install-nvm.sh

# 5. Install Node.js using NVM
# Ensure NVM is loaded, then install Node.js version
. "$config/nvm/nvm.sh" && nvm install "$node_version"

# Cleanup
rm -f /tmp/install-nvm.sh
