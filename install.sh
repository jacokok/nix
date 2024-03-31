#!/usr/bin/env bash

# sudo su
#nix-shell -p neovim
#lsblk

# curl https://raw.githubusercontent.com/jacokok/nix/master/install.sh -O /tmp/install.sh

# curl https://raw.githubusercontent.com/jacokok/nix/master/hosts/disko.nix -O /tmp/disko.nix
# nvim /tmp/disko.nix

nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/disko.nix --arg device '"/dev/nvme0n1"'

#lsblk
# sudo nixos-generate-config --no-filesystems --root /mnt