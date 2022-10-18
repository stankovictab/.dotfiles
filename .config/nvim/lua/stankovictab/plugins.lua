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
-- Make sure that you seperate a package per use, I've had problems putting multiple packages in a single use, and with a single config, that doesn't work
return require('packer').startup(function(use)

	use 'wbthomason/packer.nvim' -- Packer itself
	use 'lewis6991/impatient.nvim' -- Faster loading of packages
	use 'stankovictab/mgz.nvim' -- The best theme
	use 'marko-cerovac/material.nvim' -- Bosnian theme
	use 'tomasiser/vim-code-dark' -- Default VSCode dark theme inspired
	-- use 'rafi/awesome-vim-colorschemes' -- Collection of colorschemes, including iceberg, nord, onedark, etc
	use { "catppuccin/nvim", as = "catppuccin" }
	use { "Shatur/neovim-ayu" } -- Darker color theme
	use { "shaunsingh/nord.nvim" } -- Nord theme, the one mgz is based on
	use { "kyazdani42/nvim-web-devicons", event = "BufWinEnter" } -- A weird dependency
	use {
		"goolord/alpha-nvim", -- Dashboard shown at nvim start with no file
		requires = { "kyazdani42/nvim-web-devicons" },
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
	use {
		'nvim-lualine/lualine.nvim', -- Way better status line than Airline
		config = "require('stankovictab.specifics.lualine')"
	}
	use "nvim-lua/plenary.nvim" -- A weird dependency
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0', -- File Finder
		requires = { 'nvim-lua/plenary.nvim' },
		config = function() require("telescope").setup({
				defaults = {
					file_ignore_patterns = { "node_modules" } -- Ignore node_modules folder
				}
			})
		end
	}
	use {
		"norcalli/nvim-colorizer.lua", -- Colours on hexadecimal values, like #1155aa
		config = "require('stankovictab.specifics.nvim-colorizer')"
	}
	-- use {
	-- 	"brenoprata10/nvim-highlight-colors", -- Same, but this one does var() in css, however, it's very laggy in large css files
	-- 	config = function() require('nvim-highlight-colors').setup({
	-- 			render = 'background', -- or 'foreground' or 'first_column'
	-- 			enable_named_colors = true,
	-- 			enable_tailwind = false
	-- 		})
	-- 	end
	-- }
	use {
		"windwp/nvim-autopairs", -- Automatically close brackets and quotes
		config = function() require("nvim-autopairs").setup({}) end
	}
	use {
		'akinsho/bufferline.nvim', tag = "v2.*", -- Buffer line at the top (tab bar)
		requires = 'kyazdani42/nvim-web-devicons',
		config = "require('stankovictab.specifics.bufferline')"
	}
	use {
		'kyazdani42/nvim-tree.lua', -- File explorer in the left sidebar
		requires = { 'kyazdani42/nvim-web-devicons' },
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
		run = function() require('nvim-treesitter.install').update({
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
	use { "L3MON4D3/LuaSnip" } -- LuaSnip snippet engine
	use {
		'hrsh7th/nvim-cmp', -- Completion engine
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
		"neovim/nvim-lspconfig", -- LSP configuration, this is an integral part
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
end)
