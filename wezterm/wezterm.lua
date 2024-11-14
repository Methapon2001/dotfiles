local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono Nerd Font Mono")
config.font_size = 11.5
config.color_scheme = "Catppuccin Macchiato"
config.initial_cols = 120
config.initial_rows = 30
config.max_fps = 120

config.enable_tab_bar = false

return config
