local wezterm = require 'wezterm'

local scheme = wezterm.get_builtin_color_schemes()['Gruvbox dark, pale (base16)']
scheme.background = '#282828'

return {
  font = wezterm.font {
    -- family = 'FiraCode Nerd Font',
    family = 'CaskaydiaCove Nerd Font Mono',
  },
  font_size = 13.0,
  color_schemes = {
    -- Override the builtin Gruvbox dark scheme with our modification.
    ['Gruvbox dark, pale (base16)'] = scheme,
  },
  color_scheme = 'Gruvbox dark, pale (base16)',

  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  adjust_window_size_when_changing_font_size = false,
  enable_wayland = true,
  alternate_buffer_wheel_scroll_speed = 1,
}
