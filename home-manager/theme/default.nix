{ pkgs, lib, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "adwaita";
    };

    iconTheme = {
      name = lib.mkForce "MoreWaita";
      package = lib.mkForce pkgs.morewaita-icon-theme;
    };

    gtk3 = {
      theme = {
        name = "adw-gtk3-dark";
        package = pkgs.adw-gtk3;
      };
    };
  };

  # qt = {
  #   enable = true;
  #   platformTheme = { name = "kvantum"; };
  #   style = { name = "kvantum"; };
  # };
}
