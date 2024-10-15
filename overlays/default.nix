{ inputs, ... }: {
  additions = final: _prev: import ./pkgs final.pkgs;

  modifications = final: prev:
    {
      # example = prev.example.overrideAttrs (oldAttrs: rec {
      # ...
      # });
      # nvim = inputs.nvim.packages.${final.system}.default;
    };
}
