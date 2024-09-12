{ config, pkgs, inputs, outputs, vars, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules
      inputs.home-manager.nixosModules.home-manager
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "doink-laptop";

  home-manager = {
    extraSpecialArgs = { inherit inputs vars outputs; };
    users = {
      doink = import ../../home/hosts/doink-laptop;
    };
  };
}
