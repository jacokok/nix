{ pkgs, inputs, ... }:
{
  imports = [
    ./firefox.nix
    ./git.nix
  ];

  home = {
    stateVersion = "23.11";
    username = "doink";
    homeDirectory = "/home/doink";
  };

  home.packages = with pkgs; [
  ];

  programs = {
    home-manager.enable = true;
  };
}