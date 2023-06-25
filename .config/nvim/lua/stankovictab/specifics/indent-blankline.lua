-- For some reason, the highlight of the vertical line only works on non-comment code.
-- It appears all of these settings are copied from Yggdroot/indentLine, so just look up :h indent_blankline, there's way more
require("indent_blankline").setup {
	-- This is turned off because it doesn't work on comments for some reason, see issue #521
	-- https://github.com/lukas-reineke/indent-blankline.nvim/issues/521
	-- show_current_context = true, -- Highlight vertically

    -- show_current_context_start = true, -- Highlight horizontally
	-- char = ".", -- The vertical character
	filetype_exclude = {"dashboard", "lspinfo", "packer", "checkhealth", "help", "man", ""} -- Excluding specific file types, like the dashboard plugin
}
