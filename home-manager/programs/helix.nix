{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ helix ];
  # home.packages = with pkgs; [ inputs.helix.packages."${pkgs.system}".helix ];
  home.file = {
    ".config/helix/config.toml".source = "${inputs.dotfiles}/helix/config.toml";
  };
}
