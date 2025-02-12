{ pkgs, ... }:
{
  imports = [
    ./sops.nix
    ./git.nix
    ./firefox.nix
    ./starship.nix
    ./neovim.nix
    ./wezterm
    ./ghostty
    ./catppuccin.nix
    ./vscode
    ./helix.nix
    ./atuin.nix
  ];
  home.packages = with pkgs; [
    wget
    ripgrep
    fd
    tree
    curl
    # firefox
    gnome-tweaks
    nixpkgs-fmt
    bottom
    distrobox
    nodejs_23
    fastfetch
    onefetch
    appimage-run
    google-chrome
    android-tools
    vesktop
    godot_4
    python3
    ffmpeg
    krita
    steam-run
    zed-editor
    nix-search-cli
    # lunacy middle click bug using flatpak isntead
    inkscape
    wl-clipboard
    nmap
    lazygit
    lazydocker
    lazysql
    unzip
    yazi
    cargo
    rustc
    go
    nixfmt-rfc-style
    libnotify
    azuredatastudio
    gh
    yq
    # jetbrains.rider
    freecad
    mqttui
    fritzing
  ];
}
