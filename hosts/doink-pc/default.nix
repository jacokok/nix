{ config, pkgs, inputs, outputs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "doink-pc";
}
