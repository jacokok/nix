{ pkgs, outputs, ... }:
{
  imports = [
    ./programs
    ./extensions
    ./dconf
    ./theme
    ./files
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "doink";
    homeDirectory = "/home/doink";

    shellAliases = {
      d = "distrobox";
      pm = "pnpm";
      vi = "nvim";
      vim = "nvim";
    };

    sessionVariables = {
      PNPM_HOME = "$HOME/.pnpm-global/bin";
    };

    sessionPath = [
      "$HOME/.dotnet/tools"
      "$HOME/.pnpm-global/bin"
    ];
  };

  home.file.".face" = {
    source = ../assets/face.png;
  };
  home.file.".icons/nix.svg" = {
    source = ../assets/nix.svg;
  };

  # home.file.".mozilla/firefox/doink/chrome".source = inputs.firefox-gnome-theme;

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    bash = {
      enable = true;
      #initExtra = ''
      #   # Make Nix and home-manager installed things available in PATH.
      #   export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      # '';
    };
    bat = {
      enable = true;
      config = {
        #theme = "Visual Studio Dark+";
        #  theme = "Catppuccin Mocha";
        color = "always";
      };
    };
    zoxide.enable = true;
    fzf = {
      enable = true;
      defaultCommand = "fd --type f";
      fileWidgetOptions = [ "--preview 'bat --color=always --plain --line-range=:200 {}'" ];
      changeDirWidgetCommand = "fd --type d";
      changeDirWidgetOptions = [ "--preview 'tree -C {} | head -200'" ];
    };
    jq.enable = true;
    gpg.enable = true;
  };
  services.gpg-agent = {
    enable = true;
    pinentryPackage = pkgs.pinentry-curses;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";
}
