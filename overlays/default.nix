{ config, pkgs, lib, ... }:

{
  nixpkgs = {
    overlays = [
      # (import ./beekeeper.nix)
      # (import ./vscode.nix)
      # (import ./dotnet.nix)
    ];
  };
}
