-- None of these settings are default

require('material').setup{
	contrast = {
		sidebars = true, -- Darker background in NvimTree
		-- popup_menu = false, -- Lighter background on (first) cmp completion window
		floating_windows = true -- Darker background on (second) cmp completion window, and on Telescope
		-- non_current_windows = false -- Darker background behind ToggleTerm, for exmple
	}
}
