{ lib, ... }:
{
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

    "org/gnome/shell/extensions/just-perfection" = {
      accessibility-menu = false;
    };

    "org/gnome/desktop/background" = {
      picture-uri = "${../../assets/wallpaper.png}";
      picture-uri-dark = "${../../assets/wallpaper.png}";
    };

    "com/raggesilver/BlackBox" = with lib.hm.gvariant; {
      remember-window-size = true;
      theme-bold-is-bright = true;
      notify-process-completion = false;
      theme-dark = "Adwaita Dark";
      opacity = mkUint32 100;
    };
  };
}
