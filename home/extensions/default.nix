{ pkgs, ... }:

let
  extensions = with pkgs.gnomeExtensions; [
    just-perfection
    caffeine
  ];
in
{
  home.packages = extensions;
  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;
    enabled-extensions = (map (e: e.extensionUuid) extensions);
  };
}
