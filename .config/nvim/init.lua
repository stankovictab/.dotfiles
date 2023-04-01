-- NeoVim Config File --

-- If this is your first time running NeoVim, do Tab + p + s

-- TODO: Uncomment impatient when you figure out how to load this first in a clean NeoVim environment without bugs
-- TODO: Not requiring impatient screws with nvim-tree's nerd icons not loading. Makes me think what else it screws with.
-- require("impatient") -- Faster startup (this is a packer package) 

-- TODO: Warnings when something goes wrong when updating packages is in black text, very barely readable, find out how to change that highlight group

-- TODO: Understand the shortcuts of nvim-tree - how to add a new file, a new folder, how to search in a tree, how to collapse current tree, how to go up the file tree to the parent folder of the currently opened one, etc

require('stankovictab.settings') -- Vim Settings
require('stankovictab.plugins') -- All plugins
require('stankovictab.shortcuts') -- Custom shortcuts
require('stankovictab.themes') -- Theming
