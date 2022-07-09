-- For some reason, the highlight of the vertical line only works on non-comment code.
-- It appears all of these settings are copied from Yggdroot/indentLine, so just look up :h indent_blankline, there's way more
require("indent_blankline").setup {
    show_current_context = true, -- Highlight vertically
    -- show_current_context_start = true, -- Highlight horizontally
	-- char = "i", -- The vertical character
	buftype_exclude = {"terminal"}, -- Excluding specific buffer types, like the terminal
	filetype_exclude = {"dashboard"} -- Excluding specific file types, like the dashboard plugin
}
