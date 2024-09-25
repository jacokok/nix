{ ... }:
{
  programs = {
    kitty = {
      enable = true;
      catppuccin.enable = true;
      font = {
        name = "FiraCode Nerd Font";
        size = 14;
      };
      settings = {
        update_check_interval = 0;
        background_opacity = "0.95";
        wayland_titlebar_color = "background";
        window_padding_width = 5;
        confirm_os_window_close = 0;
        tab_bar_style = "powerline";
        tab_powerline_style = "round";
        copy_on_select = "clipboard";
        hide_window_decorations = "titlebar-and-corners";
        enabled_layouts = "horizontal,grid,splits,vertical";
        window_border_width = "1pt";
        cursor_shape = "block";
      };
    };
  };
}
