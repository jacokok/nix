{
  services.flatpak = {
    enable = true;
    uninstallUnmanaged = true;
    update = {
      onActivation = false;
      auto = {
        enable = true;
        onCalendar = "daily";
      };
    };

    packages = [
      "org.gtk.Gtk3theme.adw-gtk3-dark"
      "io.gitlab.adhami3310.Converter"
      "io.beekeeperstudio.Studio"
      "com.github.tchx84.Flatseal"
      "com.mattjakeman.ExtensionManager"
      "io.github.flattool.Warehouse"
      "io.github.fabrialberio.pinapp"
      "com.usebruno.Bruno"
      "com.valvesoftware.Steam"
      "com.icons8.Lunacy"
      "org.nickvision.tubeconverter"
      "org.upscayl.Upscayl"
      "io.mrarm.mcpelauncher"
      "com.prusa3d.PrusaSlicer"
      "com.usebottles.bottles"
      "com.redis.RedisInsight"
      "org.raspberrypi.rpi-imager"
      "com.heroicgameslauncher.hgl"
      "com.github.KRTirtho.Spotube"
      "md.obsidian.Obsidian"
      "org.gimp.GIMP"
    ];
  };
}
