-- TODO: Ctrl + v in every mode?

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
map('i', '<c-_>', "<esc>:Commentary<cr>a", bljak)

-- Ctrl + s please come back
map('n', '<c-s>', ':w<cr>', bljak)
map('i', '<c-s>', '<esc>:w<cr>', bljak)

-- Ctrl + f please come back
map('n', '<c-f>', '/', bljak)
map('i', '<c-f>', '<esc>/', bljak)
map('c', '<cr>', '<cr>:nohlsearch<cr>', {noremap = true, silent = true}) -- Clear highlights on search, only in command mode (in search mode) (this will occur on any command, but that's fine)
-- Same thing for n and N (go to next / previous match)
map('n', 'n', 'n:nohlsearch<cr>', {noremap = true, silent = true})
map('n', 'N', 'N:nohlsearch<cr>', {noremap = true, silent = true})

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>", bljak) -- Update plugins

map('n', '<PageUp>', '<c-u>', bljak) -- PageUp is Ctrl + u
map('n', '<PageDown>', '<c-d>', bljak) -- PageDown is Ctrl + d

map('n', '<c-z>', ':undo<cr>', bljak) -- Ctrl + z is undo
map('i', '<c-z>', '<esc>:undo<cr>', bljak) -- Ctrl + z is undo
map('n', '<c-y>', ':redo<cr>', bljak) -- Ctrl + y is redo
map('i', '<c-y>', '<esc>:redo<cr>', bljak) -- Ctrl + y is redo

-- This allows moving accross wrapped lines without skipping, like in vscode
-- silent just means don't abbreviate the shortcut in the command bar
-- If you want to use things like 3g or 5j, this fucks with that, so see this
-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
-- Also, v:count doesn't need to exist for insert mode
map('n', 'j', 'gj', {noremap = true, silent = true})
map('n', 'k', 'gk', {noremap = true, silent = true})
map('n', '<Down>', 'gj', {noremap = true, silent = true})
map('n', '<Up>', 'gk', {noremap = true, silent = true})
map('i', '<Down>', '<C-o>gj', {noremap = true, silent = true})
map('i', '<Up>', '<C-o>gk', {noremap = true, silent = true})
