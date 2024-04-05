{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    morewaita-icon-theme
  ];
}
