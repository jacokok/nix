{
  config,
  outputs,
  pkgs,
  ...
}:
{
  networking = {
    networkmanager.enable = true;
    firewall.trustedInterfaces = [ "docker0" ];
  };

  time.timeZone = "Africa/Johannesburg";

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

  services = {
    xserver = {
      xkb = {
        layout = "za";
        variant = "";
      };
    };

    # Enable CUPS to print documents.
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    printing = {
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
    };
  };

  services.pulseaudio.enable = false;

  security = {
    rtkit.enable = true;
    pam.services.login.enableGnomeKeyring = true;
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
  };

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
    settings = {
      experimental-features = "nix-command flakes";
    };
    gc = {
      automatic = true;
      persistent = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };
    optimise.automatic = true;
  };

  system.autoUpgrade = {
    enable = true;
    operation = "switch";
    allowReboot = true;
    flake = "github:jacokok/nix#${config.networking.hostName}";
    dates = "02:30";
    flags = [
      "--no-update-lock-file"
      "--no-write-lock-file"
    ];
    randomizedDelaySec = "5min";
    rebootWindow = {
      lower = "02:00";
      upper = "06:00";
    };
  };

  virtualisation = {
    podman = {
      enable = true;
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
      liveRestore = false;
    };
  };

  environment = {
    homeBinInPath = true;
    localBinInPath = true;
    sessionVariables = {
      BROWSER = "google-chrome-stable";
      TERM = "ghostty";
      TERMINAL = "ghostty";
      EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  powerManagement = {
    enable = true;
  };

  system.stateVersion = "23.11";
}
