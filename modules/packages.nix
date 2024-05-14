{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    morewaita-icon-theme
    adw-gtk3
    pkgs.adwaita-qt6
  ];
}
