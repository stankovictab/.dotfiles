-- TODO: Free keys are: ; (it's used to repeat f and t, so useless), ` (' already shows marks), @ (" already shows registers),
-- ~ (used to toggle case of selection (cASE to Case), I'm not using that shit and it's a good shortcut)
-- And many more with Tab (<leader>), Alt (Meta, <M>), Ctrl and Shift are available - see :map or :WhichKey for already used ones, see what you can come up with
-- Enter, Backspace, and those in combinations with Ctrl, Alt, Shift
-- I use Space only to clear search highlighting, but I guess I can do that with Esc?
-- What to do with Caps Lock?
-- You can't use Ctrl + Shift + key in Alacritty, just fyi
-- Tab + Tab + keys is also a possibility

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap
local fuj = { noremap = true, silent = true } -- Make all actions be silent, to not display in the command line

-- TODO: :source % is the old way, and that just reloads the config (sources) from the file (buffer) you're currently in, so it won't work in the wild.
-- In order to reload the whole config this way, you'd need to do :source ~/.config/nvim/init.lua, and then also the rest of the files, and that makes no sense.
-- :luafile also doesn't work. nvim-reload also doesn't seem to work.
-- This shortcut will basically reload the current config file you're in, so, if you're in lualine's config and you make a change, you can reload instantly
-- Note that if you're changing something regarding plugins, this simple reload won't always work, sometimes you need to do PackerCompile (Tab + p + s)
map('n', '<leader>r', ':source %<cr> :lua print("Config Reloaded! 🚀")<cr>', fuj) -- Reload config

-- Telescope is configured in a seperate file, because of that config find_files and live_grep search hidden files
map('n', '<leader>,', ':lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/"})<cr>', fuj) -- Opening the config file directory, better than using :e, because that puts you into that working directory, this doesn't
map('n', '<leader>f', ':Telescope find_files<cr>', fuj)                                                   -- File browser
map('n', '<leader>g', ':Telescope live_grep<cr>', fuj)                                                    -- Search inside of files
map('n', '<leader>b', ':Telescope buffers<cr>', fuj)                                                      -- Buffer browser

map('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>:TSUpdate<cr>", fuj)                             -- Update plugins
map('n', '<leader>c', ":Telescope colorscheme<cr>", fuj)                                                  -- Change colorscheme
map('n', '<leader>d', ":Telescope diagnostics<cr>", fuj)                                                  -- Change colorscheme

-- ToggleTerm's shortcut (Ctrl + n) is specific and it's set in its config (~/.config/nvim/lua/stankovictab/specifics/toggleterm.lua)

map('n', '<s-j>', ':bnext<cr>', fuj)                       -- Go to next buffer
map('n', '<s-k>', ':bprevious<cr>', fuj)                   -- Go to previous buffer
map('n', '<c-PageDown>', ':bnext<cr>', fuj)                -- Go to next buffer
map('n', '<c-PageUp>', ':bprevious<cr>', fuj)              -- Go to previous buffer

-- TODO: Change over to Cokeline
map('n', '<c-s-PageDown>', ':BufferLineMoveNext<cr>', fuj) -- Move buffer to the right
map('n', '<c-s-PageUp>', ':BufferLineMovePrev<cr>', fuj)   -- Move buffer to the left

map('n', '<c-w>', ':bdelete<cr>', fuj)                     -- Close buffer
map('n', '<c-q>', ':wq<cr>', fuj)                          -- Save and quit window

-- Better window navigation
map('n', '<c-h>', ':wincmd h<cr>', fuj)
map('n', '<c-j>', ':wincmd j<cr>', fuj)
map('n', '<c-k>', ':wincmd k<cr>', fuj)
map('n', '<c-l>', ':wincmd l<cr>', fuj)
-- No reason for a "move windows around" shortcut, when you can just move between buffers easily
-- Ctrl + Shift + Key doesn't work in Alacritty out of the box, so arrow keys are fine for resizing
map('n', '<c-left>', ':vertical resize -2<cr>', fuj)
map('n', '<c-up>', ':resize +2<cr>', fuj)
map('n', '<c-down>', ':resize -2<cr>', fuj)
map('n', '<c-right>', ':vertical resize +2<cr>', fuj)

-- Splits
map('n', '<leader>sh', ':split<cr>', fuj)          -- Split horizontally
map('n', '<leader>sv', ':vsplit<cr>', fuj)         -- Split vertically

map('n', '<leader>z', ':ZenMode<cr>', fuj)         -- Zen mode, like in vscode

map('n', '<c-b>', ':NvimTreeToggle<cr>', fuj)      -- Toggle file explorer in Normal
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', fuj) -- Toggle file explorer in Insert

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', fuj)
map('v', '<c-_>', ':Commentary<cr>', fuj)
map('i', '<c-_>', "<esc>:Commentary<cr>a", fuj)

-- Easier indenting, just keep pressing < or >
map('v', '<', '<gv', fuj)
map('v', '>', '>gv', fuj)

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
map('n', '<c-r>', ':lua print("Search and Replace! - Start typing A, then /, then B.")<cr>:%s/', fuj)
map('i', '<c-r>', '<esc>:%s/', fuj)

-- Alt + movement keys to move lines around
map('n', '<a-Up>', 'ddkP', fuj)
map('n', '<a-Down>', 'ddp', fuj)
map('n', '<a-k>', 'ddkP', fuj)
map('n', '<a-j>', 'ddp', fuj)
map('v', '<a-k>', 'xkP`[V`]', fuj) -- Same, but for selecting multiple lines in visual mode
map('v', '<a-j>', 'xp`[V`]', fuj)

map('n', '<leader>m', ":MarkdownPreview<cr>", fuj) -- Markdown Preview

-- Better scrolling through the document
map('n', '<PageUp>', '<c-u>', fuj)
map('n', '<PageDown>', '<c-d>', fuj)
map('i', '<c-u>', '<esc><c-u>', fuj)
map('i', '<c-d>', '<esc><c-d>', fuj)

-- Home and End are too far away
map('n', '<s-h>', '<Home>', fuj)
map('n', '<s-l>', '<End>', fuj)

-- u is undo, U is redo
map('n', '<s-u>', ':redo<cr>', fuj)

-- This allows moving accross wrapped lines without skipping, like in VSCode
map('n', '<Down>', 'gj', fuj)
map('n', '<Up>', 'gk', fuj)
map('i', '<Down>', '<C-o>gj', fuj)
map('i', '<Up>', '<C-o>gk', fuj)
map('n', 'j', 'gj', fuj)
map('n', 'k', 'gk', fuj)

-- Duplicate line
map('n', '<a-d>', 'yyp', fuj)
map('i', '<a-d>', '<esc>yypi', fuj)

-- Ctrl + Backspace in Insert Mode should not be stupid
-- Ctrl + Backspace is interpreted as Ctrl + h in terminal emulators, so this is basically the same thing
-- You can see this by doing Ctrl + v (which enables you to see control character inputs), then Ctrl + Backspace
-- Same thing is with Ctrl + i, which is interpreted as Tab
-- https://www.reddit.com/r/neovim/comments/okbag3/comment/h58k9p7/
map('i', '<c-h>', '<c-w>', fuj)
-- Ctrl + Delete in Insert Mode should not be stupid
map('i', '<c-Del>', '<esc>lcw', fuj)
map('n', '<c-Del>', 'cw', fuj)
-- W isn't used, and b is too far away, and since Ctrl + Arrows aren't used, this is good for horizontal movement
map('n', 'w', 'e', fuj)
map('n', 'W', 'b', fuj)

-- LSP Shortcuts
map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<cr>', fuj)      -- Go to definition
map('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<cr>', fuj)     -- Go to declaration
map('n', '<leader>lh', ':lua vim.lsp.buf.hover()<cr>', fuj)           -- Hover functionality
map('n', '<leader>li', ':lua vim.lsp.buf.implementation()<cr>', fuj)  -- Go to implementation
map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<cr>', fuj)  -- See signature help, or, info for function parameters
map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<cr>', fuj) -- Go to type definition
map('n', '<leader>ln', ':lua vim.lsp.buf.rename()<cr>', fuj)          -- Rename variable accross the whole project that the LSP loads, but only where it makes sense to do so
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<cr>', fuj)     -- See code actions for hovered error, like adding imports, etc
map('n', '<leader>lr', ':lua vim.lsp.buf.references()<cr>', fuj)      -- Go to references
map('n', '<leader>lN', ':lua vim.diagnostic.goto_next()<cr>', fuj)    -- Go to next diagnostic
map('n', '<leader>lP', ':lua vim.diagnostic.goto_prev()<cr>', fuj)    -- Go to previous diagnostic
-- Formatting through the LSP, if the LSP client supports it
map('n', '<c-f>', ':lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>', fuj)
map('i', '<c-f>', '<esc>:lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>', fuj)

-- For me to stop using the arrow keys
-- The biggest problem here is moving around in insert mode
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

-- Incrementing and decrementing (as Ctrl + a no longer increments), + and - moved across lines before
map('n', '+', '<esc><c-a>', fuj)
map('n', '-', '<esc><c-x>', fuj)

-- Select all (Ctrl + a is used by tmux)
map('n', '<leader>a', '<esc>gg0vG$', fuj)
map('v', '<leader>a', '<esc>gg0vG$', fuj)

-- Rebinding ; as it's used only to repeat the last f, t, F or T commands, which I don't use
map('n', ';t', ':Telescope<cr>', fuj)                                                       -- Telescope main menu
map('n', ';e', ':lua require"telescope.builtin".symbols{ sources = {"emoji"} }<cr>', fuj)   -- System emojis
map('n', ';g', ':lua require"telescope.builtin".symbols{ sources = {"gitmoji"} }<cr>', fuj) -- Emoji for git commits
map('n', ';j', ':lua require"telescope.builtin".symbols{ sources = {"julia"} }<cr>', fuj)   -- Like LaTeX, but for Julia
map('n', ';k', ':lua require"telescope.builtin".symbols{ sources = {"kaomoji"} }<cr>', fuj) -- (╯°□°）╯︵ ┻━┻ alooo
map('n', ';l', ':lua require"telescope.builtin".symbols{ sources = {"latex"} }<cr>', fuj)   -- Won't work without LaTeX installed on your system
map('n', ';m', ':lua require"telescope.builtin".symbols{ sources = {"math"} }<cr>', fuj)    -- 2500 math symbols, not requiring LaTeX
map('n', ';n', ':lua require"telescope.builtin".symbols{ sources = {"nerd"} }<cr>', fuj)    -- Nerd Font symbol search

-- gx doesn't work without netrw, which I don't use, so I'm reimplementing it
-- It works for files, images, and URLs, something I didn't find online
-- I made this and I'm very proud of it
-- NOTE: I have a feeling this won't work with file paths with spaces in them... :(
function FuckOuttaHere()
	local pathOrUrl = vim.fn.expand('<cfile>')
	if pathOrUrl ~= nil then
		vim.cmd(('!xdg-open %s'):format(pathOrUrl))
	else
		print('No path, or https or http URI found in line.')
	end
end

map('n', 'gx', ':lua FuckOuttaHere()<cr>', fuj)
