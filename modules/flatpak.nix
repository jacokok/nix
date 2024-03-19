{ ... }:

{
  services.flatpak = {
    enable = true;
    uninstallUnmanagedPackages = true;
    update.onActivation = true;
    packages = [
      "org.gtk.Gtk3theme.adw-gtk3-dark"
      "com.usebruno.Bruno"
      "io.gitlab.adhami3310.Impression"
      "io.beekeeperstudio.Studio"
      "com.github.tchx84.Flatseal"
    ];
  };
}
