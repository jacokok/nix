{ ... }:
{
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });

    # Overlay worked but simply changing version is not enough
    # vscode-extensions = final.lib.recursiveUpdate prev.vscode-extensions {
    #   ms-dotnettools.csharp = final.vscode-utils.buildVscodeMarketplaceExtension {
    #     mktplcRef = {
    #       name = "csharp";
    #       publisher = "ms-dotnettools";
    #       version = "2.50.27";
    #       sha256 = "sha256-TSohDtn+VOhPi5FbA7VbzH8kom+GmdMfq5FoMCXlv5U=";
    #     };
    #   };
    # };
  };
}
