{ config, pkgs, inputs, ... }:

{
  imports =
    [
      ./shared.nix
      ./user.nix
      ./sops.nix
      ./gnome.nix
      ./packages.nix
      ./dotnet.nix
      ./flatpak.nix
      ./fonts
      ./ld.nix
      ./libvirt.nix
      ./tailscale.nix
    ];
}
