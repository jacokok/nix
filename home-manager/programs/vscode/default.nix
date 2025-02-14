{ pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      package = pkgs.vscode;
      mutableExtensionsDir = true;
      extensions = (
        with pkgs.vscode-extensions;
        [
          ms-dotnettools.csharp
        ]
      );
    };
  };
}
