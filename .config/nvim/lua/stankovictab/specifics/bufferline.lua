require('bufferline').setup{
	options = {
		-- indicator_icon = 'ﳗ', -- Indicator of the currently opened buffer
		modified_icon = 'ﭾ', -- Indicator of an edit having been made, the default dot is too big
		-- 
		-- ﭾ
		-- 
		middle_mouse_command = "bdelete! %d", -- No action by default
		right_mouse_command = "buffer %d", -- Closes tab by default
		tab_size = 1, -- Width of the tab, don't know the minimum so I set 1
		show_buffer_close_icons = false, -- Buffer close button
		show_close_icon = false, -- Tab close button
		indicator = {
			icon = '>', -- Only works when style is icon
			style = 'none' -- underline, icon, none
		},
		separator_style = "thin", -- slant, padded_slant, thick, thin. The character at the beginning and end of the buffer tab - {'any','any'} means you can set whatever character
		always_show_bufferline = true, -- No bar when one buffer is loaded
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = true
			}
		}
	}
}
