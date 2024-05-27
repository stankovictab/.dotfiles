local symbol_map = {
    error = "",
    warning = "",
    info = "",
    hint = "",
}

require('bufferline').setup({
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
        diagnostics = "nvim_lsp",     -- false | "nvim_lsp" | "coc",
        -- The diagnostics_indicator needs to be set after diagnostics
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local suffix = ""
            for kind, num in pairs(diagnostics_dict) do
                suffix = string.format("%s %s %d", suffix, symbol_map[kind], num)
            end
            return suffix
        end,
        show_buffer_close_icons = false, -- true | false
        sort_by = 'insert_at_end',       -- 'insert_after_current' |'insert_at_end' | etc...
        always_show_bufferline = false,  -- Whether to show only at >=2 buffers
        offsets = {
            {
                filetype = "NvimTree",
                text = "NvimTree",     -- "File Explorer" | function
                text_align = "center", -- "left" | "center" | "right"
                separator = false
            }
        },
    }
})
