{ pkgs, ... }:
{
  programs = {
    nix-ld = {
      enable = true;
      # libraries = with pkgs; [
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
