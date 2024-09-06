{ pkgs, ... }:

{
  imports = [
    ../../default.nix
    ./home.nix
  ];
}
