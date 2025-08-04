{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
      name = lib.mkForce "MoreWaita";
      package = lib.mkForce pkgs.morewaita-icon-theme;
    };
  };

  # qt = {
  #   enable = true;
  #   platformTheme = { name = "kvantum"; };
  #   style = { name = "kvantum"; };
  # };
}
