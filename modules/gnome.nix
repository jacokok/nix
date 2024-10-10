{ pkgs, ... }: {
  # Enable the X11 windowing system.
  services = {
    xserver = {
      enable = true;
      excludePackages = [ pkgs.xterm ];

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
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
