-- lazy.nvim is a modern plugin manager, better than packer.nvim (lazy loading, caching, no git cloning, etc)
-- Plugins can be loaded on events, commands, keymaps or buffer types, and they don't need to be manually compiled every time you make a change
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" -- This is ~/.local/share/nvim/lazy/lazy.nvim
if not vim.loop.fs_stat(lazypath) then                       -- Check if lazy.nvim is installed, if not clone it
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = '	' -- NOTE - THIS IS TEMPORARY, SEE IF IT WORKS WITHOUT IT HERE, dude says it's needed here
-- TODO: To not leave this here, divide shortcuts into two groups, before plugins and after plugins
-- TODO: I don't remember what these upper two lines mean and what this is for...

-- Markdown Preview, use with :MarkdownPreview (Tab + m)
-- Because this plugin is ancient, you need to set it up like this, and not with the lazy plugin manager
vim.g.mkdp_port = '8885'                                      -- Set port for dark reader to turn off
vim.g.mkdp_auto_close = 0                                     -- To not close the preview when changing buffers, the preview stays open while the markdown buffer is open
-- Be careful of this, as you'll get an error if you open another preview at the same port. Maybe figure out a way to get around this with mkdp_auto_close and :MarkdownPreviewToggle
vim.g.mkdp_markdown_css = '~/Desktop/mkdp_mgz.css'            -- CSS file to style the preview
vim.g.mkdp_highlight_css = '~/Desktop/mkdp_mgz_highlight.css' -- CSS file to style the preview

