{ pkgs, ... }: {
  home.packages = with pkgs; [
    wget
    ripgrep
    fd
    tree
    curl
    # firefox
    gnome-tweaks
    ptyxis
    # (callPackage ./ptyxis.nix { })
    nixpkgs-fmt
    bottom
    distrobox
    nodejs_22
    corepack_22
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
  ];
}
