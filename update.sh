#!/usr/bin/env bash
set -euo pipefail

# elevate into sudo first
if [[ $EUID -ne 0 ]]; then
    exec sudo "$0" "$@"
fi

# update nvim

VERSION=$(wget -qO- https://api.github.com/repos/neovim/neovim/releases/latest \
  | grep -oP '"tag_name": "\K[^"]+')

wget https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage -O nvim
chmod u+x nvim
mv nvim /usr/local/bin/
echo "downloaded nvim $VERSION"

# update kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo "updated kitty"
