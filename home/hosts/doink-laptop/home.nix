{ pkgs, ... }:

{
  home.packages = with pkgs; [
    (callPackage ../../packages/blender.nix { })
  ];
}
