{ inputs, nixpkgs, outputs, vars, ... }:
let
  system = "x86_64-linux";
in
{
  doink-pc = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs outputs vars system; };
    modules = [
      ./imports.nix
      ./doink-pc
    ];
  };

  doink-laptop = nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = { inherit inputs outputs vars system; };
    modules = [
      ./imports.nix
      ./doink-laptop
    ];
  };
}
