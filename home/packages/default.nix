{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wget
    ripgrep
    vscode-fhs
    neovim
    curl
    adw-gtk3
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
    blender-hip
    lunacy
    google-chrome
    beekeeper-studio
  ];
}
