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
    (callPackage ./ptyxis.nix { })
    nixpkgs-fmt
    bottom
    distrobox
    nodejs_22
    corepack_22
    neofetch
    onefetch
    appimage-run
    lunacy
    google-chrome
    android-tools
    vesktop
    godot_4
    python3
  ];
}
