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

  boot.initrd.kernelModules = [ "amdgpu" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        amdvlk
      ];
    };
  };

  networking.hostName = "doink-pc";
}
