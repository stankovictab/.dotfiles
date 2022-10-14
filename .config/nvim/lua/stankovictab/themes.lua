-- Selecting flavours
vim.g.material_style = "deep ocean"
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

-- MGZ Theme Settings
vim.g.mgz_disable_background = true -- Disable the setting of background color so that NeoVim can use your terminal background (default false)
vim.g.mgz_cursorline_transparent = false -- Set the cursorline transparent/visible (default false)
vim.g.mgz_italic = false -- Whether to render in italics (default true)
vim.g.mgz_uniform_diff_background = true -- enables/disables colorful backgrounds when used in *diff* mode (default false)

-- Material Theme Settings
require('material').setup {
	disable = {
		colored_cursor = true -- Disables the yellow cursor
	},
	contrast = {
		sidebars = true, -- Darker background in NvimTree
		-- popup_menu =	false, -- Lighter background on (first) cmp completion window
		floating_windows = true -- Darker background on (second) cmp completion window, and on Telescope
		-- non_current_windows = false -- Darker background behind ToggleTerm, for exmple
	}
}

-- Applying the theme
vim.cmd('colorscheme mgz') -- For the settings to apply, this needs to be at the end

-- Forcefully remove the background color
-- vim.cmd('hi Normal guibg=NONE')
