{ inputs, pkgs, ... }:
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  programs = {
    nixvim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      options = {
        number = true;
        relativenumber = true;
        shiftwidth = 2;
      };

      colorschemes.vscode.enable = true;
      # plugins = with pkgs.vimPlugins; [
      #   adwaita-nvim
      #   #lazy-nvim

      #   comment-nvim
      #   {
      #     plugin = comment-nvim;
      #     config = "require(\"Comment\").setup()";
      #   }
      # ];

      # extraConfig = ''
      #   colorscheme adwaita
      # '';

      # extraLuaConfig = ''
      #   ${builtins.readFile ./config/options.lua}
      # '';
    };
  };
}
