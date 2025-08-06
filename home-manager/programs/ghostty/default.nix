{ ... }:
{
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "catppuccin-mocha";
      font-size = 12;
      font-family = "FiraCode Nerd Font";
      window-theme = "ghostty";
      window-height = 55;
      gtk-adwaita = true;
      adw-toolbar-style = "raised";
      window-width = 200;
      auto-update = "off";
      bold-is-bright = true;
      shell-integration-features = "no-cursor,sudo,no-title";

      keybind = [
        "ctrl+shift+h=previous_tab"
        "ctrl+shift+l=next_tab"
        "ctrl+shift+[=move_tab:-1"
        "ctrl+shift+]=move_tab:1"
        "super+i=toggle_window_decorations"
        "super+shift+m=toggle_split_zoom"
        "ctrl+h=goto_split:left"
        "ctrl+j=goto_split:bottom"
        "ctrl+k=goto_split:top"
        "ctrl+l=goto_split:right"
        "ctrl+shift+j=new_split:down"
        "ctrl+shift+k=new_split:right"
        "ctrl+shift+up=resize_split:up,10"
        "ctrl+shift+down=resize_split:down,10"
        "ctrl+shift+left=resize_split:left,10"
        "ctrl+shift+right=resize_split:right,10"
        "ctrl+shift+nine=scroll_to_top"
        "ctrl+shift+zero=scroll_to_bottom"
        "ctrl+enter=text:\r"
        "shift+enter=text:\r"
        "ctrl+shift+enter=text:\r"
      ];
    };
  };
}
