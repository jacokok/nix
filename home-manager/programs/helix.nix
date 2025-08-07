{ ... }:
{
  programs.helix = {
    enable = true;
    languages.language = [
      {
        name = "nix";
        formatter.command = "nixfmt";
        language-servers = [ "nixd" ];
        auto-format = true;
      }
    ];
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        line-number = "relative";
        cursorline = true;
        scrolloff = 5;
        bufferline = "multiple";
        cursor-shape = {
          insert = "bar";
        };
      };
      keys = {
        normal = {
          "A-j" = [
            "extend_to_line_bounds"
            "delete_selection"
            "paste_after"
          ];
          "A-k" = [
            "extend_to_line_bounds"
            "delete_selection"
            "move_line_up"
            "paste_before"
          ];
          "A-J" = [
            "extend_to_line_bounds"
            "yank"
            "paste_after"
          ];
          "A-K" = [
            "extend_to_line_bounds"
            "yank"
            "paste_before"
          ];
          "C-g" = [
            ":new"
            ":insert-output lazygit"
            ":buffer-close!"
            ":redraw"
          ];
        };
      };
    };
  };
}