local plugins = {
	-- Themes
	"stankovictab/mgz.nvim", -- The best theme
	"shaunsingh/nord.nvim", -- Nord theme, the one mgz is based on
	"marko-cerovac/material.nvim",
	"tomasiser/vim-code-dark", -- Default VSCode Dark Theme inspired
	"folke/tokyonight.nvim",
	"catppuccin/nvim",
	"shatur/neovim-ayu",
	-- "rafi/awesome-vim-colorschemes",       -- Collection of colorschemes, including iceberg, nord, onedark, etc

	-- FIXME: Alpha takes 100ms to spin up (a third of the startup time) so I just disabled it for now.
	-- {
	-- 	"goolord/alpha-nvim",                                      -- Dashboard shown at nvim start with no file
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function() require('stankovictab.specifics.alpha') end, -- Opens specific config file
	-- 	cmd = {
	-- 		"Alpha",
	-- 		"AlphaRedraw"
	-- 	},
	-- 	event = "VimEnter"
	-- },
	{
		"andweeb/presence.nvim", -- The best Discord rich presence plugin
		event = "VeryLazy", -- TODO: Experimenting with this
		config = function() require('stankovictab.specifics.presence') end
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = '0.1.2',                        -- Says so in their README
		dependencies = { 'nvim-lua/plenary.nvim' }, -- A weird dependency
		cmd = 'Telescope',
		config = function() require('stankovictab.specifics.telescope') end
	},
	"nvim-telescope/telescope-symbols.nvim", -- Symbols search in Telescope, including emoji, gitmoji, kaomoji, Nerd Font icons, etc     (╯°□°）╯︵ ┻━┻
	{
		'NvChad/nvim-colorizer.lua',
		-- Between this, norcalli/nvim-colorizer.lua and brenoprata10/nvim-highlight-colors, this is the best one, as it's maintained, and it fixes the issue where colors go away when changing themes, however, it still doesn't support var() in css sadly
		config = function() require('stankovictab.specifics.nvim-colorizer') end
	},
	{
		"windwp/nvim-autopairs", -- Automatically close brackets and quotes
		event = "InsertEnter",
		config = function() require("nvim-autopairs").setup({}) end
	},
	{
		'willothy/nvim-cokeline', -- A better buffer line than BufferLine (tab bar at the top of the screen)
		dependencies = 'nvim-tree/nvim-web-devicons',
		event = "BufAdd",   -- Only load cokeline after you open up another buffer. NOTE: This is specific for my config, so if you want CokeLine to always be visible, load it up on some other event.
		config = function() require('stankovictab.specifics.cokeline') end,
	},
	{
		'nvim-tree/nvim-tree.lua', -- File explorer in the left sidebar
		-- NOTE: The `nvim .` command gets broken if NvimTree is loaded on the NvimTreeToggle event - it can't read the config and doesn't know about the autocmd that opens the tree on directory, so, it needs to be loaded up on startup
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function() require('stankovictab.specifics.nvim-tree') end
	},
	"tpope/vim-commentary", -- Ctrl + /, gc (block) and gcc (line) to comment out code
	{
		'lewis6991/gitsigns.nvim', -- Git signs in the gutter, better than airblade/vim-gitgutter
		config = function()
			require('gitsigns').setup {
				signs                        = {
					add          = { text = '│' }, -- │
					change       = { text = '│' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`, signs in the line number gutter
				numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`, highlight line numbers
				linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`, highlight line changes, could be useful to toggle sometimes, but the theme needs to support this well in order to see it
				word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
				current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`, git blame in the current line after set timeout
				current_line_blame_opts      = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
			}
		end
	},
	{
		'nvim-treesitter/nvim-treesitter', -- TreeShitter for "better" syntax highlighting, but the only thing it's done is shorten my life expectancy
		config = function() require('stankovictab.specifics.treesitter') end,
		build = function()
			require('nvim-treesitter.install').update({
				with_sync = true
			})
		end
	},
	{
		'nvim-treesitter/playground', -- Treeshitter AST preview on :TSPlaygroundToggle
		cmd = "TSPlaygroundToggle",
		config = function() require('stankovictab.specifics.playground') end
	},
	{
		'lukas-reineke/indent-blankline.nvim', -- Vertical lines on indentation
		-- config = function() require('stankovictab.specifics.indent-blankline') end
		config = function()
			require("ibl").setup {
				-- NOTE: v3 has a new config, see the docs (if there are any, seems barren, see :h ibl.config)
				-- The "scope" in the help text is the function scope that's currently being accessed, meaning the scope for declaring variables, etc
				indent = {
					char = "│", -- See :h ib.config.indent for more examples for chars
				},
				-- For excluding certain filetypes and buftypes, see :h ibl.config.exclude
			}
		end,
	},
	{
		'yamatsum/nvim-cursorline', -- Includes cursorline and cursorword - the second highlights all occurances of the selected word
		config = function() require('stankovictab.specifics.nvim-cursorline') end
	},
	{
		'petertriho/nvim-scrollbar', -- Scrollbar so that I don't get lost
		config = function() require('stankovictab.specifics.nvim-scrollbar') end
	},
	"rafamadriz/friendly-snippets", -- Snippet collection
	"L3MON4D3/LuaSnip",          -- LuaSnip snippet engine
	{
		'hrsh7th/nvim-cmp',      -- Completion engine
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-buffer', -- Completion engine - Adding buffer (file) sources
			'hrsh7th/cmp-path', -- Completion engine - Adding path sources
			'saadparwaiz1/cmp_luasnip', -- Completion engine - LuaSnip snippet engine sources
			'hrsh7th/cmp-nvim-lsp', -- Completion engine - LSP sources
		},
		config = function() require('stankovictab.specifics.nvim-cmp') end
	},
	-- The configuration for the following 3 packages is in lsp-hell
	{
		"williamboman/mason.nvim", -- LSP installer and manager, a new replacement for nvim-lsp-installer
		-- build = ":MasonUpdate",
	},
	"williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
	{
		"neovim/nvim-lspconfig",      -- LSP configuration, this is an integral part, this is developed by the NeoVim team
		config = function() require('stankovictab.specifics.lsp-hell') end
	},
	{
		"folke/zen-mode.nvim", -- Like zen mode in vscode, activate with :ZenMode
		cmd = "ZenMode",
		opts = {
			window = {
				-- backdrop = 0.5 -- Default is 0.95
			}
		}
	},
	-- See this if this piece of shit doesn't open up again https://github.com/iamcco/markdown-preview.nvim/issues/424, you have to run a script manually
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter", -- Copilot will be started only when entering insert mode
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true, -- Changed, false means you need to press next or prev to trigger copilot
					debounce = 75,
					keymap = {
						accept = false, -- Changed, needs to be false for the Tab rebind down there to work
						accept_word = false,
						accept_line = false,
						prev = "<M-[>", -- Alt + [ is the previous suggestion
						next = "<M-]>", -- Alt + ] is the next suggestion
						dismiss = "<C-]>", -- Ctrl + ] is to dismiss suggestion
					},
				},
				filetypes = {
					yaml = true, -- Changed
					markdown = true, -- Changed
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end
	},
	{
		'nvim-lualine/lualine.nvim', -- Way better status line than Airline
		config = function() require('stankovictab.specifics.lualine') end
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy", -- Can't be loaded on cmd :WhichKey because that cmd isn't being ran
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300 -- Time before WhichKey opens
		end,
		opts = {}
	},
	-- { "Lilja/zellij.nvim", -- NeoVim + Zellij Navigation (NOTE Temporary until an official implementation is presented, see #967, and see the explanation of why I'm not using this for now in the dotfiles README)
	-- 	config = function()
	-- 		require('zellij').setup({})
	-- 	end },
	{
		"kdheepak/lazygit.nvim", -- Git UI in Neovim, use with :LazyGit (same as opening a terminal and running lazygit)
		cmd = "LazyGit",
	},
	{
		"folke/flash.nvim", -- Better text navigation
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					keys = { "f", "F" } -- Removed t, T, ; and , as I need ; for WhichKey, , for .jump(), and t and T for other things
				}
			}
		}
	},
	{
		"tamton-aquib/duck.nvim",
		keys = { -- Only load the plugin on these key presses, and bind these keys
			{ "<leader>sd", function() require("duck").hatch("🐧", 10) end, desc = "Duck Hatch" }, -- Default is a duck
			{ "<leader>sc", function() require("duck").cook() end, desc = "Duck Cook" }
		}
	}
}

-- This bunch of shit makes it so that Tab completes the suggestion, or just inserts Tab if there's no suggestion
vim.keymap.set("i", '<Tab>', function()
	if require("copilot.suggestion").is_visible() then
		require("copilot.suggestion").accept()
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), 'n', false)
	end
end, {
	silent = true,
})

local opts = {}

return require('lazy').setup({ plugins, opts })
