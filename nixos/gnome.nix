{ pkgs, ... }:
{
  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];
    };
    gnome.gnome-keyring.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-console
    geary
    epiphany
    cheese
    gnome-music
  ];

  programs.dconf.enable = true;
}
