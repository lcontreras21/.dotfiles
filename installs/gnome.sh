#!/bin/bash

if [[ "$XDG_CURRENT_DESKTOP" ~= *"GNOME"* ]]; then
    return
fi

sudo -A apt install -y dconf-cli

# NOTE: for WSL2 need to have an X-Server running like 'VcXsrv'
timeout 10s sudo -A dconf write /org/gnome/desktop/interface/show-battery-percentage true

# Show apps in current workspace only on Alt+Tab
timeout 10s sudo -A dconf write /org/gnome/shell/app-switcher/current-workspace-only true

# Download updates automatically with GNOME software
timeout 10s sudo -A dconf write /org/gnome/software/download-updates true
