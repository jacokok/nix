{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./shared.nix
      ./gnome.nix
    ];
}
