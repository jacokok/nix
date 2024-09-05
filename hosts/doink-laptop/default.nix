{ config, pkgs, inputs, home-manager, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "doink-laptop";
}
