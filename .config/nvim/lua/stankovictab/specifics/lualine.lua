require('lualine').setup {
	options = {
		theme = 'auto', -- If the current colorscheme has a lualine theme built in, it'll recognize it
		-- The color of component_separators is the same as the text
		-- component_separators = { left = '', right = ''},
		-- component_separators = { left = '', right = ''},
		-- component_separators = { left = '|', right = '|' },
		-- component_separators = { left = '', right = ''},
		component_separators = { left = '', right = '' },
		-- The color of section_separators is the same as the background
		section_separators = { left = '', right = '' },
		-- section_separators = { left = '', right = ''},
		-- section_separators = { left = '', right = ''},
		disabled_filetypes = { 'NvimTree' }, -- Filetypes where lualine won't be used
		-- ignore_focus = {'NvimTree'}, -- Filetypes where lualine will be inactive
	},
	sections = {
		lualine_a = { 'mode' },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' }, -- Also has 'encoding' and 'fileformat'

		-- Shows the current loaded LSP clients - their names and icon
		-- Got this from here https://www.reddit.com/r/neovim/comments/11kumh3/comment/jbacpna/
		-- Needs two { for some unknown reason, I hate lua
		-- You can click on it to open the LSP info window
		lualine_x = { {
			function()
				local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
				local icon = require("nvim-web-devicons").get_icon_by_filetype(
					vim.api.nvim_buf_get_option(0, "filetype")
				)
				if lsps and #lsps > 0 then
					local names = {}
					for _, lsp in ipairs(lsps) do
						table.insert(names, lsp.name)
					end
					return string.format("%s %s", table.concat(names, ", "), icon)
				else
					return icon or ""
				end
			end,
			on_click = function()
				vim.api.nvim_command("LspInfo")
			end,
			color = function()
				local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
					vim.api.nvim_buf_get_option(0, "filetype")
				)
				return { fg = color }
			end,
		} },

		-- TODO: Fix this if the copilot-status dude replied to the issue I opened
		lualine_y = { 'filetype' }, -- Removed 'progress'
		-- lualine_y = {'filetype', require('copilot_status').status_string}, -- Removed 'progress'
		-- lualine_y = {require('copilot_status').status_string}, -- Removed 'progress'

		lualine_z = { 'location' }
	},
	inactive_sections = {
		-- Styling of the inactive version, for when you're in the ignored filetype (NvimTree), or when splitting the window, the lualine of the inactive pane
		lualine_a = {},
		lualine_b = { 'branch' },
		lualine_c = { 'filename' },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	extensions = {}
}
