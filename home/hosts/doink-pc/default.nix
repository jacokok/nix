{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # (callPackage ../../packages/blender-hip.nix { })
    (callPackage ../../packages/blender.nix { })
    aseprite
  ];
}
