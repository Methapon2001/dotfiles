local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrains Mono Nerd Font Mono")
config.font_size = 11.5
config.color_scheme = "Catppuccin Macchiato"

config.enable_tab_bar = false
config.window_background_opacity = 0.94

config.window_padding = {
  left = 24,
  right = 24,
  top = 24,
  bottom = 24,
}

return config
