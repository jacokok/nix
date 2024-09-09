{ inputs, ... }: {
  additions = final: _prev: import ../pkgs final.pkgs;

  modifications = final: prev: {
    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
    nvim = inputs.nvim.packages.${final.system}.default;

    # ms-dotnettools.csharp = prev.vscode-extensions.ms-dotnettools.csharp.overrideAttrs (_: rec { version = "2.45.20"; });
  };
}
