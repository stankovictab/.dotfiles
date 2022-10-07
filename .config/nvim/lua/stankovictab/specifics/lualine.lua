require('lualine').setup {
  options = {
    theme = 'auto', -- If the current colorscheme has a lualine theme built in, it'll recognize it
	-- The color of component_separators is the same as the text
    -- component_separators = { left = '', right = ''},
    -- component_separators = { left = '', right = ''},
    component_separators = { left = '|', right = '|'},
    -- component_separators = { left = '', right = ''},
	-- The color of section_separators is the same as the background
    section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    disabled_filetypes = {},
	ignore_focus = {'NvimTree'},       -- If current filetype is in this list it'll
                             -- always be drawn as inactive statusline
                             -- and the last window will be drawn as active statusline.
                             -- for example if you don't want statusline of
                             -- your file tree / sidebar window to have active
                             -- statusline you can add their filetypes here.
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat'},
    lualine_y = {'filetype'}, -- Removed 'progress'
    lualine_z = {'location'}
  },
  inactive_sections = { -- Styling of the inactive version, for when you're in the ignored filetype (NvimTree)
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

