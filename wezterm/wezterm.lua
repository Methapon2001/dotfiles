local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Macchiato"

-- font
config.font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font", "Noto Sans Thai" })
config.font_size = 11.5
config.line_height = 1.15

-- ui
config.enable_tab_bar = false
config.initial_cols = 120
config.initial_rows = 24

return config
