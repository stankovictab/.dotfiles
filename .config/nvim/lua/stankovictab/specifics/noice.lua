-- Noice is a collection of features which include a nicer command line, different ways of displaying notifications, better search result showing, and a fidget.nvim substiture (LSP progress)
-- If you configure it properly, it can completely replace everything that the vim status line shows, so you get a bonus line in the editor
-- If nvim.notify is installed, it'll use it instead for displaying notifications, and it'll use it's config
-- mini.notify does a similar thing, but it's pretty barebones

-- Noice has one of the most unnecessarily complicated configs I've ever seen


-- TODO: Do highlighting for all aspects of this in mgz.nvim
-- TODO: What does the W mean in searching?
-- NOTE: diagnosing lua_ls messages print way too much for mgz.nvim for example, it does it every time you type - that's the way lua_ls works, same thing happens in fidget.nvim but it bunches messages together into like ""(x24) Diagnosing lua_ls workspace". 
-- TODO: Search and replace with %s/a/b is fucked somehow, it's not my config that's the problem it seems

-- To see all messages you have a lot of options :
-- - :Noice
-- - :messages
-- - :Telescope noice
-- - :Telescope notify
-- - :Notifications


require("telescope").load_extension("noice")

require("noice").setup({
    -- Recommended defaults
    lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
    },
    -- you can enable a preset for easier configuration
    presets = {
        -- bottom_search = false,     -- use a classic bottom cmdline for search with /
        command_palette = true,   -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,       -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,   -- add a border to hover docs and signature help
    },

    -- My custom config
    -- NOTE: See :h noice, section Configuration for their default values

    cmdline = {
        view = "cmdline_popup", -- 'cmdline_popup' or 'cmdline' (in the bottom bar instead of lualine)
    }
})
