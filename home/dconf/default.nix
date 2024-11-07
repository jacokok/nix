{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "org.wezfurlong.wezterm.desktop"
        "org.gnome.Nautilus.desktop"
        "code.desktop"
      ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      text-scaling-factor = 1.25;
      # gtk-theme = "adw-gtk3-dark";
      monospace-font-name = "FiraCode Nerd Font 11";
      # icon-theme = "MoreWaita";
    };

    "org/gnome/mutter" = {
      dynamic-workspaces = true;
      edge-tiling = true;
      workspaces-only-on-primary = true;
      experimental-features = [
        "scale-monitor-framebuffer"
        "xwayland-native-scaling"
        "variable-refresh-rate"
      ];
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
      workspace-switcher-size = 15;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "${../../assets/wallpaper.png}";
      picture-uri-dark = "${../../assets/wallpaper.png}";
    };

    "org/gnome/Ptyxis" = {
      default-profile-uuid = "5060802acb7f4ade47135c3466391f2b";
      profile-uuids = [ "5060802acb7f4ade47135c3466391f2b" ];
    };

    "org/gnome/Ptyxis/Profiles/5060802acb7f4ade47135c3466391f2b" = {
      label = "Default";
      palette = "Catppuccin Mocha";
    };
  };
}
