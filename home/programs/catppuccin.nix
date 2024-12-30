{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";
    starship.enable = true;
    fzf.enable = true;
    bat.enable = true;
  };
}
