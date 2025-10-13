#!/bin/bash
# Deploy SDDM theme from dotfiles

sudo rm -rf /usr/share/sddm/themes/sddm-astronaut-theme
sudo cp -r ~/dotfiles/sddm/sddm-astronaut-theme /usr/share/sddm/themes/
echo "SDDM theme deployed successfully"

