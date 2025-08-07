{ pkgs, ... }:
{
  imports = [
    ./sops.nix
    ./git.nix
    ./firefox.nix
    ./starship.nix
    ./neovim.nix
    ./ghostty
    ./catppuccin.nix
    # ./vscode
    ./helix.nix
    ./atuin.nix
    ./yazi.nix
  ];
  home.packages = with pkgs; [
    wget
    ripgrep
    fd
    tree
    curl
    gnome-tweaks
    nixpkgs-fmt
    bottom
    distrobox
    nodejs_24
    fastfetch
    onefetch
    appimage-run
    google-chrome
    android-tools
    godot_4
    python3
    ffmpeg
    krita
    steam-run
    # zed-editor
    nix-search-cli
    # lunacy middle click bug using flatpak isntead
    inkscape
    wl-clipboard
    nmap
    lazygit
    lazydocker
    lazysql
    unzip
    cargo
    rustc
    go
    nixfmt-rfc-style
    libnotify
    gh
    yq
    freecad
    mqttui
    # fritzing
    duf
    popsicle
    awscli2
    vscode-fhs
    aichat
    vesktop
    postgresql
    trivy

    # Lang Tools
    taplo
    markdownlint-cli2
    nixd
    bash-language-server
    lua-language-server
    docker-compose-language-service
    dockerfile-language-server-nodejs
    yaml-language-server
    markdown-oxide
    sleek

    tailwindcss-language-server
    nodePackages_latest.svelte-language-server
    nodePackages_latest.typescript-language-server
    nodePackages_latest.prettier
    vscode-css-languageserver
    vscode-json-languageserver
    # vscode-html-languageserver
  ];
}
