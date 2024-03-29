{ ... }:

{
  services.flatpak = {
    enable = true;
    uninstallUnmanagedPackages = false;
    update = {
      onActivation = false;
      auto = {
        enable = true;
        onCalendar = "daily";
      };
    };
    packages = [
      "org.gtk.Gtk3theme.adw-gtk3-dark"
      "io.gitlab.adhami3310.Impression"
      "io.beekeeperstudio.Studio"
      "com.github.tchx84.Flatseal"
      "com.mattjakeman.ExtensionManager"
      "io.github.flattool.Warehouse"
      "io.github.fabrialberio.pinapp"
      "com.usebruno.Bruno"
    ];
  };
}
