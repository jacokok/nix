{ pkgs, ... }:
{
  programs = {
    nix-ld = {
      enable = true;
      package = pkgs.nix-ld-rs;

      # libraries = [
      #   stdenv.cc.cc
      #   stdenv.cc.cc.lib
      #   curl
      #   openssl
      #   libssh
      #   util-linux
      #   xz
      #   systemd
      # ];
    };
  };
}
