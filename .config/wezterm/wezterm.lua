local wezterm = require 'wezterm'
local config = {}

-- Actual config goes here

config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- Ligatures are supported OOTB, unlike Alacritty (~~>)
config.color_scheme = 'GitHub Dark'                       -- 950 themes available OOTB, nice ones are GitHub Dark, Catppuccin Mocha, Dracula, Batman
-- See more here: https://wezfurlong.org/wezterm/colorschemes

-- These are colors that override colors from the color scheme selected
config.colors = {
	foreground = 'white',
	-- background = 'black',
	-- Cursor override works in NeoVim aswell, like it should
	cursor_bg = 'white',
	cursor_fg = 'black',
	-- cursor_border = 'white',
}

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

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

-- config.window_decorations = "RESIZE" -- "RESIZE" keeps the resize feature but removes the titlebar

return config
