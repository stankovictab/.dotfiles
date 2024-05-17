local wezterm = require 'wezterm'
local config = {}

-- Actual config goes here

-- Ligatures are supported in WezTerm OOTB, unlike Alacritty (~~>)
-- config.font = wezterm.font 'Hack Nerd Font Mono'
-- config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font = wezterm.font 'JetBrainsMono Nerd Font Mono' -- There is also a NL version with No Ligatures.
-- config.font = wezterm.font 'RobotoMono Nerd Font Mono'
-- config.font = wezterm.font 'Monaspace Neon Var' -- Argon, Krypton, Neon, Radon, Xenon (Variable versions, not really for terminals)
-- config.font = wezterm.font 'Monaspace Neon' -- Argon, Krypton, Neon, Radon, Xenon
-- config.font = wezterm.font 'MonispaceNe NF' -- WIP: See the NerdFont GitHub for more info on the Mon(?)space NF https://github.com/ryanoasis/nerd-fonts/issues/1403
-- config.font = wezterm.font 'GohuFont uni11 Nerd Font Mono' -- The pixel font, also available as uni14 and non-Mono
-- config.font = wezterm.font 'GeistMono Nerd Font Mono' -- Also available as non-Mono
config.color_scheme =
'GitHub Dark'                       -- 950 themes available OOTB, nice ones are GitHub Dark, Catppuccin Mocha, Dracula, Batman
-- See more here: https://wezfurlong.org/wezterm/colorschemes

-- These are colors that override colors from the color scheme selected
config.colors = {
	foreground = 'white',
	background = '#121212', -- Background of Nobara title bar, matches well (in Zellij too)
	-- Cursor override works in NeoVim aswell, like it should
	cursor_bg = 'white',
	cursor_fg = 'black',
	-- cursor_border = 'white',
}

config.hide_tab_bar_if_only_one_tab = true                -- Tabs are hidden by default

config.adjust_window_size_when_changing_font_size = false -- Don't know why it's true by default

-- Change window size
config.initial_cols = 128 -- Default 80
config.initial_rows = 34  -- Default 24

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

-- Disable update check
config.check_for_updates = false
-- config.show_update_window = false

config.keys = {
	-- Bind Shift + Up to scroll up
	{
		key = 'UpArrow',
		mods = 'SHIFT',
		action = wezterm.action.ScrollByLine(-1),
	},
	-- Bind Shift + Down to scroll down
	{
		key = 'DownArrow',
		mods = 'SHIFT',
		action = wezterm.action.ScrollByLine(1),
	},
}
return config
