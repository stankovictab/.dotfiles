local bufferline = require('bufferline')
bufferline.setup({
    options = {
        indicator = {
            style = 'none' -- 'icon' | 'underline' | 'none'
        },
        buffer_close_icon = '󰅖',
        modified_icon = '', -- , ●
        close_icon = '',
        left_trunc_marker = '',
        separator_style = { '', '' }, -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        right_trunc_marker = '',
        diagnostics = "nvim_lsp",  -- false | "nvim_lsp" | "coc",
        show_buffer_close_icons = false, -- true | false
        sort_by = 'insert_at_end', -- 'insert_after_current' |'insert_at_end' | etc...
        always_show_bufferline = false, -- Whether to show only at >=2 buffers
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree", -- "File Explorer" | function
                text_align = "center", -- "left" | "center" | "right"
                separator = false
            }
        },
    }
})
