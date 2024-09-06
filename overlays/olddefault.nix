{ inputs, config, pkgs, lib, ... }:

{
  nixpkgs = {
    overlays = [
      # inputs.nix-vscode-extensions.overlays.default
      # (import ./chrome.nix)
      # (import ./beekeeper.nix)
      (import ./vscode.nix)
      # (import ./dotnet.nix)      
      # (import ./neovim.nix)
    ];
  };
}
