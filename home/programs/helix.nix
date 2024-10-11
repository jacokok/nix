{
  programs.helix = {
    enable = true;
    settings = {
      editor = {
        line-number = "relative";
        cursorline = true;
        scrolloff = 5;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
        };
      };
    };
    languages = {
      name = "nix";
      formatter = {
        command = "nixpkgs-fmt";
      };
      auto-format = true;
    };
  };
}
