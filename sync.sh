#!/usr/bin/env bash
set -euo pipefail

# Bash
cp ./.bashrc ~/.bashrc
source ~/.bashrc
echo "bash synced"

# Kitty
cp -r ./kitty/ ~/.config/
if pgrep -x kitty >/dev/null; then
    pkill -USR1 -x kitty
    echo "kitty synced"
else
    echo "No kitty instances"
fi

# neovim
cp ./init.lua ~/.config/nvim/init.lua
echo "nvim synced"
