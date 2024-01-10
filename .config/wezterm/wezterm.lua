local wezterm = require 'wezterm'
local config = {}

-- Actual config goes here

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Ligatures are supported OOTB, unlike Alacritty (~~>)
config.color_scheme = 'GitHub Dark' -- 950 themes available OOTB
-- See more here: https://wezfurlong.org/wezterm/colorschemes

return config
