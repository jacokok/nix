{ inputs, vars, ... }:
{
  # home.packages = [ inputs.nixvim-flake.packages.${vars.system}.default ];

  programs = {
    neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
