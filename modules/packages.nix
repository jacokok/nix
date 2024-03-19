{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    morewaita-icon-theme
    # wget
    # vscode-fhs
    # neovim
    # curl
    # adw-gtk3
    # gnomeExtensions.just-perfection
    # gnome.adwaita-icon-theme
    # firefox
    # gnome.gnome-tweaks
    # blackbox-terminal
    # nixpkgs-fmt
    # nodejs_21
    # dotnet-sdk_8
    # bottom
    # nodePackages_latest.pnpm
  ];
}
