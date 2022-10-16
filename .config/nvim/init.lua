-- NeoVim Config File --

-- If this is your first time running NeoVim, run :PackerClean and :PackerSync

-- TODO: Uncomment when you figure out how to load this first in a clean NeoVim environment without bugs
-- TODO: Also, nvim-tree doesn't load up icons if impitient isn't required?? What??
require("impatient") -- Faster startup (this is a packer package) 
require('stankovictab.settings') -- Vim Settings
require('stankovictab.plugins') -- All plugins
require('stankovictab.shortcuts') -- Custom shortcuts
require('stankovictab.themes') -- Theming
