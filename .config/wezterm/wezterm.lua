local wezterm = require 'wezterm'
local config = {}

-- Actual config goes here

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Ligatures are supported OOTB
-- config.font = wezterm.font 'Hack Nerd Font Mono'
config.color_scheme = 'Wild Cherry (Gogh)' -- 950 themes available OOTB

return config
