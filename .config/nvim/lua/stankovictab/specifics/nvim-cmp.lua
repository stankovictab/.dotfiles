-- Plugin for completion
-- https://github.com/hrsh7th/nvim-cmp
-- Has it's own highlight groups (e.g. CmpItemKindFolder)

local cmp = require('cmp')

require("luasnip/loaders/from_vscode").lazy_load() -- Loading vscode snippets from friendly-snippets

-- Kind Icons
local kind_icons = {
    Text = "󰦨",
    Method = "",
    Function = "󰊕",
    Constructor = "",
    Field = "",
    Variable = "󰫧",
    Class = "",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

-- This disables completion in comments, but in order to know you're in a comment, you need Treeshitter
cmp.setup({
    enabled = function()
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
            return true
        else
            return not context.in_treesitter_capture("comment")
                and not context.in_syntax_group("Comment")
        end
    end
})

cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- TODO - This changes the styles of the suggestion and definition windows
    },
    view = {
        -- custom is the default look, wildmenu is a bar at the bottom, and native just doesn't work
        -- Makes the menu appear above if the cursor is near the bottom of the screen
        entries = { name = 'custom', selection_order = 'near_cursor' }
    },
    formatting = {
        -- This adds icons and type next to suggestion text
        -- fields changes the order, available terms are 'kind', 'abbr' and 'menu' (I think)
        -- fields = { "kind", "abbr", "menu" },
        fields = { "abbr", "kind" },
        format = function(entry, vim_item)
            -- Kind Icons /
            -- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
            vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- Source
            -- vim_item.menu = ({ -- If you leave this on while not using menu, you'll have a large margin on the right
            -- nvim_lsp = "[LSP]",
            -- luasnip = "[Snippet]",
            -- buffer = "[Buffer]",
            -- path = "[Path]",
            -- })[entry.source.name]
            return vim_item
        end,
    },
    experimental = {
        ghost_text = false -- Displays ghost text of the suggestion in the editor
    },
    mapping = cmp.mapping.preset.insert({
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),       -- Ctrl + Space to show all suggestions
        -- ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        -- Tab is used for Copilot, and Ctrl + k is way better than Shift + Tab in my opinion, also made it work in Telescope now
        ['<C-j>'] = cmp.mapping.select_next_item(),   -- Ctrl + j to go down in the list, like in fzf
        ['<C-k>'] = cmp.mapping.select_prev_item()    -- Ctrl + k to go up in the list, like in fzf
    }),
    sources = cmp.config.sources({
        -- Sources are laid out in this order, following a recommendation algorithm
        { name = 'path' }, -- Importing system path sources
        { name = 'buffer' }, -- Importing buffer (file) text sources (words in the current file)
        { name = 'nvim_lsp' }, -- Importing LSP sources
        -- { name = 'luasnip' }, -- Importing snippet sources
        -- { name = 'cmdline' } -- Importing command line sources TODO: Requires a new plugin?
    })
}
