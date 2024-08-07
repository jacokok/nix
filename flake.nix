{
  description = "Flake for doink";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = github:nix-community/home-manager;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # SOPS
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    # Disko
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self
    , nixpkgs
    , nix-flatpak
    , home-manager
    , sops-nix
    , disko
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
    in
    {
      nixosConfigurations = {
        doink-laptop = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; username = "doink"; };
          # > Our main nixos configuration file <
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
            ./hosts/doink-laptop
            (import ./hosts/disko.nix { device = "/dev/nvme0n1"; })
            home-manager.nixosModules.home-manager
            ({ config, lib, ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.users.doink = { ... }: {
                imports = [
                  ./home
                  ./home/hosts/doink-laptop
                ];
              };
            })

            (import ./overlays)
          ];
        };
        doink-pc = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; username = "doink"; };
          # > Our main nixos configuration file <
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            disko.nixosModules.disko
            sops-nix.nixosModules.sops
            ./hosts/doink-pc
            (import ./hosts/disko.nix { device = "/dev/nvme0n1"; })
            home-manager.nixosModules.home-manager
            ({ config, lib, ... }: {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit inputs;
              };
              home-manager.users.doink = { ... }: {
                imports = [
                  ./home
                  ./home/hosts/doink-pc
                ];
              };
            })

            (import ./overlays)
          ];
        };
      };
    };
}
