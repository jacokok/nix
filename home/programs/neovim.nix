{ inputs, vars, pkgs, ... }:
{
  home.packages = with pkgs; [
    nvim
  ];
}
