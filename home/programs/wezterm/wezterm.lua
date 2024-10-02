local wezterm = require("wezterm")

return {
  font = wezterm.font("FiraCode Nerd Font"),
  window_background_opacity = 0.95,
  front_end = "WebGpu",
  check_for_updates = false,
  color_scheme = "Catppuccin Mocha",
  scrollback_lines = 10000,
  hyperlink_rules = wezterm.default_hyperlink_rules(),
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  show_new_tab_button_in_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  font_size = 14,
  xcursor_theme = "Adwaita",
  window_decorations = "RESIZE",
  initial_rows = 50,
  initial_cols = 200,
  enable_wayland = true,
  window_padding = {
    top = 0,
    bottom = 0,
  },
}
