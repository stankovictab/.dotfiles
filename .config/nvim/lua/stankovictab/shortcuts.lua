-- TODO: Enter and Backspace need a new use in Normal Mode
-- TODO: let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1 is a setting I had that did something regarding tmux, don't know what

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap
local fuj = { noremap = true, silent = true } -- Make all actions be silent, to not display in the command line

map('n', '<leader>,', ':lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/"})<cr>', fuj) -- Opening the config file directory, better than using :e, because that puts you into that working directory, this doesn't
map('n', '<leader>f', ':Telescope find_files<cr>', fuj) -- File browser
map('n', '<leader>g', ':Telescope live_grep<cr>', fuj) -- Search inside of files
map('n', '<leader>b', ':Telescope buffers<cr>', fuj) -- Buffer browser

-- ToggleTerm's shortcut is specific and it's set in its config

map('n', '<c-Left>', 'b', fuj) -- So that Ctrl + Left isn't dumb
map('n', '<c-Right>', 'e', fuj) -- So that Ctrl + Right isn't dumb

map('n', '<s-k>', ':bnext<cr>', fuj) -- Go to next buffer
map('n', '<s-j>', ':bprevious<cr>', fuj) -- Go to previous buffer
map('n', '<c-PageDown>', ':bnext<cr>', fuj) -- Go to next buffer
map('n', '<c-PageUp>', ':bprevious<cr>', fuj) -- Go to previous buffer
map('n', '<leader><right>', ':bnext<cr>', fuj) -- Go to next buffer (TTY)
map('n', '<leader><left>', ':bprevious<cr>', fuj) -- Go to previous buffer (TTY)

map('n', '<c-s-PageDown>', ':BufferLineMoveNext<cr>', fuj) -- Move buffer to the right
map('n', '<c-s-PageUp>', ':BufferLineMovePrev<cr>', fuj) -- Move buffer to the left

map('n', '<c-w>', ':bdelete<cr>', fuj) -- Close buffer
map('n', '<c-q>', ':wq<cr>', fuj) -- Quit

-- Better nvim navigation through windows
map('n', '<c-h>', ':wincmd h<cr>', fuj)
map('n', '<c-j>', ':wincmd j<cr>', fuj)
map('n', '<c-k>', ':wincmd k<cr>', fuj)
map('n', '<c-l>', ':wincmd l<cr>', fuj)
-- No reason for a "move windows around" shortcut, when you can just move between buffers with BufferLine easily

-- Splits
map('n', '<leader>sh', ':split<cr>', fuj) -- Split horizontally
map('n', '<leader>sv', ':vsplit<cr>', fuj) -- Split vertically

map('n', '<a-z>', ':ZenMode<cr>', fuj) -- Zen mode, like in vscode

