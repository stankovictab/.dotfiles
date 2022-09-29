vim.g.material_style = "deep ocean"
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

require('material').setup{
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
vim.cmd('colorscheme ayu') -- For the settings to apply, this needs to be at the end

-- Removing the background color
vim.cmd('hi Normal guibg=NONE')
