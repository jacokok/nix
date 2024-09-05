{ inputs, vars, ... }:
{
  home.packages = [ inputs.nixvim-flake.packages.${vars.system}.default ];
}
