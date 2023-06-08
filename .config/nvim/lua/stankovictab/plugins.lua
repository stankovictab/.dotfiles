-- Packer's list of packages
-- IMPORTANT - Every time you update this config, you need to run :PackerCompile
-- Packer allows for lazy loading of packages, if you configure the 'use' part correctly
-- This is done with event (plugin will load on a specific event) and cmd (on a specific command)

vim.cmd('packadd packer.nvim') -- packadd is vim's command to add a local package, and this is local because I've git cloned it

-- Have packer use a popup window instead of another panel
require('packer').init {
	display = {
		open_fn = function()
			return require('packer.util').float { border = 'rounded' }
		end
	}
}

-- Plugin list
-- Make sure that you seperate a package per 'use', I've had problems putting multiple packages in a single 'use', and with a single config, that doesn't work
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'                      -- Packer itself
	use 'stankovictab/mgz.nvim'                       -- The best theme
	use 'marko-cerovac/material.nvim'                 -- Bosnian theme
	use 'tomasiser/vim-code-dark'                     -- Default VSCode dark theme inspired
	-- use 'rafi/awesome-vim-colorschemes' -- Collection of colorschemes, including iceberg, nord, onedark, etc
	use { 'folke/tokyonight.nvim' }                   -- Tokyonight theme
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "Shatur/neovim-ayu" }                       -- Darker color theme
	use { "shaunsingh/nord.nvim" }                    -- Nord theme, the one mgz is based on
	-- Adding event = "BufWinEnter" screws with nvim-tree's nerd icons
	use { "nvim-tree/nvim-web-devicons" }             -- A dependency for a lot of packages, literally just Nerd Font icons
	use {
		"goolord/alpha-nvim",                         -- Dashboard shown at nvim start with no file
		requires = { "nvim-tree/nvim-web-devicons" },
		config = "require('stankovictab.specifics.alpha')", -- Opens specific config file
		cmd = {
			"Alpha",
			"AlphaRedraw"
		},
		event = "BufWinEnter"
	}
	use {
		'andweeb/presence.nvim', -- The best Discord rich presence plugin
		config = "require('stankovictab.specifics.presence')"
	}
	use "nvim-lua/plenary.nvim"                   -- A weird dependency
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0', -- File Finder
		requires = { 'nvim-lua/plenary.nvim' },
		config = "require('stankovictab.specifics.telescope')"
	}
	use { 'nvim-telescope/telescope-symbols.nvim' } -- Symbols search in Telescope, including emoji, gitmoji, kaomoji, Nerd Font icons, etc          (╯°□°）╯︵ ┻━┻
	-- use {
	-- 	"brenoprata10/nvim-highlight-colors", -- Same, but this one does var() in css, however, it's very laggy in large css files
	-- 	config = function() require('nvim-highlight-colors').setup({
	-- 			render = 'background', -- or 'foreground' or 'first_column'
	-- 			enable_named_colors = true,
	-- 			enable_tailwind = false
	-- 		})
	-- 	end
	-- }
	-- use {
	-- 	"norcalli/nvim-colorizer.lua",           -- Colours on hexadecimal values, like #1155aa
	-- 	config = "require('stankovictab.specifics.nvim-colorizer')"
	-- }
	use {
		'NvChad/nvim-colorizer.lua', -- norcalli/nvim-colorizer.lua is no longer maintained, and this fixes the issue where colors go away when changing themes
		config = "require('stankovictab.specifics.nvim-colorizer')"
	}
	use {
		"windwp/nvim-autopairs", -- Automatically close brackets and quotes
		config = function() require("nvim-autopairs").setup({}) end
	}
	-- use {
	-- 	'akinsho/bufferline.nvim', tag = "v2.*", -- Buffer line at the top (tab bar)
	-- 	requires = 'nvim-tree/nvim-web-devicons',
	-- 	config = "require('stankovictab.specifics.bufferline')"
	-- }
	use {
		'willothy/nvim-cokeline', -- A better buffer line than BufferLine (tab bar at the top of the screen)
		requires = 'nvim-tree/nvim-web-devicons',
		config = "require('stankovictab.specifics.cokeline')"
	}
	use {
		'nvim-tree/nvim-tree.lua', -- File explorer in the left sidebar
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = "require('stankovictab.specifics.nvim-tree')"
	}
	use {
		"akinsho/toggleterm.nvim", tag = '*', -- A better terminal than the builtin
		config = "require('stankovictab.specifics.toggleterm')",
		event = "BufWinEnter"
	}
	use "tpope/vim-commentary" -- gc (block) and gcc (line) to comment out code
	use 'airblade/vim-gitgutter'
	use {
		'nvim-treesitter/nvim-treesitter', -- Treeshitter for better syntax highlighting
		config = "require('stankovictab.specifics.treesitter')",
		run = function()
			require('nvim-treesitter.install').update({
				with_sync = true
			})
		end
	}
	use {
		'nvim-treesitter/playground', -- Treeshitter AST preview on :TSPlaygroundToggle
		config = "require('stankovictab.specifics.playground')"
	}
	use {
		'lukas-reineke/indent-blankline.nvim', -- Vertical lines on indentation
		config = "require('stankovictab.specifics.indent-blankline')"
	}
	use {
		'yamatsum/nvim-cursorline', -- Includes cursorline and cursorword - the second highlights all occurances of the selected word
		config = "require('stankovictab.specifics.nvim-cursorline')"
	}

	use {
		'petertriho/nvim-scrollbar', -- Scrollbar so that I don't get lost
		config = "require('stankovictab.specifics.nvim-scrollbar')"
	}

	use { "dstein64/vim-startuptime", cmd = "StartupTime" } -- Run nvim --startuptime, or :StartupTime

	use {
		'rafamadriz/friendly-snippets', -- Snippet collection
	}
	use { "L3MON4D3/LuaSnip" }    -- LuaSnip snippet engine
	use {
		'hrsh7th/nvim-cmp',       -- Completion engine
		config = "require('stankovictab.specifics.nvim-cmp')"
	}
	use {
		'hrsh7th/cmp-buffer' -- Completion engine - Adding buffer (file) sources
	}
	use {
		'hrsh7th/cmp-path' -- Completion engine - Adding path sources
	}
	use {
		'saadparwaiz1/cmp_luasnip' -- Completion engine - LuaSnip snippet engine sources
	}
	use {
		'hrsh7th/cmp-nvim-lsp' -- Completion engine - LSP sources
	}

	-- The configuration for the following 3 packages is in lsp-hell,
	-- and it needs to be in the 3rd use, apparently
	use "williamboman/mason.nvim" -- LSP installer and manager, a new replacement for nvim-lsp-installer
	-- cmd = {
	-- "MasonInstall",
	-- "MasonUninstall",
	-- "Mason",
	-- "MasonUninstallAll",
	-- "MasonLog",
	-- },
	use "williamboman/mason-lspconfig.nvim" -- Bridge between Mason and lspconfig
	use {
		"neovim/nvim-lspconfig",         -- LSP configuration, this is an integral part
		config = "require('stankovictab.specifics.lsp-hell')"
	}

	use {
		"folke/zen-mode.nvim", -- Like zen mode in vscode, activate with :ZenMode
		config = function()
			require("zen-mode").setup {
				window = {
					-- backdrop = 0.5 -- Default is 0.95
				}
			}
		end
	}

	-- Markdown Preview, use with :MarkdownPreview (Tab + m)
	-- Config needs to be set before the setup, a seperate file isn't needed and doesn't work that great
	vim.g.mkdp_port = '8885'                                   -- Set port for dark reader to turn off
	vim.g.mkdp_auto_close = 0                                  -- To not close the preview when changing buffers, the preview stays open while the markdown buffer is open
	-- Be careful of this, as you'll get an error if you open another preview at the same port. Maybe figure out a way to get around this with mkdp_auto_close and :MarkdownPreviewToggle
	vim.g.mkdp_markdown_css = '~/Desktop/mkdp_mgz.css'         -- CSS file to style the preview
	vim.g.mkdp_highlight_css = '~/Desktop/mkdp_mgz_highlight.css' -- CSS file to style the preview
	use { "iamcco/markdown-preview.nvim", run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	}

	use {
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

	-- use {
	-- 	'jonahgoldwastaken/copilot-status.nvim',
	-- 	-- after = { 'zbirenbaum/copilot.lua' },
	-- 	-- event = "BufReadPost",
	-- 	config = function()
	-- 		require('copilot_status').setup {
	-- 			icons = {
	-- 				idle = " ",
	-- 				error = " ",
	-- 				offline = " ",
	-- 				warning = "𥉉",
	-- 				loading = " ",
	-- 			},
	-- 			debug = false,
	-- 		}
	-- 	end
	-- }

	use {
		'nvim-lualine/lualine.nvim', -- Way better status line than Airline
		-- after = { 'jonahgoldwastaken/copilot-status.nvim' },
		config = "require('stankovictab.specifics.lualine')"
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300 -- Time before WhichKey opens
			require("which-key").setup {} -- In the `mappings` part of the WhichKey docs you can see how to rename entries and groups in whichkey, but that's a little time consuming and maybe not worth the effort
		end
	}
end)
