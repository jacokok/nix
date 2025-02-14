{ inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
    inputs.disko.nixosModules.disko
    (import ./disko.nix { device = "/dev/nvme0n1"; })
    ./user.nix
    ./gnome.nix
    ./packages.nix
    ./dotnet.nix
    ./flatpak.nix
    ./fonts
    ./libvirt.nix
  ];
}
