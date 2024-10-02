{ config, pkgs, outputs, inputs, ... }: {
  networking = {
    networkmanager.enable = true;
    # extraHosts =
    #   ''
    #     127.0.0.1 docxam.local
    #   '';
    firewall.trustedInterfaces = [ "docker0" ];
  };

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_ZA.UTF-8";
    LC_IDENTIFICATION = "en_ZA.UTF-8";
    LC_MEASUREMENT = "en_ZA.UTF-8";
    LC_MONETARY = "en_ZA.UTF-8";
    LC_NAME = "en_ZA.UTF-8";
    LC_NUMERIC = "en_ZA.UTF-8";
    LC_PAPER = "en_ZA.UTF-8";
    LC_TELEPHONE = "en_ZA.UTF-8";
    LC_TIME = "en_ZA.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "za";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
  services.printing = {
    listenAddresses = [ "*:631" ];
    allowFrom = [ "all" ];
    browsing = true;
    defaultShared = true;
    openFirewall = true;
  };

  hardware.pulseaudio.enable = false;

  security = {
    rtkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [ outputs.overlays.additions outputs.overlays.modifications ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Limit the number of generations to keep
  boot.loader.systemd-boot.configurationLimit = 10;

  # App Images
  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "doink";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  nix = {
    settings = { experimental-features = "nix-command flakes"; };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 14d";
    };
    optimise.automatic = true;
  };

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    dates = "02:30";
    flake = "github:jacokok/nix";
    flags = [ "--recreate-lock-file" "--no-write-lock-file" ];
    #operation = "boot";
  };

  virtualisation = {
    podman = { enable = true; };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  environment = {
    homeBinInPath = true;
    localBinInPath = true;
    sessionVariables = {
      TERMINAL = "wezterm";
      TERM = "wezterm";
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  system.stateVersion = "23.11";
}
