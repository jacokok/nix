{ inputs, nixpkgs, home-manager, vars, ... }:
let
  system = "x86_64-linux";
in
{
  doink-pc = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs vars; };
    modules = [
      ./imports.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs vars;
        };
        home-manager.users.doink = { ... }: {
          imports = [
            ../home
            ../home/hosts/doink-pc
          ];
        };
      }
      ./doink-pc
    ];
  };

  doink-laptop = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs vars system; };
    modules = [
      ./imports.nix
      home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs system;
        };
        home-manager.users.doink = { ... }: {
          imports = [
            ../home
            ../home/hosts/doink-laptop
          ];
        };
      }
      ./doink-laptop
    ];
  };
}
