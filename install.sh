#!/usr/bin/env bash
#curl https://raw.githubusercontent.com/jacokok/nix/master/install.sh -O /tmp/install.sh

action=${1:-help}

help()
{
   echo "Easy Nix Setup"
   echo
   echo "check     1.) Check detail"
   echo "init      2.) Init git"
   echo "pull      3.) Pull from git"
   echo "disko     4.) Run disko"
   echo "config    5.) Generate Config"
   echo "install   6.) Install Nix"
   echo
}

check()
{
    lsblk
}

init()
{
    nix-shell -p git
}

pull()
{
    git https://github.com/jacokok/nix.git /tmp/nix
}

disko()
{
    device=${1:-/dev/nvme0n1}
    sudo nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko /tmp/nix/hosts/disko.nix --arg device "'$device'"
}

config()
{
    sudo nixos-generate-config --no-filesystems --root /mnt
    cp /tmp/nix/hosts/disko.nix /mnt/etc/nixos
    # Edit configuration
    sudo sed 's|./hardware-configuration.nix|./hardware-configuration.nix\n"${builtins.fetchTarball "https://github.com/nix-community/disko/archive/master.tar.gz"}/module.nix"\n./disko.nix|' /mnt/etc/nixos/hardware-configuration.nix -i
}

install()
{
    host=${1:-doink-laptop}
    sudo nixos-install --flake .#$host
}

if [ $action == "help" ];then
    help
fi
if [ $action == "check" ];then
    check
fi
if [ $action == "init" ];then
    init
fi
if [ $action == "pull" ];then
    pull
fi
if [ $action == "disko" ];then
    disko $2
fi
if [ $action == "config" ];then
    config
fi
if [ $action == "install" ];then
    install $2
fi


# sudo nixos-generate-config --no-filesystems --root /mnt

#nixos-install