{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "doink-pc";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    layout = "za";
    xkbVariant = "";
  };

  services.xserver.desktopManager.gnome.extraGSettingsOverridePackages = with pkgs; [
    nautilus-open-any-terminal
  ];
  # Let nautilus find extensions
  environment.sessionVariables = {
    ZABER = "Test";
  };

  environment.sessionVariables.NAUTILUS_EXTENSION_DIR = "${config.system.path}/lib/nautilus/extensions-4";
  environment.pathsToLink = [
    "/share/nautilus-python/extensions"
  ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
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

  users.users.doink = {
    isNormalUser = true;
    description = "Doink";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    packages = with pkgs; [
      # firefox
      vscode-fhs
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    neovim
    gnome.gnome-tweaks
    adw-gtk3
    gnomeExtensions.just-perfection
    gnome.nautilus-python
    nautilus-open-any-terminal
    gnome.adwaita-icon-theme
  ];

  services.flatpak.enable = true;

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  virtualisation = {
    podman = {
      enable = true;
    };
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      noto-fonts
      corefonts
      liberation_ttf
      fira-code
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}

