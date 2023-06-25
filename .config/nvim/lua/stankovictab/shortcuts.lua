-- TODO: Free keys are: ; (it's used to repeat f and t, so useless), ` (' already shows marks), @ (" already shows registers), , itself (used to repeat f and t in the other way)
-- TODO: And, ; messes up with my WhichKey for ; which I need more than ; to repeat f and t, so it'll be good to change out ; and , (and flash.nvim already allows for spamming of f and t, no worry there)
-- ~ (used to toggle case of selection (cASE to Case), I'm not using that shit and it's a good shortcut), Ctrl + y
-- And many more with Tab (<leader>), Alt (Meta, <M>), Ctrl and Shift are available - see :map or :WhichKey for already used ones, see what you can come up with
-- Enter, Backspace, and those in combinations with Ctrl, Alt, Shift
-- I use Space only to clear search highlighting, but I guess I can do that with Esc?
-- What to do with Caps Lock?
-- You can't use Ctrl + Shift + key in Alacritty, just fyi (but it works for moving buffers around? weird.)
-- Tab + Tab + keys is also a possibility
-- e, E, b, B, t & T are all available to rebind, as I don't use them, I just use w and f

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap

-- TODO: :source % is the old way, and that just reloads the config (sources) from the file (buffer) you're currently in, so it won't work in the wild.
-- In order to reload the whole config this way, you'd need to do :source ~/.config/nvim/init.lua, and then also the rest of the files, and that makes no sense.
-- :luafile also doesn't work. nvim-reload also doesn't seem to work.
-- This shortcut will basically reload the current config file you're in, so, if you're in lualine's config and you make a change, you can reload instantly
-- Note that if you're changing something regarding plugins, this simple reload won't always work, sometimes you need to do PackerCompile (Tab + p + s)
map('n', '<leader>r', ':source %<cr> :lua print("Config Reloaded! 🚀")<cr>',
	{ desc = "Reload Config", noremap = true, silent = true })

-- Telescope is configured in a seperate file, because of that config find_files and live_grep search hidden files
map('n', '<leader>,', ':lua require("telescope.builtin").find_files({cwd = "~/.config/nvim/"})<cr>',
	{ desc = "Find Config Files", noremap = true, silent = true }) -- Opening the config file directory, better than using :e, because this doesn't put you into that working directory
map('n', '<leader>f', ':Telescope find_files<cr>', { desc = "File Browser", noremap = true, silent = true })
map('n', '<leader>g', ':Telescope live_grep<cr>',
	{ desc = "Live Grep (Search Inside Files)", noremap = true, silent = true })
map('n', '<leader>b', ':Telescope buffers<cr>', { desc = "Buffer Browser", noremap = true, silent = true })

map('n', '<leader>ps', ":Lazy sync<cr>:TSUpdate<cr>",
	{ desc = "Compile & Update Plugins", noremap = true, silent = true })
map('n', '<leader>c', ":Telescope colorscheme<cr>", { desc = "Change Colorscheme", noremap = true, silent = true })
map('n', '<leader>d', ":Telescope diagnostics<cr>", { desc = "See Diagnostics", noremap = true, silent = true })
map('n', '<leader>lg', ":LazyGit<cr>", { desc = "LazyGit", noremap = true, silent = true })

-- Splits
map('n', '<leader>sh', ':split<cr>', { desc = "Split Horizontally", noremap = true, silent = true })
map('n', '<leader>sv', ':vsplit<cr>', { desc = "Split Vertically", noremap = true, silent = true })

map('n', '<leader>z', ':ZenMode<cr>', { desc = "Zen Mode", noremap = true, silent = true })

-- ToggleTerm's shortcut (Ctrl + n) is specific and it's set in its config (~/.config/nvim/lua/stankovictab/specifics/toggleterm.lua)

map('n', '<s-j>', ':bprevious<cr>', { desc = "Go to Next Buffer", noremap = true, silent = true })
map('n', '<s-k>', ':bnext<cr>', { desc = "Go to Previous Buffer", noremap = true, silent = true })
map('n', '<c-PageDown>', ':bprevious<cr>', { desc = "Go to Next Buffer", noremap = true, silent = true })
map('n', '<c-PageUp>', ':bnext<cr>', { desc = "Go to Previous Buffer", noremap = true, silent = true })

map('n', '<c-s-PageDown>', '<Plug>(cokeline-switch-next)', { desc = "Move Buffer Right", noremap = true, silent = true })
map('n', '<c-s-PageUp>', '<Plug>(cokeline-switch-prev)', { desc = "Move Buffer Left", noremap = true, silent = true })

map('n', '<c-w>', ':bdelete<cr>', { desc = "Close Buffer", noremap = true, silent = true })
map('n', '<c-q>', ':wq<cr>', { desc = "Save & Quit Window", noremap = true, silent = true })

-- Better window navigation
map('n', '<c-h>', ':wincmd h<cr>', { desc = "Go to Window Left", noremap = true, silent = true })
map('n', '<c-j>', ':wincmd j<cr>', { desc = "Go to Window Down", noremap = true, silent = true })
map('n', '<c-k>', ':wincmd k<cr>', { desc = "Go to Window Up", noremap = true, silent = true })
map('n', '<c-l>', ':wincmd l<cr>', { desc = "Go to Window Right", noremap = true, silent = true })
-- No reason for a "move windows around" shortcut, when you can just move between buffers easily
-- Ctrl + Shift + Key doesn't work in Alacritty out of the box, so arrow keys are fine for resizing
map('n', '<c-left>', ':vertical resize -2<cr>', { desc = "Resize to Left", noremap = true, silent = true })
map('n', '<c-up>', ':resize +2<cr>', { desc = "Resize Up", noremap = true, silent = true })
map('n', '<c-down>', ':resize -2<cr>', { desc = "Resize Down", noremap = true, silent = true })
map('n', '<c-right>', ':vertical resize +2<cr>', { desc = "Resize to Right", noremap = true, silent = true })

map('n', '<c-b>', ':NvimTreeToggle<cr>', { desc = "File Explorer", noremap = true, silent = true })
map('i', '<c-b>', '<esc>:NvimTreeToggle<cr>', { desc = "File Explorer", noremap = true, silent = true })

-- Toggle comments with vim-commentary (c-_ is Ctrl + /)
map('n', '<c-_>', ':Commentary<cr>', { desc = "Toggle Comment", noremap = true, silent = true })
map('v', '<c-_>', ':Commentary<cr>', { desc = "Toggle Comment", noremap = true, silent = true })
map('i', '<c-_>', "<esc>:Commentary<cr>a", { desc = "Toggle Comment", noremap = true, silent = true })

-- Easier indenting, just keep pressing < or >
map('v', '<', '<gv', { desc = "Indent Left", noremap = true, silent = true })
map('v', '>', '>gv', { desc = "Indent Right", noremap = true, silent = true })

-- Ctrl + s please come back
-- This is also a fast way to get out of modes
map('n', '<c-s>', ':w<cr>', { desc = "Save", noremap = true, silent = true })
map('i', '<c-s>', '<esc>:w<cr>', { desc = "Save", noremap = true, silent = true })
map('v', '<c-s>', '<esc>:w<cr>', { desc = "Save", noremap = true, silent = true })
map('c', '<c-s>', '<esc>:w<cr>', { desc = "Save", noremap = true, silent = true })

-- Everyone has their own fix for clearing highlights on search, so here's mine - just press space
-- Mapping enter when completing the search to do this will mess up other commands, like it did with :hi
-- This in turn now works with /, n, N, *, # and :%s
-- Also, this is good to reset the sizes of windows if they get screwed up
-- NOTE And also, I use this to fix cokeline's issue for not updating it's colors when you change colorschemes,
-- it's a known issue, see https://github.com/willothy/nvim-cokeline/issues/72
-- So, if a fix is out, you can remove this
map('n', ' ',
	':nohlsearch<cr>:source ~/.config/nvim/lua/stankovictab/specifics/cokeline.lua<cr><c-w>=:lua print("Cleared Screen")<cr>',
	{ desc = "Clear Screen (Search Highlights, Reset Window Size, Cokeline Color Reset)", noremap = true, silent = true })

-- Ctrl + r to search and replace instead of redo (why is it redo by default???)
map('x', '<c-r>', ':lua print("Search & Replace! - Start typing A, then /, then B.")<cr>:%s/',
	{ desc = "Search & Replace", noremap = true, silent = true })

-- Alt + movement keys to move lines around - this is a lot better than ddp and ddkP, doesn't mess up the clipboard, and doesn't have the issue of moving the first line up and it disappearing
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Alt + h/l to move characters left and right (NOTE - Might be buggy)
map("n", "<A-h>", "xhP", { desc = "Move character left" })
map("n", "<A-l>", "xp", { desc = "Move character right" })

map('n', '<leader>m', ":MarkdownPreview<cr>", { desc = "Markdown Preview" }) -- Markdown Preview

-- Better scrolling through the document
map('n', '<PageUp>', '<c-u>', { desc = "Scroll Up", noremap = true, silent = true })
map('n', '<PageDown>', '<c-d>', { desc = "Scroll Down", noremap = true, silent = true })
map('i', '<c-u>', '<esc><c-u>', { desc = "Scroll Up", noremap = true, silent = true })
map('i', '<c-d>', '<esc><c-d>', { desc = "Scroll Down", noremap = true, silent = true })

-- Home and End are too far away
map('n', '<s-h>', '<Home>', { desc = "Go to Start of Line", noremap = true, silent = true })
map('n', '<s-l>', '<End>', { desc = "Go to End of Line", noremap = true, silent = true })
map('v', '<s-h>', '<Home>', { desc = "Go to Start of Line", noremap = true, silent = true })
map('v', '<s-l>', '<End>', { desc = "Go to End of Line", noremap = true, silent = true })

-- u is undo, U is redo
map('n', '<s-u>', ':redo<cr>', { desc = "Redo", noremap = true, silent = true })

-- This allows moving accross wrapped lines without skipping, like in VSCode
map('n', '<Down>', 'gj', { desc = "Down", noremap = true, silent = true })
map('n', '<Up>', 'gk', { desc = "Up", noremap = true, silent = true })
map('i', '<Down>', '<C-o>gj', { desc = "Down", noremap = true, silent = true })
map('i', '<Up>', '<C-o>gk', { desc = "Up", noremap = true, silent = true })
map('n', 'j', 'gj', { desc = "Down", noremap = true, silent = true })
map('n', 'k', 'gk', { desc = "Up", noremap = true, silent = true })

map('n', '<a-d>', 'yyp', { desc = "Duplicate Line", noremap = true, silent = true })
map('i', '<a-d>', '<esc>yypi', { desc = "Duplicate Line", noremap = true, silent = true })

-- Ctrl + Backspace in Insert Mode should not be stupid
-- Ctrl + Backspace is interpreted as Ctrl + h in terminal emulators, so this is basically the same thing
-- You can see this by doing Ctrl + v (which enables you to see control character inputs), then Ctrl + Backspace
-- Same thing is with Ctrl + i, which is interpreted as Tab
-- https://www.reddit.com/r/neovim/comments/okbag3/comment/h58k9p7/
map('i', '<c-h>', '<c-w>', { desc = "Delete Rest of Word to Left", noremap = true, silent = true })
-- Ctrl + Delete in Insert Mode should not be stupid
map('i', '<c-Del>', '<esc>lcw', { desc = "Delete Rest of Word to Right", noremap = true, silent = true })
map('n', '<c-Del>', 'cw', { desc = "Delete Rest of Word to Right", noremap = true, silent = true })
-- W isn't used, and b is too far away, and since Ctrl + Arrows aren't used, this is good for horizontal movement
map('n', 'w', 'e', { desc = "Next Word", noremap = true, silent = true })
map('n', 'W', 'b', { desc = "Previous Word", noremap = true, silent = true })

-- LSP Shortcuts
map('n', '<leader>ld', ':lua vim.lsp.buf.definition()<cr>', { desc = "Go to Definition", noremap = true, silent = true })
map('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<cr>',
	{ desc = "Go to Declaration", noremap = true, silent = true })
map('n', '<leader>lh', ':lua vim.lsp.buf.hover()<cr>', { desc = "Show Hover", noremap = true, silent = true })
map('n', '<leader>li', ':lua vim.lsp.buf.implementation()<cr>',
	{ desc = "Go to Implementation", noremap = true, silent = true })
map('n', '<leader>ls', ':lua vim.lsp.buf.signature_help()<cr>',
	{ desc = "See Signature Help", noremap = true, silent = true }) -- See signature help, or, info for function parameters
map('n', '<leader>lt', ':lua vim.lsp.buf.type_definition()<cr>',
	{ desc = "Go to Type Definition", noremap = true, silent = true })
map('n', '<leader>ln', ':lua vim.lsp.buf.rename()<cr>',
	{ desc = "(Smartly) Rename Variable", noremap = true, silent = true })                                                 -- Rename variable accross the whole project that the LSP loads, but only where it makes sense to do so
map('n', '<leader>la', ':lua vim.lsp.buf.code_action()<cr>', { desc = "See Code Actions", noremap = true, silent = true }) -- See code actions for hovered error, like adding imports, etc
map('n', '<leader>lr', ':lua vim.lsp.buf.references()<cr>', { desc = "Go to References", noremap = true, silent = true })
map('n', '<leader>lN', ':lua vim.diagnostic.goto_next()<cr>',
	{ desc = "Go to Next Diagnostic", noremap = true, silent = true })
map('n', '<leader>lP', ':lua vim.diagnostic.goto_prev()<cr>',
	{ desc = "Go to Previous Diagnostic", noremap = true, silent = true })
-- Formatting through the LSP, if the LSP client supports it
map('n', '<c-f>', ':lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>',
	{ desc = "Format File", noremap = true, silent = true })
map('i', '<c-f>', '<esc>:lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>',
	{ desc = "Format File", noremap = true, silent = true })

-- For me to stop using the arrow keys
-- The biggest problem here is moving around in insert mode
-- map('n', '<Up>', '', { desc = "", noremap = true, silent = true})
-- map('i', '<Up>', '', { desc = "", noremap = true, silent = true})
-- map('v', '<Up>', '', { desc = "", noremap = true, silent = true})
-- map('n', '<Down>', '', { desc = "", noremap = true, silent = true})
-- map('i', '<Down>', '', { desc = "", noremap = true, silent = true})
-- map('v', '<Down>', '', { desc = "", noremap = true, silent = true})
-- map('n', '<Left>', '', { desc = "", noremap = true, silent = true})
-- map('i', '<Left>', '', { desc = "", noremap = true, silent = true})
-- map('v', '<Left>', '', { desc = "", noremap = true, silent = true})
-- map('n', '<Right>', '', { desc = "", noremap = true, silent = true})
-- map('i', '<Right>', '', { desc = "", noremap = true, silent = true})
-- map('v', '<Right>', '', { desc = "", noremap = true, silent = true})

-- Incrementing and decrementing (as Ctrl + a no longer increments), + and - moved across lines before
map('n', '+', '<esc><c-a>', { desc = "Increment", noremap = true, silent = true })
map('n', '-', '<esc><c-x>', { desc = "Decrement", noremap = true, silent = true })

-- Select all (Ctrl + a is used by tmux)
map('n', '<leader>a', '<esc>gg0vG$', { desc = 'Select All', noremap = true, silent = true })
map('v', '<leader>a', '<esc>gg0vG$', { desc = 'Select All', noremap = true, silent = true })

-- Rebinding ; as it's used only to repeat the last f, t, F or T commands, which I don't use
map('n', ';t', ':Telescope<cr>', { desc = 'Telescope Main Menu', noremap = true, silent = true })
map('n', ';e', ':lua require"telescope.builtin".symbols{ sources = {"emoji"} }<cr>',
	{ desc = 'System Emojis', noremap = true, silent = true })
map('n', ';g', ':lua require"telescope.builtin".symbols{ sources = {"gitmoji"} }<cr>',
	{ desc = 'Gitmoji', noremap = true, silent = true })
map('n', ';j', ':lua require"telescope.builtin".symbols{ sources = {"julia"} }<cr>',
	{ desc = 'Julia Symbols', noremap = true, silent = true })
map('n', ';k', ':lua require"telescope.builtin".symbols{ sources = {"kaomoji"} }<cr>',
	{ desc = 'Kaomoji  (╯°□°）╯︵ ┻━┻ ', noremap = true, silent = true })
map('n', ';l', ':lua require"telescope.builtin".symbols{ sources = {"latex"} }<cr>',
	{ desc = 'LaTeX', noremap = true, silent = true })     -- Won't work without LaTeX installed on your system
map('n', ';m', ':lua require"telescope.builtin".symbols{ sources = {"math"} }<cr>',
	{ desc = 'Math Symbols', noremap = true, silent = true }) -- 2500 math symbols, not requiring LaTeX
map('n', ';n', ':lua require"telescope.builtin".symbols{ sources = {"nerd"} }<cr>',
	{ desc = 'Nerd Font Symbols', noremap = true, silent = true })
map('n', ';h', ':Telescope highlights<cr>', { desc = 'Telescope Highlight Search', noremap = true, silent = true })

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
map('n', 'gx', ':lua FuckOuttaHere()<cr>', { desc = "Open File or URL with System App", noremap = true, silent = true })

map('n', '<leader>tt', ':TSToggle highlight<cr>:lua print("TreeShitter Toggled!")<cr>', { desc = "TreeShitter Toggle" })

-- This requires , to be unbound from flash's config, and to use <cmd> instead of : for some reason
map('n', ',', '<cmd>lua require("flash").jump()<cr>', { desc = "Flash Jump" })
