{ config, pkgs, lib, ... }:

{
  nixpkgs = {
    overlays = [
      # (import ./chrome.nix)
      # (import ./beekeeper.nix)
      # (import ./vscode.nix)
      # (import ./dotnet.nix)
    ];
  };
}
