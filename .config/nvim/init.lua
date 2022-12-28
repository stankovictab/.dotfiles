-- NeoVim Config File --

-- If this is your first time running NeoVim, run :PackerClean and :PackerSync

-- TODO: Uncomment impatient when you figure out how to load this first in a clean NeoVim environment without bugs
-- TODO: Not requiring impatient screws with nvim-tree's nerd icons not loading. Makes me think what else it screws with.
-- require("impatient") -- Faster startup (this is a packer package) 

-- TODO: Warnings when something goes wrong when updating packages is in black text, very barely readable, find out how to change that highlight group

require('stankovictab.settings') -- Vim Settings
require('stankovictab.plugins') -- All plugins
require('stankovictab.shortcuts') -- Custom shortcuts
require('stankovictab.themes') -- Theming
