require("toggleterm").setup{
	open_mapping = [[<c-j>]],
	direction = 'float',
	highlights = {
		Normal = {
			guibg = '#ff0000',
		}
	},
	shading_factor = '3',
	shade_terminals = false,
	float_opts = {
		border = 'curved',
		winblend = 0
	}
}
