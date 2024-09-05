{ inputs, ... }:
{
  overlays = (final: prev: {
    neovim = inputs.nixvim-flake.packages.${prev.system}.default;
  });
}
