{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ helix ];
  home.file = {
    ".config/helix/config.toml".source = "${inputs.dotfiles}/helix/config.toml";
  };
}
