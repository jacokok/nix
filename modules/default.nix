{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./shared.nix
      ./user.nix
      ./gnome.nix
      ./packages.nix
      ./dotnet.nix
      ./flatpak.nix
      ./fonts
      ./nh.nix
      ./ascii-workaround.nix
    ];
}
