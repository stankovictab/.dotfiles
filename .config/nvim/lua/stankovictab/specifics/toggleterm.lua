require("toggleterm").setup{
	open_mapping = [[<c-j>]], -- Shortcut to open and close
	-- hide_numbers = false, -- ??? - Default true
	-- shading_factor = '3', -- ???
	-- shade_terminals = false, -- ??? - Default true
	direction = 'float', -- vertical, horizontal, tab, float
	float_opts = {
		border = 'curved',
		-- width = x, -- The width of the floating terminal
	    -- height = 1, -- The width of the floating terminal
		winblend = 0 -- The transparency of the terminal, from 0 to 100, doesn't go well with zsh completion
	}
}
