-- NeoVim Config File --

-- If this is your first time running NeoVim, run :PackerClean and :PackerSync

-- TODO: Enter, Space and Backspace need a new use in Normal Mode
-- TODO: Fix the hex colors, you can't read them most of the time, make it just
-- a square next to the value or something, the font gets screwed up
-- TODO: let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 is a setting I had that did something regarding tmux, don't know what
-- TODO: When opening a file from alpha, there's a weird tab in the top left corner
-- TODO: PgDn as Ctrl + d and PgUp as Ctrl + u ?
-- TODO: Ctrl + Backspace and Ctrl + Del in edit mode should not be stupid

require("impatient") -- Faster startup (this is a packer package)
require('stankovictab.themes') -- Theming
require('stankovictab.settings') -- Vim Settings
require('stankovictab.shortcuts') -- Custom shortcuts
require('stankovictab.plugins') -- All plugins