map('n', '<c-b>', ':NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Normal
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Insert

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', fuj)
map('v', '<c-_>', ':Commentary<cr>', fuj)
map('i', '<c-_>', "<esc>:Commentary<cr>a", fuj)

-- Ctrl + s please come back
-- This is also a fast way to get out of modes
map('n', '<c-s>', ':w<cr>', fuj)
map('i', '<c-s>', '<esc>:w<cr>', fuj)
map('v', '<c-s>', '<esc>:w<cr>', fuj)
map('c', '<c-s>', '<esc>:w<cr>', fuj)

-- Everyone has their own fix for clearing highlights on search, so here's mine - just press space
-- Mapping enter when completing the search to do this will mess up other commands, like it did with :hi
-- This in turn now works with /, n, N, *, # and :%s
-- Also, this is good to reset the sizes of windows if they get screwed up
map('n', ' ', ':nohlsearch<cr><c-w>=', fuj)

-- Ctrl + r to search and replace instead of redo (why is it redo by default???)
map('n', '<c-r>', ':%s/', fuj)
map('i', '<c-r>', '<esc>:%s/', fuj)

-- Alt + movement keys to move lines around
map('n', '<a-Up>', 'ddkP', fuj)
map('n', '<a-Down>', 'ddp', fuj)
map('n', '<a-k>', 'ddkP', fuj)
map('n', '<a-j>', 'ddp', fuj)

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>", fuj) -- Update plugins

-- Better scrolling through the document
map('n', '<PageUp>', '<c-u>', fuj)
map('n', '<PageDown>', '<c-d>', fuj)
map('i', '<c-u>', '<esc><c-u>', fuj)
map('i', '<c-d>', '<esc><c-d>', fuj)

-- Home and End are too far away
map('n', '<s-h>', '<Home>', fuj)
map('n', '<s-l>', '<End>', fuj)

map('n', '<c-z>', ':undo<cr>', fuj) -- Ctrl + z is undo
map('i', '<c-z>', '<esc>:undo<cr>', fuj) -- Ctrl + z is undo
map('n', '<c-y>', ':redo<cr>', fuj) -- Ctrl + y is redo
map('i', '<c-y>', '<esc>:redo<cr>', fuj) -- Ctrl + y is redo

-- TODO: This has lag
map('n', '<c-t>', ':e ', fuj) -- Ctrl + n to either open an existing, or start editing a new file

-- This allows moving accross wrapped lines without skipping, like in vscode
-- silent just means don't abbreviate the shortcut in the command bar
-- If you want to use things like 3k or 5j, this fucks with that, so see this
-- https://stackoverflow.com/questions/20975928/moving-the-cursor-through-long-soft-wrapped-lines-in-vim
-- Also, v:count doesn't need to exist for insert mode
map('n', '<Down>', 'gj', fuj)
map('n', '<Up>', 'gk', fuj)
map('i', '<Down>', '<C-o>gj', fuj)
map('i', '<Up>', '<C-o>gk', fuj)
map('n', 'j', 'gj', fuj)
map('n', 'k', 'gk', fuj)

-- Duplicate line
map('n', '<a-d>', 'yyp', fuj)
map('i', '<a-d>', '<esc>yypi', fuj)

-- Ctrl + Backspace and Ctrl + Del in Insert Mode should not be stupid
-- TODO: This is tough to do as terminal emulators don't recognize backspace as <BS>, but instead something else
-- :(

map('i', '<c-BS>', '<esc>cb', fuj) -- Doesn't work
map('i', '<c-Del>', '<esc>lcw', fuj)
map('n', '<c-BS>', 'cb', fuj) -- Doesn't work
map('n', '<c-Del>', 'cw', fuj)

-- TODO: Doesn't work
-- map('n', '<S-Up>', '<s-v>k', fuj) -- Shift + Up = Visual line mode up
-- map('n', '<S-Down>', '<s-v>j', fuj) -- Shift + Down = Visual line mode down

-- LSP shortcuts
-- TODO: What are all these things?
map('n', '<leader>gd', ':lua vim.lsp.buf.definition()<cr>', fuj) -- Go to definition
map('n', '<leader>gD', ':lua vim.lsp.buf.declaration()<cr>', fuj) -- Go to declaration (what's the difference?)
map('n', '<c-;>', ':lua vim.lsp.buf.hover()<cr>', fuj) -- Hover functionality
map('n', '<leader>gi', ':lua vim.lsp.buf.implementation()<cr>', fuj) -- Go to implementation
map('n', '<leader>sg', ':lua vim.lsp.buf.signature_help()<cr>', fuj) -- See signature help, or, info for function parameters
map('n', '<leader>td', ':lua vim.lsp.buf.type_definition()<cr>', fuj) -- Go to type definition
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', fuj) -- Rename variable
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<cr>', fuj) -- See code actions
map('n', '<leader>gr', ':lua vim.lsp.buf.references()<cr>', fuj) -- Go to references
map('n', '<c-f>', ':lua vim.lsp.buf.format()<cr>', fuj) -- Formatting through the LSP, if the LSP client supports it
map('i', '<c-f>', '<esc>:lua vim.lsp.buf.format()<cr>', fuj)

-- For me to stop using the arrow keys
-- map('n', '<Up>', '', fuj)
-- map('i', '<Up>', '', fuj)
-- map('v', '<Up>', '', fuj)
-- map('n', '<Down>', '', fuj)
-- map('i', '<Down>', '', fuj)
-- map('v', '<Down>', '', fuj)
-- map('n', '<Left>', '', fuj)
-- map('i', '<Left>', '', fuj)
-- map('v', '<Left>', '', fuj)
-- map('n', '<Right>', '', fuj)
-- map('i', '<Right>', '', fuj)
-- map('v', '<Right>', '', fuj)

-- TODO: Commenting on an empty line doesn't work anymore?
-- TODO: Ctrl + a bind to select all, and bind incrementing (and decrementing, but idk what the original shortcut is) to something else

-- Select all
map('n', '<c-a>', '<esc>gg0vG$', fuj)
map('i', '<c-a>', '<esc>gg0vG$', fuj)
map('v', '<c-a>', '<esc>gg0vG$', fuj)
