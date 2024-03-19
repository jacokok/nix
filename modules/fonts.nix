{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      corefonts
      liberation_ttf
      fira-code
      (nerdfonts.override { fonts = [ "FiraCode" ]; })
    ];
  };
}
