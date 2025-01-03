require('nvim-cursorline').setup {
    cursorline = {
        enable = false,
        -- timeout = 1000,
        -- number = false,
    },
    cursorword = {
        enable = true,
        min_length = 2,
        hl = { underline = false, bg = "#1D2638" }, -- See nvim_set_hl() for parameters
    }
}
