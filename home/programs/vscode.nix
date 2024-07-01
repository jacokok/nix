{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      # enableUpdateCheck = false;
      package = pkgs.vscode.fhs;
      # package = pkgs.vscode.fhsWithPackages (ps: with ps; [
      #   zlib
      #   glibc
      #   curl
      #   openssl
      #   gdb
      #   (with dotnetCorePackages;
      #   combinePackages [
      #     sdk_8_0
      #   ])
      # ]);
    };
  };
}
