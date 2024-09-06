{ inputs, vars, ... }:
{
  overlays = (final: prev: {
    neovim = inputs.nixvim-flake.packages.${vars.system}.default;
  });
}
