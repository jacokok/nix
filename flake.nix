{
  description = "flake for doink";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {    
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    firefox-gnome-theme = {
      url = "github:rafaelmardojai/firefox-gnome-theme";
      flake = false;
    };
  };

  outputs = { self, home-manager, nixpkgs, firefox-gnome-theme, ... }@inputs:
  with inputs.nixpkgs.lib;
  let specialArgs = { inherit inputs; };
  in
  {
    nixosConfigurations = {
      doink = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          ./gnome.nix
          home-manager.nixosModules.home-manager rec {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.doink = import ./home-manager;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}