# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, ...
}: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "doink";
    homeDirectory = "/home/doink";

    shellAliases = {
      d = "distrobox";
      pm = "pnpm";
    };

    sessionPath = [ "$HOME/.dotnet/tools" ];
  };

  home.file.".face" = {
    source = ../assets/face.png;
  };

  # home.file.".test".text = ''
  #   tstest
  # '';

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  home.packages = with pkgs; [
    wget
    ripgrep
    vscode-fhs
    neovim
    curl
    adw-gtk3
    gnomeExtensions.just-perfection
    firefox
    gnome.gnome-tweaks
    blackbox-terminal
    nixpkgs-fmt
    nodejs_21
    dotnet-sdk_8
    bottom
    distrobox
    nodePackages_latest.pnpm
  ];
  home.file.".mozilla/firefox/doink/chrome".source = inputs.firefox-gnome-theme;

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Doink";
      userEmail = "kokjaco2@gmail.com";
    };
    bash = {
      enable = true;
      #initExtra = ''
      #   # Make Nix and home-manager installed things available in PATH.
      #   export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      # '';
    };
    bat.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
    jq.enable = true;
    firefox = {
      enable = true;
      profiles.test = {
        settings = {
          "extensions.pocket.enabled" = false;
          "gfx.webrender.all" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          "media.ffvpx.enabled" = false;
          "media.navigator.mediadataencoder_vpx_enabled" = true;
          "media.rdd-ffmpeg.enabled" = true;
          "ui.key.menuAccessKey" = 0; # Hide access key underlining
          "browser.uidensity" = 0;
          "gnomeTheme.activeTabContrast" = true;
          "gnomeTheme.bookmarksToolbarUnderTabs" = true;
          "gnomeTheme.hideSingleTab" = false;
          "gnomeTheme.hideWebrtcIndicator" = true;
          "gnomeTheme.spinner" = true;
          "gnomeTheme.normalWidthTabs" = true;
          "gnomeTheme.tabsAsHeaderbar" = false;
          "layers.acceleration.force-enabled" = true;
          "svg.context-properties.content.enabled" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "widget.gtk.overlay-scrollbars.enabled" = true;
        };
      };
    };
    starship = {
      enable = true;
      settings = {
        character = {
          success_symbol = "[→](green)";
          error_symbol = "[→](red)";
        };
      };
    };
  };


  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

  # gtk = {
  #   enable = true;
  #   gtk3.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  #   gtk4.extraConfig = {
  #     Settings = ''
  #       gtk-application-prefer-dark-theme=1
  #     '';
  #   };
  # };

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "com.raggesilver.BlackBox.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.25;
      gtk-theme = "adw-gtk3-dark";
      monospace-font-name = "FiraCode Nerd Font Mono Regular 10";
      icon-theme = "MoreWaita";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };
  };
}
