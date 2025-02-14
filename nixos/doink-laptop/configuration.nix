{
  pkgs,
  inputs,
  outputs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ../configuration.nix
    ../imports.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "doink-laptop";
}
