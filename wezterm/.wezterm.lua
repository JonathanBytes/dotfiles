local wezterm = require 'wezterm'

local scheme = wezterm.get_builtin_color_schemes()['Gruvbox Dark']
scheme.background = '#282828'

return {
  font = wezterm.font {
    family = 'FiraCode Nerd Font',
  },
  font_size = 15.0,
  color_schemes = {
    -- Override the builtin Gruvbox dark scheme with our modification.
    ['Gruvbox Dark'] = scheme,
  },
  color_scheme = 'Gruvbox Dark',
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  enable_wayland = true,
  alternate_buffer_wheel_scroll_speed = 1,
}
