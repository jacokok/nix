{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    morewaita-icon-theme
    adw-gtk3
    sops
    gcc
    usbutils
  ];

  services.tailscale.enable = true;
}
