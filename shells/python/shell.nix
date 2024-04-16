{ pkgs ? import <nixpkgs> { } }:
(pkgs.buildFHSUserEnv {
  name = "python";
  targetPkgs = pkgs: (with pkgs; [
    python3
    python3Packages.pip
  ]);
  runScript = "bash";
}).env
