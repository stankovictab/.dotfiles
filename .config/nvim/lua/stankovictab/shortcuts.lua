-- TODO: Ctrl + v in every mode?
-- TODO: Shortcut for vim.lsp.buf.format(), maybe even do it on Ctrl + s? or is that overkill?

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap -- Macro for aesthetic reasons
local bljak = { noremap = true } -- Macro for aesthetic reasons
local fuj = { noremap = true, silent = true } -- Same

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

map('n', '<c-b>', ':NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Normal
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Insert

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', bljak)
map('v', '<c-_>', ':Commentary<cr>', bljak)
map('i', '<c-_>', "<esc>:Commentary<cr>a", bljak)

-- Ctrl + s please come back
map('n', '<c-s>', ':w<cr>', fuj)
map('i', '<c-s>', '<esc>:w<cr>', fuj)

-- Ctrl + f please come back
map('n', '<c-f>', '/', fuj)
map('i', '<c-f>', '<esc>/', fuj)
-- Everyone has their own fix for clearing highlights on search, so here's mine - just press space
-- Mapping enter when completing the search to do this will mess up other commands, like it did with :hi
-- This in turn now works with /, n, N, *, # and :%s
map('n', ' ', ':nohlsearch<cr>', fuj)

-- Ctrl + r to search and replace instead of redo (why is it redo by default???)
map('n', '<c-r>', ':%s/', bljak)
map('i', '<c-r>', '<esc>:%s/', bljak)

-- Alt + ArrowKeys to move lines around
map('n', '<a-Up>', 'ddkP', fuj)
map('n', '<a-Down>', 'ddp', fuj)

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>", bljak) -- Update plugins

map('n', '<PageUp>', '<c-u>', bljak) -- PageUp is Ctrl + u
map('n', '<PageDown>', '<c-d>', bljak) -- PageDown is Ctrl + d

map('n', '<c-z>', ':undo<cr>', bljak) -- Ctrl + z is undo
map('i', '<c-z>', '<esc>:undo<cr>', bljak) -- Ctrl + z is undo
map('n', '<c-y>', ':redo<cr>', bljak) -- Ctrl + y is redo
map('i', '<c-y>', '<esc>:redo<cr>', bljak) -- Ctrl + y is redo

map('n', '<c-n>', ':e ', bljak) -- Ctrl + n to either open an existing, or start editing a new file

-- This allows moving accross wrapped lines without skipping, like in vscode
-- silent just means don't abbreviate the shortcut in the command bar
-- If you want to use things like 3g or 5j, this fucks with that, so see this
-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
-- Also, v:count doesn't need to exist for insert mode
map('n', 'j', 'gj', fuj)
map('n', 'k', 'gk', fuj)
map('n', '<Down>', 'gj', fuj)
map('n', '<Up>', 'gk', fuj)
map('i', '<Down>', '<C-o>gj', fuj)
map('i', '<Up>', '<C-o>gk', fuj)
