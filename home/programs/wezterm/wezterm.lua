local wezterm = require("wezterm")

local ROUNDED_LEFT_CIRCLE = " "
local ROUNDED_RIGHT_CIRCLE = ""

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local edge_background = "#1e1e2e"
  local background = "#1e1e2e"
  local foreground = "#7f849c"

  if tab.is_active then
    background = "#313244"
    foreground = "#cdd6f4"
  elseif hover then
    background = "#89dceb"
    foreground = "#11111b"
  end

  local edge_foreground = background

  local title = tab.tab_index .. ": " .. wezterm.truncate_right(tab.active_pane.title, max_width - 4)

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = ROUNDED_LEFT_CIRCLE },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = ROUNDED_RIGHT_CIRCLE },
  }
end)

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
  show_new_tab_button_in_tab_bar = false,
  window_close_confirmation = "NeverPrompt",
  font_size = 14,
  xcursor_theme = "Adwaita",
  window_decorations = "NONE",
  initial_rows = 50,
  initial_cols = 200,
  enable_wayland = true,
  window_padding = {
    top = 0,
    -- top = "0.5cell",
    bottom = 0,
  },
  colors = {
    tab_bar = {
      background = "#1e1e2e",
    },
  },
  keys = {
    { action = wezterm.action.ActivateTabRelative(-1), mods = "CTRL|SHIFT", key = "H" },
    { action = wezterm.action.ActivateTabRelative(1),  mods = "CTRL|SHIFT", key = "L" },
  },
}
