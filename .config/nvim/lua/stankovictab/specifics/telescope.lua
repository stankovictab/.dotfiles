require('telescope').setup{
	pickers = {
		find_files = {
			-- Allowing find_files to find hidden files
			find_command = {'rg', '--files', '--hidden', '-g', '!.git'}
		},
	},
	defaults = {
		layout_config = {
			width = 900, -- Width of telescope
			preview_width = 0.5 -- Percentage of the telescope's width that the preview is
		},
		file_ignore_patterns = { "node_modules" }, -- Ignore node_modules folder
		-- Allowing live_grep to search through hidden files
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case", -- Everything up to here is default, only --hidden is added
			"--hidden"
		}
	}
}
