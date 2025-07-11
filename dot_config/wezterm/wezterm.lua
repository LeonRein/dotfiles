-- Pull in the wezterm API
local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- dracula config
config.color_scheme = 'Dracula (Official)'
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.exit_behavior = "CloseOnCleanExit"

-- window padding
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- window size
config.initial_cols = 120
config.initial_rows = 28


-- font config
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
