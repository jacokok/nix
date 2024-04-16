{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    ripgrep
    vscode-fhs
    neovim
    curl
    firefox
    gnome.gnome-tweaks
    blackbox-terminal
    nixpkgs-fmt
    nodejs_21
    bottom
    distrobox
    nodePackages_latest.pnpm
    neofetch
    onefetch
    appimage-run
    lunacy
    google-chrome
    android-tools
  ];
}
