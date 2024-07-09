{ config, pkgs, inputs, outputs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = [ pkgs.xterm ];

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-console
    geary
    epiphany
    cheese
  ]) ++ (with pkgs.gnome; [
    gnome-music
  ]);

  programs.dconf.enable = true;
}
