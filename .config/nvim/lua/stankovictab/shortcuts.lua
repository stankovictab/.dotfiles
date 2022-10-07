-- TODO: Enter and Backspace need a new use in Normal Mode
-- TODO: let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0 is a setting I had that did something regarding tmux, don't know what

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap
local fuj = { noremap = true, silent = true } -- Make all actions be silent, to not display in the command line

map('n', '<leader>,', ':lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/"})<cr>', fuj) -- Opening the config file directory, better than using :e, because that puts you into that working directory, this doesn't
map('n', '<leader>f', ':Telescope find_files<cr>', fuj) -- File browser
map('n', '<c-p>', ':Telescope find_files<cr>', fuj) -- File browser
map('n', '<leader>g', ':Telescope live_grep<cr>', fuj) -- Search inside of files
map('n', '<leader>b', ':Telescope buffers<cr>', fuj) -- Buffer browser

map('n', '<c-PageDown>', ':bnext<cr>', fuj) -- Go to next buffer
map('n', '<c-PageUp>', ':bprevious<cr>', fuj) -- Go to previous buffer
map('n', '<leader><right>', ':bnext<cr>', fuj) -- Go to next buffer (TTY)
map('n', '<leader><left>', ':bprevious<cr>', fuj) -- Go to previous buffer (TTY)

map('n', '<c-s-PageDown>', ':BufferLineMoveNext<cr>', fuj) -- Move buffer to the right
map('n', '<c-s-PageUp>', ':BufferLineMovePrev<cr>', fuj) -- Move buffer to the left

map('n', '<c-q>', ':bdelete<cr>', fuj) -- Close buffer

map('n', '<c-b>', ':NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Normal
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Insert

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', fuj)
map('v', '<c-_>', ':Commentary<cr>', fuj)
map('i', '<c-_>', "<esc>:Commentary<cr>a", fuj)

-- Ctrl + s please come back
-- This is also a fast way to get out of insert mode
map('n', '<c-s>', ':w<cr>', fuj)
map('i', '<c-s>', '<esc>:w<cr>', fuj)
-- Formatting through the LSP, if the LSP client supports it
map('n', '<c-u>', ':lua vim.lsp.buf.format()<cr>', fuj)
map('i', '<c-u>', '<esc>:lua vim.lsp.buf.format()<cr>', fuj)

-- Ctrl + f please come back
map('n', '<c-f>', '/', fuj)
map('i', '<c-f>', '<esc>/', fuj)
-- Everyone has their own fix for clearing highlights on search, so here's mine - just press space
-- Mapping enter when completing the search to do this will mess up other commands, like it did with :hi
-- This in turn now works with /, n, N, *, # and :%s
map('n', ' ', ':nohlsearch<cr>', fuj)

-- Ctrl + r to search and replace instead of redo (why is it redo by default???)
map('n', '<c-r>', ':%s/', fuj)
map('i', '<c-r>', '<esc>:%s/', fuj)

-- Alt + ArrowKeys to move lines around
map('n', '<a-Up>', 'ddkP', fuj)
map('n', '<a-Down>', 'ddp', fuj)

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>", fuj) -- Update plugins

map('n', '<PageUp>', '<c-u>', fuj) -- Best way to scroll up
map('n', '<PageDown>', '<c-d>', fuj) -- Best way to scroll down

map('n', '<c-z>', ':undo<cr>', fuj) -- Ctrl + z is undo
map('i', '<c-z>', '<esc>:undo<cr>', fuj) -- Ctrl + z is undo
map('n', '<c-y>', ':redo<cr>', fuj) -- Ctrl + y is redo
map('i', '<c-y>', '<esc>:redo<cr>', fuj) -- Ctrl + y is redo

map('n', '<c-n>', ':e ', fuj) -- Ctrl + n to either open an existing, or start editing a new file

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

-- These need to be below the PageUp/PageDown bindings
map('n', '<c-d>', 'yyp', fuj)
map('i', '<c-d>', '<esc>yypi', fuj)

-- Ctrl + Backspace and Ctrl + Del in Insert Mode should not be stupid
-- TODO: This is tough to do as terminal emulators don't recognize backspace as <BS>, but instead something else
-- :(
map('i', '<c-BS>', '<esc>cb', fuj) -- Doesn't work
map('i', '<c-Del>', '<esc>lcw', fuj)
map('n', '<c-BS>', 'cb', fuj) -- Doesn't work
map('n', '<c-Del>', 'cw', fuj)

-- TODO: Doesn't work?
map('n', '<S-Up>', '<s-v>k', fuj) -- Shift + Up = Visual line mode up
map('n', '<S-Down>', '<s-v>j', fuj) -- Shift + Down = Visual line mode down
