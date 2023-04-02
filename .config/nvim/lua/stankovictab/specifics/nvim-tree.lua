-- To see the full setup function, see :help nvim-tree-setup
-- To see a specific setting, see :help nvim-tree.SETTING
-- ...and there are a lot of settings

-- The open_on_setup configuration is now depricated, now you need to use this ugly ass function
-- You can configure it to open only on folders, not on files, on empty buffers, etc, see more here
-- https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup
local function open_nvim_tree(data)
	-- buffer is a directory
	local directory = vim.fn.isdirectory(data.file) == 1

	if not directory then
		return
	end

	-- change to the directory
	vim.cmd.cd(data.file)
	-- open the tree
	require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
	disable_netrw = true, -- Disables the builtin NeoVim explorer, default false
	hijack_cursor = true, -- Locks the cursor to the first letter of file names
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_closed = "",
					arrow_open = "",
					default = "", -- default = "",
					open = "", -- open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "", -- unstaged = "✗",
					staged = "", -- staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "", -- untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
			git_placement = "after", -- Git info goes after name of file or folder
		},
	},
	actions = {
		open_file = {
			quit_on_open = true, -- Whether to close nvim-tree when opening a file from it
		},
	},
}
