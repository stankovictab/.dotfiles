local wezterm = require 'wezterm'
local config = {}

-- Actual config goes here

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Ligatures are supported OOTB, unlike Alacritty (~~>)
config.color_scheme = 'GitHub Dark'                       -- 950 themes available OOTB
-- See more here: https://wezfurlong.org/wezterm/colorschemes

config.hide_tab_bar_if_only_one_tab = true -- Tabs are hidden by default

config.window_frame = {
	font = wezterm.font 'JetBrainsMono Nerd Font Mono',
	font_size = 10,
	inactive_titlebar_bg = '#353535',
	active_titlebar_bg = '#2b2042',
	inactive_titlebar_fg = '#cccccc',
	active_titlebar_fg = '#ffffff',
	inactive_titlebar_border_bottom = '#2b2042',
	active_titlebar_border_bottom = '#2b2042',
	button_fg = '#cccccc',
	button_bg = '#2b2042',
	button_hover_fg = '#ffffff',
	button_hover_bg = '#3b3052',
}

config.colors = {
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.window_decorations = "RESIZE" -- "RESIZE" keeps the resize feature but removes the titlebar

return config
