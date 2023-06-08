require('scrollbar').setup({
	-- It already supports diagnostics, but not git changes, which is fine
	show_in_active_only = true, -- Only show scrollbar in active window
	hide_if_all_visible = true, -- Hide scrollbar if all contents are visible
	handle = {
		color = '#444444', -- Color for some reason can't be set in the theme, so I'm setting it here
	},
	marks = {
		Cursor = {
			-- text = '•'
			text = ' ' -- Get rid of the cursor mark
		}
	}
})
