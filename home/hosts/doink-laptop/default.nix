{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # blender
    (callPackage ../../packages/blender.nix { })
  ];
}
