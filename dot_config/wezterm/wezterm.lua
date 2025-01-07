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


-- font config
config.font_size = 12
config.font = wezterm.font(
  { -- Normal text
  family='Monaspace Neon',
  harfbuzz_features={ 'calt', 'liga', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08' },
  stretch='UltraCondensed', -- This doesn't seem to do anything
})

-- and finally, return the configuration to wezterm
return config
