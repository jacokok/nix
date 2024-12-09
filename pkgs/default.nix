# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'
pkgs: {
  # example = pkgs.callPackage ./example { };
  # adwaita-for-steam = pkgs.callPackage ./adwaita-for-steam { };
  vscode-extensions.ms-dotnettools.csharp = pkgs.callPackage ./csharp { };
}
