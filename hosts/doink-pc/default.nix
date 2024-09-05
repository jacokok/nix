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

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.graphics = {
    enable = true;
  };

  networking.hostName = "doink-pc";
}
