{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [ ghostty ];
  home.file = {
    ".config/ghostty/config".source = "${inputs.dotfiles}/ghostty/config";
  };
}
