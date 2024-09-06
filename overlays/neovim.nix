{ inputs, nixpkgs, vars, ... }:
final: prev: {
  nvim = inputs.nvim.packages.${vars.system}.default;
}
