-- Selecting flavours
vim.g.material_style = "deep ocean"
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

-- MGZ Theme Settings
vim.g.mgz_disable_background = false -- Disable the setting of background color so that NeoVim can use your terminal background (default false) - Leaving false for NeoVide as it can't have a background color
vim.g.mgz_disable_nc_coloring = true -- Disable the setting of coloring the non-focused splits (NC = Non-Current window)
vim.g.mgz_italic_comments = false    -- Whether to render comments in italics or not. Default is true.

-- Material Theme Settings
require('material').setup {
    disable = {
        colored_cursor = true -- Disables the yellow cursor
    },
    contrast = {
        sidebars = true,        -- Darker background in NvimTree
        -- popup_menu =	false, -- Lighter background on (first) cmp completion window
        floating_windows = true -- Darker background on (second) cmp completion window, and on Telescope
        -- non_current_windows = false -- Darker background behind ToggleTerm, for exmple
    }
}

require("rose-pine").setup({
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "main", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,
    styles = {
        bold = true,
        italic = false,
        transparency = false,
    },
})

-- CHANGE THE DEFAULT THEME HERE
vim.cmd('colorscheme mgz') -- For the settings to apply, this needs to be at the end

-- Uncomment to forcefully remove the background color
-- vim.cmd('hi Normal guibg=NONE')
