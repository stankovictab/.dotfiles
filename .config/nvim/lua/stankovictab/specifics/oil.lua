-- Previews don't work in floating mode for some reason
require('oil').setup({
    default_file_explorer = true,
    columns = {
        "icon",
        -- "permissions",
        -- "size",
        -- "mtime",
    },
    keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["l"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit", -- Default: <C-s>
        ["<C-h>"] = "actions.select_split",  -- Default: <C-h>
        ["<C-t>"] = "actions.select_tab",    -- Don't do this
        ["<C-p>"] = "actions.preview",       -- Default: <C-p>
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        ["<C-l>"] = "actions.refresh", -- Default: <C-l>
        -- ["-"] = "actions.parent", -- Planning to use - as decrement
        ["<BS>"] = "actions.parent",
        ["h"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["gs"] = "actions.change_sort",
        ["gx"] = "actions.open_external",
        ["g."] = "actions.toggle_hidden",
        ["g\\"] = "actions.toggle_trash",
    },
    win_options = {
        signcolumn = "yes:2",             -- Used by the oil-git-status.nvim plugin
    },
    view_options = {
        show_hidden = true,
        sort = {
            -- sort order can be "asc" or "desc"
            -- see :help oil-columns to see which columns are sortable
            { "type", "asc" },
            { "name", "asc" },
        },
    },
    float = {
        -- Padding around the floating window
        padding = 2,
        max_width = 0,
        max_height = 0,
        border = "rounded",
        win_options = {
            winblend = 0,
        },
    },
})
