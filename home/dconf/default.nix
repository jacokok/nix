{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "com.mitchellh.ghostty.desktop"
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

    "org/gnome/destop/peripherals/keyboard" = {
      delay = 200;
      repeat-interval = 20;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "${../../assets/wallpaper.png}";
      picture-uri-dark = "${../../assets/wallpaper.png}";
    };
  };
}
