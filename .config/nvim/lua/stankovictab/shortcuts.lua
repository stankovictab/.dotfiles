vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap -- Macro for aesthetic reasons
local bljak = {noremap = true} -- Macro for aesthetic reasons

map('n', '<leader>,', ':e ~/.config/nvim/lua/stankovictab/<cr>', bljak) -- Opening this config file
map('n', '<leader>f', ':Telescope find_files<cr>', bljak) -- File browser
map('n', '<c-p>', ':Telescope find_files<cr>', bljak) -- File browser
map('n', '<leader>g', ':Telescope live_grep<cr>', bljak) -- Search inside of files
map('n', '<leader>b', ':Telescope buffers<cr>', bljak) -- Buffer browser

map('n', '<c-PageDown>', ':bnext<cr>', bljak) -- Go to next buffer
map('n', '<c-PageUp>', ':bprevious<cr>', bljak) -- Go to previous buffer
map('n', '<leader><right>', ':bnext<cr>', bljak) -- Go to next buffer (TTY)
map('n', '<leader><left>', ':bprevious<cr>', bljak) -- Go to previous buffer (TTY)

map('n', '<c-s-PageDown>', ':BufferLineMoveNext<cr>', bljak) -- Move buffer to the right
map('n', '<c-s-PageUp>', ':BufferLineMovePrev<cr>', bljak) -- Move buffer to the left

map('n', '<c-q>', ':bdelete<cr>', bljak) -- Close buffer

map('n', '<c-b>', ':NvimTreeToggle<cr>', bljak) -- Toggle file explorer in Normal
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', bljak) -- Toggle file explorer in Insert

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', bljak)
map('v', '<c-_>', ':Commentary<cr>', bljak)

map('n', '<c-s>', ':w<cr>', bljak) -- Ctrl + s please come back
map('i', '<c-s>', '<esc>:w<cr>', bljak) -- Ctrl + s please come back

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>", bljak) -- PackerSync

map('n', '<PageUp>', '<c-u>', bljak) -- PageUp je Ctrl + u
map('n', '<PageDown>', '<c-d>', bljak) -- PageDown je Ctrl + d
