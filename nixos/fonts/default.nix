{ pkgs, ... }:

{
  fonts = {
    fontDir.enable = true;
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      corefonts
      vistafonts
      liberation_ttf
      fira-code
      roboto
      inter
      nerd-fonts.fira-code
      # (nerdfonts.override { fonts = [ "FiraCode" ]; })
      (callPackage ./segoe-ui.nix { })
      (callPackage ./custom.nix { })
    ];
  };
}
