{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    just-perfection
    caffeine
    # tray-icons-reloaded
  ];
in
{
  home.packages = extensions;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = (map (e: e.extensionUuid) extensions);
  };
}
