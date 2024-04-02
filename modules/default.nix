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
      ./fonts.nix
    ];
}
