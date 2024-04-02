{ pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    just-perfection
  ];
}
