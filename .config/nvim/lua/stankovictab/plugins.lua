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

vim.g.mapleader = '	' -- Tab is the leader, not space

local plugins = {
    -- Themes
    "stankovictab/mgz.nvim",   -- The best theme
    "shaunsingh/nord.nvim",    -- Nord theme, the one mgz is based on
    "marko-cerovac/material.nvim",
    "tomasiser/vim-code-dark", -- Default VSCode Dark Theme inspired
    "folke/tokyonight.nvim",
    "catppuccin/nvim",
    "shatur/neovim-ayu",
    "rose-pine/neovim",
    "sam4llis/nvim-tundra",
    -- "rafi/awesome-vim-colorschemes", -- Collection of colorschemes, including iceberg, nord, onedark, etc

    {
        "goolord/alpha-nvim",                                            -- Dashboard shown at nvim start with no file
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require('stankovictab.specifics.alpha') end, -- Opens specific config file
        cmd = {
            "Alpha",
            "AlphaRedraw"
        },
        event = "VimEnter"
    },
    -- NOTE: Kinda useless and invasive and slow for boot up, uncomment if you need it
    -- {
    -- 	"andweeb/presence.nvim", -- The best Discord rich presence plugin
    -- 	-- event = "VeryLazy", -- TODO: Experimenting with this
    -- 	config = function() require('stankovictab.specifics.presence') end
    -- },
    {
        "nvim-telescope/telescope.nvim",
        -- Don't use the tag, as that'll pin the version, and you'll end up wondering why has no one still not fixed these stupid Telescope bugs when I've known about them for ages, so, just use the latest version, no tag
        dependencies = { 'nvim-lua/plenary.nvim' }, -- A weird dependency
        cmd = 'Telescope',
        config = function() require('stankovictab.specifics.telescope') end
    },
    "nvim-telescope/telescope-symbols.nvim", -- Symbols search in Telescope, including emoji, gitmoji, kaomoji, Nerd Font icons, etc	 (╯°□°）╯︵ ┻━┻
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
        "akinsho/bufferline.nvim",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function() require('stankovictab.specifics.bufferline') end,
    },
    -- NOTE: I've stopped using nvim-cokeline, instead using bufferline.nvim
    -- {
    -- 	'willothy/nvim-cokeline', -- Another buffer line (tab bar at the top of the screen)
    -- 	dependencies = 'nvim-tree/nvim-web-devicons',
    -- 	event = "BufAdd",   -- Only load cokeline after you open up another buffer. NOTE: This is specific for my config, so if you want CokeLine to always be visible, load it up on some other event. config = function() require('stankovictab.specifics.cokeline') end, },
    -- {
    --     'nvim-tree/nvim-tree.lua', -- File explorer in the left sidebar
    --     -- NOTE: The `nvim .` command gets broken if NvimTree is loaded on the NvimTreeToggle event - it can't read the config and doesn't know about the autocmd that opens the tree on directory, so, it needs to be loaded up on startup
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function() require('stankovictab.specifics.nvim-tree') end
    -- },
    {
        "kdheepak/lazygit.nvim", -- Git UI in Neovim, use with :LazyGit (same as opening a terminal and running lazygit)
        cmd = "LazyGit",
    },
    {
        'lewis6991/gitsigns.nvim', -- Git signs in the gutter, better than airblade/vim-gitgutter
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { text = '│' }, -- │
                    change       = { text = '│' }, -- │
                    delete       = { text = '_' }, -- _
                    topdelete    = { text = '‾' }, -- ‾
                    changedelete = { text = '~' }, -- ~
                    untracked    = { text = '┆' }, -- ┆
                },
                signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`, signs in the line number gutter
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`, highlight line numbers
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`, highlight line changes, could be useful to toggle sometimes, but the theme needs to support this well in order to see it
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`, git blame in the current line after set timeout
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 200,
                    ignore_whitespace = false,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
            }
        end
    },
    {
        'nvim-treesitter/nvim-treesitter', -- TreeShitter for "better" syntax highlighting, but the only thing it's done is shorten my life expectancy
        build = ":TSUpdate",
        config = function() require('stankovictab.specifics.treeshitter') end,
    },
    {
        'nvim-treesitter/playground', -- Treeshitter AST preview on :TSPlaygroundToggle
        cmd = "TSPlaygroundToggle",
        config = function() require('stankovictab.specifics.playground') end
    },
    {
        'lukas-reineke/indent-blankline.nvim', -- Vertical lines on indentation and horizontal on scope
        version = 'v3.8.2', -- TODO: Remove when this issue is fixed - https://github.com/lukas-reineke/indent-blankline.nvim/issues/936
        config = function()
            require("ibl").setup({
                indent = {
                    char = "▏", -- ▏ (left), │ (center), ▕ (right), see :h ib.config.indent for more examples for chars
                    tab_char = "", -- Indent character for tab characters, overrides default char if char isn't set
                    smart_indent_cap = false, -- ?
                },
                scope = { -- Scope is the highlighted vertical and horizontal line where variables have scope, it uses treeshitter and tanks a little on performance, and just looks bad
                    enabled = false,
                },
                exclude = {
                    filetypes = {
                        "help",
                        "alpha",
                        "dashboard",
                        "neo-tree",
                        "Trouble",
                        "lazy",
                        "mason",
                        "notify",
                        "toggleterm",
                        "lazyterm",
                    },
                }
            })
        end,
    },
    {
        'yamatsum/nvim-cursorline', -- Includes cursorline and cursorword - the second highlights all occurances of the selected word
        config = function() require('stankovictab.specifics.nvim-cursorline') end
    },
    {
        "dstein64/nvim-scrollview",
        config = function() require('stankovictab.specifics.nvim-scrollview') end
    },
    "rafamadriz/friendly-snippets", -- Snippet collection
    "L3MON4D3/LuaSnip",             -- LuaSnip snippet engine
    {
        'hrsh7th/nvim-cmp',         -- Completion engine
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/cmp-buffer',       -- Completion engine - Adding buffer (file) sources
            'hrsh7th/cmp-path',         -- Completion engine - Adding path sources
            'saadparwaiz1/cmp_luasnip', -- Completion engine - LuaSnip snippet engine sources
            'hrsh7th/cmp-nvim-lsp',     -- Completion engine - LSP sources
        },
        config = function() require('stankovictab.specifics.nvim-cmp') end
    },
    -- {
    --     "Saghen/blink.cmp", -- TODO: A newer completion engine, with builtin support for sources, unlike nvim-cmp
    --     lazy = false, -- lazy loading handled internally
    --     dependencies = 'rafamadriz/friendly-snippets',
    --     version = 'v0.*',
    -- },
    -- The configuration for the following 3 packages is in lsp-hell
    {
        "williamboman/mason.nvim", -- LSP installer and manager, a new replacement for nvim-lsp-installer
        -- build = ":MasonUpdate",
    },
    "williamboman/mason-lspconfig.nvim", -- Bridge between Mason and lspconfig
    {
        "neovim/nvim-lspconfig",         -- LSP configuration, this is an integral part, this is developed by the NeoVim team
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
    -- NOTE: If this piece of shit doesn't open up again see https://github.com/iamcco/markdown-preview.nvim/issues/424, you have to run a script manually
    -- bash ~/.local/share/nvim/lazy/markdown-preview.nvim/app/install.sh
    -- NOTE: The maintainer bailed on this project, look for alternatives. vivify.nvim (and Vivify in general) is a good alternative it seems, but might be overkill.
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            -- Markdown Preview, use with :MarkdownPreview (Tab + m)
            -- Because this plugin is ancient, you need to set it up like this, and not with the lazy plugin manager
            vim.g.mkdp_port = '8885'  -- Set port for dark reader to turn off
            vim.g.mkdp_auto_close = 0 -- To not close the preview when changing buffers, the preview stays open while the markdown buffer is open
            -- Be careful of this, as you'll get an error if you open another preview at the same port. Maybe figure out a way to get around this with mkdp_auto_close and :MarkdownPreviewToggle
            vim.g.mkdp_markdown_css =
            '~/.config/nvim/lua/stankovictab/specifics/mkdp_mgz.css'           -- CSS file to style the preview
            vim.g.mkdp_highlight_css =
            '~/.config/nvim/lua/stankovictab/specifics/mkdp_mgz_highlight.css' -- CSS file to style the preview
        end,
        ft = { "markdown" },
    },
    -- {
    --     'Exafunction/codeium.vim', -- A better Copilot (NOTE: there's also codeium.nvim??)
    --     cmd = "Codeium",           -- Codeium will be started when performing Codeium command
    --     event = "InsertEnter",     -- Codeium will be started when entering insert mode
    --     config = function()
    --         -- Change '<C-g>' here to any keycode you like.
    --         vim.keymap.set('i', '	', function() return vim.fn['codeium#Accept']() end, { expr = true })
    --         vim.keymap.set('i', '<M-p>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
    --         vim.keymap.set('i', '<M-n>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
    --         -- vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#Clear']() end, { expr = true }) -- For now this is the default, Ctrl + ]
    --     end
    -- },
    {
        "supermaven-inc/supermaven-nvim",
        -- A way better Copilot, better than Codeium
        -- It has support for being a source in CMP
        -- Used with :Supermaven
        -- TODO: It doesn't look like you can cycle through the suggestions?
        config = function()
            require("supermaven-nvim").setup({
                -- Config created from the default on the GitHub page
                keymaps = {
                    accept_suggestion = "<Tab>",
                    clear_suggestion = "<C-]>",
                    accept_word = "<C-'>", -- Default is <C-j>
                },
                ignore_filetypes = { "alpha" },     -- Example is { "cpp" }
                color = {
                    -- suggestion_color = "#ffffff", -- Should override the theme, but for some reason doesn't - it uses the "Comment" highlight group, not @comment
                    cterm = 244,
                },
                -- log_level = "info",                -- set to "off" to disable logging completely
                -- disable_inline_completion = false, -- disables inline completion for use with cmp
                -- disable_keymaps = false,           -- disables built in keymaps for more manual control
                -- condition = function()
                --     return false
                -- end
            })
        end,
    },
    {
        "folke/which-key.nvim",
        dependencies = 'echasnovski/mini.icons',
        event = "VeryLazy", -- Can't be loaded on cmd :WhichKey because that cmd isn't being ran
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300 -- Time before WhichKey opens
        end,
        config = function() require('stankovictab.specifics.which-key') end
    },
    {
        'nvim-lualine/lualine.nvim', -- Way better status line than Airline
        config = function() require('stankovictab.specifics.lualine') end
    },
    -- TODO: This plugin is in development and I haven't configured it fully, it might need some dependencies
    -- See more here - https://github.com/hiasr/vim-zellij-navigator
    -- {
    -- 	"hiasr/vim-zellij-navigator", -- NeoVim + Zellij Navigation
    -- 	config = function()
    -- 		require('vim-zellij-navigator').setup({})
    -- 	end
    -- },
    {
        "folke/flash.nvim", -- Better text navigation
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false, -- Disabled flash on / as it messes up with my workflow, and I have , which works great
                },
                char = {
                    keys = {} -- Removed f, F, t, T, ; and , as I need ; for WhichKey, , for .jump(), and t and T for other things
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
    },
    {
        -- Automatically change the working directory to the project root (git repository)
        -- Also adds :Telescope projects option
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- TODO: There's more to configure, like :Telescope projects
                detection_methods = { "pattern" }, -- Default is { "lsp", "pattern" }
            }
        end
    },
    {
        'cameron-wags/rainbow_csv.nvim', -- TreeShitter doesn't support csv? Use :RainbowAlign to align the columns, very useful!
        config = true,
        -- Lazy Loading :
        ft = {
            'csv',
            'tsv',
            'csv_semicolon',
            'csv_whitespace',
            'csv_pipe',
            'rfc_csv',
            'rfc_semicolon'
        },
        cmd = {
            'RainbowDelim',
            'RainbowDelimSimple',
            'RainbowDelimQuoted',
            'RainbowMultiDelim'
        }
    },
    {
        -- Replaces s key to be used for surrounding. Also fills WhichKey with bindings.
        -- Examples are saiw", saiw], saiw?[[<CR>]]<CR>, or maybe with visual first, viwsa"
        -- Can be repeated with .
        'echasnovski/mini.surround',
        version = '*',
        config = function()
            require('mini.surround').setup()
        end
    },
    {
        -- Hands down this is the most complicated plugin in the world
        -- Multi-cursors done (maybe a bit too) right, updating in real time
        -- TODO: Maybe a lualine signal to better know that you're in VM mode?
        'mg979/vim-visual-multi',
        branch = 'master',
        event = 'VeryLazy',
        init = function()
            vim.g.VM_default_mappings = 0 -- Disable ALL default mappings, except for Ctrl + n (puts a cursor on the same current word)
            vim.g.VM_maps = {
                -- Find Under is Ctrl + n by default, here it can be changed, for example to '' to unbind it (as I'm using it for zellij)
                ["Find Under"] = ''
            }
        end
    },
    {
        'echasnovski/mini.files', -- The newest file explorer
        version = '*',
        config = function() require('stankovictab.specifics.mini-files') end
    },
    -- {
    --     -- Simple file explorer that uses native vim keybinds for editing
    --     -- Use with :Oil, or :Oil --float
    --     'stevearc/oil.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function() require('stankovictab.specifics.oil') end
    -- },
    -- {
    --     "refractalize/oil-git-status.nvim",
    --     dependencies = {
    --         "stevearc/oil.nvim",
    --     },
    --     config = true,
    -- },
    {
        -- TODO: Find a use case for this and configure it
        'stevearc/dressing.nvim', -- A nicer interface for vim.ui.select (various input fields)
        opts = {},
    },
    -- NOTIFICATIONS --
    -- You have a couple of options here, depending on what you need
    -- NOTE: nvim-notify is just an API either for other plugins or for your own custom notifications - by default it doesn't do anything. In order to redirect vim messages (like the :lua print) to nvim-notify, you'll need to use noice.nvim.
    -- Option 1 - Noice
    -- For details on Noice, see the plugin configuration
    -- {
    --     "rcarriga/nvim-notify",
    --     event = "VeryLazy",
    --     config = function() require("stankovictab.specifics.nvim-notify") end
    -- },
    -- {
    --     "folke/noice.nvim",
    --     event = "VeryLazy",
    --     dependencies = {
    --         "MunifTanjim/nui.nvim", -- NeoVim UI library dependency
    --         -- OPTIONAL:
    --         --   `nvim-notify` is only needed, if you want to use the notification view.
    --         --   If not available, Noice uses the `mini` view as the fallback, meaning it'll show notifications in the bottom right, like the fidget.nvim part of the plugin
    --         "rcarriga/nvim-notify",
    --     },
    --     config = function() require('stankovictab.specifics.noice') end
    -- },
    -- Option 2 - Mini.Notify
    -- {
    --     'echasnovski/mini.notify',
    --     version = '*',
    --     config = function() require('stankovictab.specifics.mini-notify') end
    -- },
    -- Option 3 - fidget.nvim and modified nvim-notify
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        config = function() require('fidget').setup() end
    },
}

local opts = {}

return require('lazy').setup({ plugins, opts })
