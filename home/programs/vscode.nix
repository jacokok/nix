{ inputs, pkgs, ... }:
{
  programs = {
    vscode = {
      enable = true;
      mutableExtensionsDir = true;
      # enableUpdateCheck = false;
      # package = pkgs.vscode.fhs;
      extensions =
        let
          extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
        in
        with extensions.vscode-marketplace; [
          ms-dotnettools.vscode-dotnet-runtime
          ms-dotnettools.csharp
          ms-dotnettools.csdevkit
        ];
    };
  };
}
