-- Which-Key Configuration
-- See :checkhealth which-key for very useful details!

-- TODO: Which-Key v3 added icons, you can turn them off or use special ones, not sure about how highlighting on them works but it is tied to the theme

local wk = require("which-key")
wk.setup {
    icons = {
        -- breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        -- separator = "➜", -- symbol used between a key and it's label
        group = " ", -- symbol prepended to a group
    },
}
wk.add({
    -- Groups
    -- WhichKey can name groups, I name groups here but all the shortcuts are in shortcuts.lua
    { "<leader>",  group = "Leader Key" },
    { "<leader>l", group = "LSP" },
    { "<leader>p", group = "Packages" },
    { "<leader>s", group = "Misc" },
    { "<leader>r", group = "Reload" },
    { "<leader>g", group = "Git" },
    { "<leader>v", group = "Visual Multi (Multi-Cursor)" },
    { "s",         group = "Surround" },
    { "g",         group = "Go" },
    { "[",         group = "Jump To Previous" },
    { "]",         group = "Jump To Next" },
    { ";",         group = "Bonus" },
    { "z",         group = "Folds" },
    -- { "zE", group = "Delete All Folds"
    -- NOTE: You can also add things like <leader>gs

    -- Individual Mappings
    -- WhichKey sometimes doesn't have some entries, even though they exist in Vim, so I add them here
    { "zE", desc = "Delete All Folds" },
    { "zd", desc = "Delete Fold Under Cursor" },
})
