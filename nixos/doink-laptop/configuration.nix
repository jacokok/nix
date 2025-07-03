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

  # Cache v2 remove this if you have issues
  nix.binaryCaches = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];

  networking.hostName = "doink-laptop";
}
