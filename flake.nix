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

    nvim = {
      url = "github:jacokok/nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nix-vscode-extensions = {
    #   url = "github:nix-community/nix-vscode-extensions";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

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
    , nixos-hardware
    , home-manager
    , sops-nix
    , nvim
    , disko
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      vars = {
        user = "doink";
        system = "x86_64-linux";
      };
    in
    {
      overlays = import ./overlays { inherit inputs outputs; };

      nixosConfigurations = (
        import ./hosts {
          inherit inputs outputs nixpkgs vars;
        }
      );
    };
}
