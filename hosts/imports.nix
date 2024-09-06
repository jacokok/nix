{ inputs, ... }:

{
  imports =
    [
      inputs.nix-flatpak.nixosModules.nix-flatpak
      inputs.disko.nixosModules.disko
      inputs.sops-nix.nixosModules.sops
      (import ./disko.nix { device = "/dev/nvme0n1"; })
    ];
}
