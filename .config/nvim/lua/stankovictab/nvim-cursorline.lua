require('nvim-cursorline').setup {
  cursorline = {
    enable = false,
    -- timeout = 1000,
    -- number = false,
  },

  -- You can change the style of the highlight with this command
  -- :highlight CursorWord guibg=#222222
  -- The default behaviour is :highlight CursorWord gui=underline

  cursorword = {
    enable = true,
    min_length = 1,
    hl = { underline = false, bg = "#223252" }, -- See nvim_set_hl() for parameters
  }
}
