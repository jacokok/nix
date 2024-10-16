{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ wezterm ];
  home.file = {
    ".config/wezterm/wezterm.lua".source = "${inputs.dotfiles}/wezterm/wezterm.lua";
  };
}
