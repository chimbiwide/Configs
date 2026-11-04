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
install -m 755 nvim /usr/local/bin/nvim
rm nvim
echo "downloaded nvim $VERSION"

# update kitty as the invoking user so it lands in their ~/.local/kitty.app, not root's
sudo -u "${SUDO_USER:-root}" -H sh -c 'curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin'
echo "updated kitty"
