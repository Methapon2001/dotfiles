local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono Nerd Font Mono")
config.font_size = 11
config.line_height = 1.25
config.color_scheme = "Catppuccin Macchiato"
config.initial_cols = 120
config.initial_rows = 24
config.max_fps = 120
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.enable_tab_bar = false

return config
