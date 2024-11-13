{
  pkgs,
  inputs,
  outputs,
  vars,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules
    inputs.home-manager.nixosModules.home-manager
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

  home-manager = {
    extraSpecialArgs = {
      inherit inputs vars outputs;
    };
    users = {
      doink = import ../../home/hosts/doink-pc;
    };
    backupFileExtension = "hm-backup";
  };
}
