{ ... }:
{
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 5d --keep 5";
      flake = "/home/doink/nix";
    };
  };
}
