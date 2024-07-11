{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # (callPackage ../../packages/blender-hip.nix { })
    aseprite
  ];
}
