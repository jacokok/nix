{ config, pkgs, lib, ... }:

{
  nixpkgs = {
    overlays = [
      (import ./temp.nix)
      (import ./vscode.nix)
      # (import ./dotnet.nix)
    ];
  };
}
