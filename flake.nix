{
  description = "Flake for doink";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # SOPS
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dotfiles = {
      url = "github:jacokok/dotfiles";
      flake = false;
    };

    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    catppuccin.url = "github:catppuccin/nix";

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
    , nixos-hardware
    , home-manager
    , sops-nix
    , dotfiles
    , catppuccin
    , disko
    , ...
    }@inputs:
    let
      inherit (self) outputs;
      vars = {
        user = "doink";
        system = "x86_64-linux";
      };
      systems = [
        "aarch64-linux"
        "i686-linux"
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays {
        inherit inputs outputs;
      };

      nixosConfigurations =
        (import ./hosts { inherit inputs outputs nixpkgs vars; });
    };
}
