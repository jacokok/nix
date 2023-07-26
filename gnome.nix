{ config, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # exlcude default gnome packages
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
    gnome-console
  ]) ++ (with pkgs.gnome; [
    cheese
    gnome-music
    geary
  ]);

  programs.dconf.enable = true;
}