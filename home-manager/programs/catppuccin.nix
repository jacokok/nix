{ inputs, ... }:
{
  imports = [ inputs.catppuccin.homeModules.catppuccin ];

  catppuccin = {
    flavor = "mocha";
    accent = "blue";
    atuin.enable = true;
    bat.enable = true;
    bottom.enable = true;
    delta.enable = true;
    fzf.enable = true;
    lazygit.enable = true;
    obs.enable = true;
    starship.enable = true;
    yazi.enable = true;
  };
}
