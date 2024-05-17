{ ... }:
{
  programs = {
    zellij = {
      enable = true;
      settings = {
        theme = "darkModern";
        themes = {
          darkModern = {
            fg = [ 204 204 204 ];
            bg = [ 31 31 31 ];
            black = [ 0 0 0 ];
            red = [ 255 85 85 ];
            green = [ 57 233 168 ];
            yellow = [ 215 186 125 ];
            blue = [ 68 170 230 ];
            magenta = [ 197 134 254 ];
            cyan = [ 156 220 231 ];
            white = [ 255 255 255 ];
            orange = [ 214 157 133 ];
          };
        };
        ui.pane_frames.rounded_corners = true;
        ui.pane_frames.hide_session_name = true;
        default_layout = "custom";
        layout_dir = builtins.toString ./layouts;
      };
    };
  };
}
