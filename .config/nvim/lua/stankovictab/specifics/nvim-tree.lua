-- To see the full setup function, see :help nvim-tree-setup
-- To see a specific setting, see :help nvim-tree.SETTING
-- ...and there are a lot of settings

require('nvim-tree').setup { -- BEGIN_DEFAULT_OPTS
  disable_netrw = true, -- Disables the builtin NeoVim explorer
  hijack_cursor = true, -- Resets the cursor to the first letter of file names
  renderer = {
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
		  default = "", -- default = "",
		  open = "", -- open = "", 
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "", -- unstaged = "✗",
          staged = "", -- staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "", -- untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  actions = {
    open_file = {
      quit_on_open = true, -- quit_on_open = false,
    },
  },
}

