local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font_with_fallback({ "JetBrains Mono Nerd Font Mono", "Noto Sans Thai" })
config.font_size = 11.5
config.line_height = 1.25
config.color_scheme = "Catppuccin Macchiato"
config.initial_cols = 120
config.initial_rows = 24
config.max_fps = 165

config.enable_tab_bar = false

return config
