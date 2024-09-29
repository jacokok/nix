local wezterm = require 'wezterm'
-- local left_icon = wezterm.nerdfonts.ple_left_half_circle_thick
-- local right_icon = wezterm.nerdfonts.ple_left_half_circle_thick

return {
  font = wezterm.font "FiraCode Nerd Font",
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
  window_close_confirmation = 'NeverPrompt',
  font_size = 14,
  xcursor_theme = "Adwaita",
  window_decorations = "RESIZE",
  enable_wayland = true,
  window_padding = {
    bottom = 0,
  },
}

