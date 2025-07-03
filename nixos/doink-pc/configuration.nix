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

  # Cache v2 remove this if you have issues
  nix.settings.substituters = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];
  # nix.binaryCaches = [ "https://aseipp-nix-cache.global.ssl.fastly.net" ];

  networking.hostName = "doink-pc";
}
