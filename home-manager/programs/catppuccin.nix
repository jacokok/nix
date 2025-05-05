{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    enable = true;
    mako.enable = false;
    flavor = "mocha";
    accent = "blue";
    starship.enable = true;
    fzf.enable = true;
    bat.enable = true;
    yazi.enable = true;
  };
}
