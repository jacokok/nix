{ config, pkgs, lib, ... }:

{
  nixpkgs = {
    overlays = [
      # (import ./vscode.nix)
      # (import ./dotnet.nix)
    ];
  };
}
