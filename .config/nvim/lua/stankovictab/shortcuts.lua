-- NOTE: Here are the free keys you can use :
-- ` (' already shows marks) - you should map ' to be ` as ` is more useful as it jumps to exact position, rather than line
-- ~ (used to toggle case of selection (cASE to Case), I'm not using that shit and it's a good shortcut),
-- F, ,, e, E, b, B, t & T are all available to rebind, as I don't use them, I just use w, W and f
-- # is free as it's the same as *N
-- What to do with Caps Lock?
-- Tab + Tab + keys is also a possibility
-- Enter, Backspace, and those in combinations with Ctrl, Alt, Shift
-- And many more with Tab (<leader>), Alt (Meta, <M>), Ctrl and Shift are available - see :map or :WhichKey for already used ones

vim.g.mapleader = '	' -- Setting the leader key to Tab instead of the default \

local map = vim.api.nvim_set_keymap
local map2 = vim.keymap.set -- TODO: What is this? A newer better map set? Seems so, fixed some of my issues.

-- NOTE: q and @ are used for macros, if you feel like you need them, disable this
map('n', 'q', '<esc>:lua print("I like ESC better!")<cr>', { desc = "Disable q" })
map('n', '@', '<esc>:lua print("I like ESC better!")<cr>', { desc = "Disable q" })

-- TODO: :source % is the old way, and that just reloads the config (sources) from the file (buffer) you're currently in, so it won't work in the wild.
-- In order to reload the whole config this way, you'd need to do :source ~/.config/nvim/init.lua, and then also the rest of the files, and that makes no sense.
-- :luafile also doesn't work. nvim-reload also doesn't seem to work.
-- This shortcut will basically reload the current config file you're in, so, if you're in lualine's config and you make a change, you can reload instantly
-- Note that if you're changing something regarding plugins, this simple reload won't always work, sometimes you need to sync with Lazy
map('n', '<leader>rc', ':source %<cr> :lua print("Config Reloaded! 🚀")<cr>',
    { desc = "Reload Config", noremap = true, silent = true })
map('n', '<leader>rf', ':e<cr>', { desc = "Reload File", noremap = true, silent = true })

-- Telescope is configured in a seperate file, and in there find_files and live_grep are configured to search hidden files
-- Opening the config file directory, making sure it's in .dotfiles for lualine to print the branch
map('n', '<leader>,', ':lua require("telescope.builtin").find_files({cwd = "~/.dotfiles/.config/nvim/"})<cr>',
    { desc = "Find Config Files", noremap = true, silent = true })
map('n', '<leader>f', ':Telescope find_files<cr>', { desc = "File Browser", noremap = true, silent = true })
map('n', '<leader>gr', ':Telescope live_grep<cr>',
    { desc = "Live Grep (Search Inside Files)", noremap = true, silent = true })
map('n', '<leader>b', ':Telescope buffers<cr>', { desc = "Buffer Browser", noremap = true, silent = true })

map('n', '<leader>ps', ":Lazy sync<cr>:TSUpdate<cr>",
    { desc = "Compile & Update Plugins", noremap = true, silent = true })
map('n', '<leader>pz', ":Lazy<cr>", { desc = "Lazy Package Manager", noremap = true, silent = true })
map('n', '<leader>c', ":Telescope colorscheme<cr>", { desc = "Change Colorscheme", noremap = true, silent = true })
map('n', '<leader>n', ":enew<cr>:lua print('Current working directory:', vim.fn.getcwd())<cr>",
    { desc = "New File", noremap = true, silent = true })
map('n', '<leader>gg', ":LazyGit<cr>", { desc = "LazyGit", noremap = true, silent = true })
map('n', '<leader>lg', ":LazyGit<cr>", { desc = "LazyGit", noremap = true, silent = true })
map('n', '<leader>gs', ":Telescope git_status<cr>", { desc = "Telescope Git Status", noremap = true, silent = true })
map('n', '<leader>gb', ":Gitsigns toggle_current_line_blame<cr>:lua print('Git Blame Toggled!')<cr>",
    { desc = "Toggle Line Blame", noremap = true, silent = true })
map('n', '<leader>gl', ":Gitsigns toggle_linehl<cr>", { desc = "Toggle Line Highlight", noremap = true, silent = true })
map('n', '<leader>gn', ":Gitsigns toggle_numhl<cr>", { desc = "Toggle Number Highlight", noremap = true, silent = true })

-- Splits
map('n', '<leader>sh', ':split<cr>', { desc = "Split Horizontally", noremap = true, silent = true })
map('n', '<leader>sv', ':vsplit<cr>', { desc = "Split Vertically", noremap = true, silent = true })

map('n', '<leader>z', ':ZenMode<cr>', { desc = "Zen Mode", noremap = true, silent = true })

map('n', '<s-j>', ':bprevious<cr>', { desc = "Go to Next Buffer", noremap = true, silent = true })
map('n', '<s-k>', ':bnext<cr>', { desc = "Go to Previous Buffer", noremap = true, silent = true })
map('n', '<c-PageDown>', ':bprevious<cr>', { desc = "Go to Next Buffer", noremap = true, silent = true })
map('n', '<c-PageUp>', ':bnext<cr>', { desc = "Go to Previous Buffer", noremap = true, silent = true })

-- Moving buffers in bufferline
map('n', '<c-s-PageDown>', ':BufferLineMoveNext<cr>', { desc = "Move Buffer Right", noremap = true, silent = true })
map('n', '<c-s-PageUp>', ':BufferLineMovePrev<cr>', { desc = "Move Buffer Left", noremap = true, silent = true })
-- For these two to work a specific mapping in Alacritty is needed to force Ctrl + Shift + key to pass chars
map('n', '<c-s-k>', ':BufferLineMoveNext<cr>', { desc = "Move Buffer Right", noremap = true, silent = true })
map('n', '<c-s-j>', ':BufferLineMovePrev<cr>', { desc = "Move Buffer Left", noremap = true, silent = true })

map('n', '<c-w>', ':bdelete<cr>', { desc = "Close Buffer", noremap = true, silent = true })
map('n', '<c-q>', ':wq<cr>', { desc = "Save & Quit Window", noremap = true, silent = true })

-- Better window navigation
map('n', '<c-h>', ':wincmd h<cr>', { desc = "Go to Window Left", noremap = true, silent = true })
map('n', '<c-j>', ':wincmd j<cr>', { desc = "Go to Window Down", noremap = true, silent = true })
map('n', '<c-k>', ':wincmd k<cr>', { desc = "Go to Window Up", noremap = true, silent = true })
map('n', '<c-l>', ':wincmd l<cr>', { desc = "Go to Window Right", noremap = true, silent = true })
-- TODO: Use this when zellij.nvim figures out the overriding of keybinds
-- map('n', '<c-h>', ':ZellijNavigateLeft<cr>', { desc = "Go to Window Left", noremap = true, silent = true })
-- map('n', '<c-j>', ':ZellijNavigateDown<cr>', { desc = "Go to Window Down", noremap = true, silent = true })
-- map('n', '<c-k>', ':ZellijNavigateUp<cr>', { desc = "Go to Window Up", noremap = true, silent = true })
-- map('n', '<c-l>', ':ZellijNavigateRight<cr>', { desc = "Go to Window Right", noremap = true, silent = true })
-- No reason for a "move windows around" shortcut, when you can just move between buffers easily
-- Ctrl + Shift + Key doesn't work here for some reason (even though Ctrl + Shift + PgUp/PgDn works for moving buffers in cokeline), so arrow keys are fine here for resizing
map('n', '<c-left>', ':vertical resize -2<cr>', { desc = "Resize to Left", noremap = true, silent = true })
map('n', '<c-up>', ':resize +2<cr>', { desc = "Resize Up", noremap = true, silent = true })
map('n', '<c-down>', ':resize -2<cr>', { desc = "Resize Down", noremap = true, silent = true })
map('n', '<c-right>', ':vertical resize +2<cr>', { desc = "Resize to Right", noremap = true, silent = true })

-- nvim >=0.10 has built-in commenting, so no need for a plugin
-- FIXME: For some reason works only inside of zellij, and not in native wezterm???
map2('n', '<c-_>', 'gcc', { desc = "Toggle Comment", remap = true })                           -- NOTE: remap = true (!)
map2('v', '<c-_>', 'gc', { desc = "Toggle Comment", remap = true, silent = true })
map2('i', '<c-_>', '<esc>gcca', { desc = "Toggle Line Comment", remap = true, silent = true }) -- This brings you back to the beginning of the line unfortunately

-- Easier indenting, just keep pressing < or >
map('v', '<', '<gv', { desc = "Indent Left", noremap = true, silent = true })
map('v', '>', '>gv', { desc = "Indent Right", noremap = true, silent = true })
-- TODO: Indenting by 1 character doesn't really work like this, I don't even know what this is, and . can't really be used (repeat)
-- FIXME: A way to do this would be to set the shiftwidth to 1, then move the same way with >gv, then reset shiftwidth back to 4
-- map('v', '.', ':<C-u>normal! xhP`[v`]<CR>', { desc = "Indent Left By 1 Char", noremap = true, silent = true })
-- map('v', ',', ':<C-u>normal! xp`[v`]<CR>', { desc = "Indent Right By 1 Char", noremap = true, silent = true })

-- Jumplist
-- Default is Ctrl + o and Ctrl + i (Tab), but can't use tab
map('n', '<M-o>', '<C-o>', { desc = "Jump Back", noremap = true, silent = true })
map('n', '<M-i>', '<C-i>', { desc = "Jump Forward", noremap = true, silent = true })
map('n', '<c-o>', ':lua print("Use Alt + o / Alt + i to traverse the jumplist!")<cr>', { desc = "Jump Forward", noremap = true, silent = true })

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
map('n', ' ',
    ':e<cr>:nohlsearch<cr><c-w>=:lua print("Cleared Screen and Reloaded File")<cr>',
    { desc = "Clear Screen (Reload File, Search Highlights, Reset Window Size)", noremap = true, silent = true })

-- Ctrl + r to search and replace instead of redo (why is it redo by default???)
map('n', '<c-r>', ':lua print("Search & Replace! - Start typing A, then /, then B.")<cr>:%s/',
    { desc = "Search & Replace", noremap = true, silent = true })
map('i', '<c-r>', ':lua print("Search & Replace! - Start typing A, then /, then B.")<cr>:%s/',
    { desc = "Search & Replace", noremap = true, silent = true })

-- Moving selected lines up or down with J/K, only in Visual Mode
-- This is a lot better than ddp and ddkP, doesn't mess up the clipboard, doesn't have the issue of moving the first line up and it disappearing, and doesn't use Alt
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Alt + h/l to move characters left and right (NOTE - Might be buggy)
map("n", "<A-h>", "xhP", { desc = "Move character left" })
map("n", "<A-l>", "xp", { desc = "Move character right" })

map('n', '<leader>m', ":Vivify<cr>", { desc = "Markdown Preview via Vivify" }) -- Markdown Preview

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
map('n', 'j', 'gj', { desc = "Down", noremap = true, silent = true })
map('n', 'k', 'gk', { desc = "Up", noremap = true, silent = true })
map('v', 'j', 'gj', { desc = "Down", noremap = true, silent = true })
map('v', 'k', 'gk', { desc = "Up", noremap = true, silent = true })
map('n', '<Down>', 'gj', { desc = "Down", noremap = true, silent = true })
map('n', '<Up>', 'gk', { desc = "Up", noremap = true, silent = true })
map('i', '<Down>', '<C-o>gj', { desc = "Down", noremap = true, silent = true })
map('i', '<Up>', '<C-o>gk', { desc = "Up", noremap = true, silent = true })
map('v', '<Down>', 'gj', { desc = "Down", noremap = true, silent = true })
map('v', '<Up>', 'gk', { desc = "Up", noremap = true, silent = true })

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
map('n', '<leader>lR', ':LspRestart<cr>:lua print("LSP Restarted.")<cr>',
    { desc = "LSP Restart", noremap = true, silent = true })
-- These two are NeoVim native mappings, which make my Ctrl + w shortcut for closing tab lag, and I'm already using Tab + l + c for that
vim.api.nvim_del_keymap('n', '<C-W>d')
vim.api.nvim_del_keymap('n', '<C-W><C-D>')
map('n', '<leader>lc', ':lua vim.diagnostic.open_float()<cr>', -- Stopped working without severity_bound, see #2661
    { desc = "Show Diagnostic On Current Line", noremap = true, silent = true })
map('n', '<leader>lN', ':lua vim.diagnostic.goto_next()<cr>',
    { desc = "Go to Next Diagnostic", noremap = true, silent = true })
map('n', '<leader>lP', ':lua vim.diagnostic.goto_prev()<cr>',
    { desc = "Go to Previous Diagnostic", noremap = true, silent = true })
map('n', '<leader>ll', ':Telescope diagnostics severity_bound=0<cr>', -- Stopped working without severity_bound, see #2661
    { desc = "Telescope Diagnostics", noremap = true, silent = true })
-- Formatting through the LSP, if the LSP client supports it
map('n', '<c-f>', ':lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>',
    { desc = "Format File", noremap = true, silent = true })
map('i', '<c-f>', '<esc>:lua vim.lsp.buf.format()<cr>:lua print("File formatted! 📜")<cr>',
    { desc = "Format File", noremap = true, silent = true })

-- Incrementing and decrementing (as Ctrl + a no longer increments), + and - moved across lines before
map('n', '+', '<esc><c-a>', { desc = "Increment", noremap = true, silent = true })
map('n', '-', '<esc><c-x>', { desc = "Decrement", noremap = true, silent = true })
-- TODO: Unmap Ctrl + a after this? Will it work?

-- Select all (Ctrl + a is used by tmux)
map('n', '<leader>a', '<esc>gg0vG$', { desc = 'Select All', noremap = true, silent = true })
map('v', '<leader>a', '<esc>gg0vG$', { desc = 'Select All', noremap = true, silent = true })

-- Rebinding ; as it's used only to repeat the last f, t, F or T commands, which I don't use
map('n', ';t', ':Telescope<cr>', { desc = 'Telescope Main Menu', noremap = true, silent = true })
map('n', ';r', ':Telescope resume<cr>', { desc = 'Telescope Resume', noremap = true, silent = true })
map('n', ';e', ':lua require"telescope.builtin".symbols{ sources = {"emoji"} }<cr>',
    { desc = 'System Emojis', noremap = true, silent = true })
map('n', ';g', ':lua require"telescope.builtin".symbols{ sources = {"gitmoji"} }<cr>',
    { desc = 'Gitmoji', noremap = true, silent = true })
map('n', ';j', ':lua require"telescope.builtin".symbols{ sources = {"julia"} }<cr>',
    { desc = 'Julia Symbols', noremap = true, silent = true })
map('n', ';k', ':lua require"telescope.builtin".symbols{ sources = {"kaomoji"} }<cr>',
    { desc = 'Kaomoji  (╯°□°）╯︵ ┻━┻ ', noremap = true, silent = true })
map('n', ';l', ':lua require"telescope.builtin".symbols{ sources = {"latex"} }<cr>',
    { desc = 'LaTeX', noremap = true, silent = true })        -- Won't work without LaTeX installed on your system
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

-- This requires , to be unbound from flash's config, and to use <cmd> instead of : for some reason
map('n', 'f', '<cmd>lua require("flash").jump()<cr>', { desc = "Flash Jump" })

map('n', '<leader>t', '<cmd>TSToggle highlight<cr>:lua print("TreeSitter Toggled!")<cr>',
    { desc = "Toggle TS Highlight" })

function ClearRegisters()
    -- Sets the contents of every register named here to empty
    vim.cmd [[
        let regs = split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
        for r in regs
            call setreg(r, [])
        endfor
    ]]
end

map('n', '<leader>sr', ':lua ClearRegisters()<cr>', { desc = "Clear All Registers", noremap = true, silent = true })

-- Convert tabs to spaces, as 4 spaces should ALWAYS be used for indentation - use this!
-- NOTE: This will convert ALL tabs to spaces, regardless if it's indentation or in-code (after the first non-blank character)
map('n', '<leader>ss', ':set expandtab<cr>:retab<cr>',
    { desc = "Convert All Tabs to Spaces", noremap = true, silent = true })

-- NOTE: I haven't been able to figure out how to convert indentation to tabs, BUT, as I'll never use that, and sometimes I might need an actual tab, I made this
-- A special shortcut that inserts a tab character
-- So, in no other way would I ever need tabs, only in special circumstances like the Vim leader key
map('n', '<leader>st', ':set expandtab!<cr>a\t<Esc>:set expandtab<cr>',
    { desc = "Insert Tab Character", noremap = true, silent = true })

-- Toggle showing whitespace characters in the whole file
-- Spaces are +, trailing spaces are - and tabs are >- (or just > or >---)
-- indent-blankline is overriding these just so you know
-- NOTE: To change the color of the whitespace characters, go to :hi NonText guifg=#226666 (theme default is #1b1b1b)
function ToggleWhitespace()
    if vim.opt.list:get() then
        vim.opt.list = false
        vim.api.nvim_set_hl(0, 'NonText', { fg = '#1b1b1b' })
        return
    else
        vim.opt.list = true
        vim.api.nvim_set_hl(0, 'NonText', { fg = '#226666' })
        return
    end
end

map('n', '<leader>sl', ':lua ToggleWhitespace()<cr>',
    { desc = "Toggle Show Whitespace Chars", noremap = true, silent = true })
map('n', '<leader>se', '/\\s\\n<cr>',
    { desc = "Show spaces at EOL", noremap = true, silent = true })
map('n', '<leader>sw', ':%s/\\s\\+$//g<cr>',
    { desc = "Strip Trailing Whitespace", noremap = true, silent = true })

-- Visual Multi (Multi-Cursor)
-- <Tab> changes the mode to visual (AKA "Extend mode"), so you can keep on selecting from where the cursors are
-- Double tap <Esc> to exit VM insert mode
-- TODO: Tab + v + n is broken rn, you can't use Tab for that when in VM mode
map('n', '<leader>va', '<Plug>(VM-Select-All)',
    { desc = "On All Same Words", noremap = true, silent = true })
map('n', '<leader>vn', '<Plug>(VM-Find-Under)',
    { desc = "On Next Same Word", noremap = true, silent = true })
map('n', '<C-Down>', '<Plug>(VM-Add-Cursor-Down)',
    { desc = "Add Cursor Down", noremap = true, silent = true })
map('n', '<C-Up>', '<Plug>(VM-Add-Cursor-Up)',
    { desc = "Add Cursor Up", noremap = true, silent = true })
-- TODO: Haven't figured out how to bind Ctrl + Shift + Key in WezTerm
-- map('n', '<C-S-j>', '<Plug>(VM-Add-Cursor-Down)',
--     { desc = "Add Cursor Up", noremap = true, silent = true })
-- map('n', '<C-S-k>', '<Plug>(VM-Add-Cursor-Up)',
--     { desc = "Add Cursor Up", noremap = true, silent = true })

-- File Explorers
-- For mini.files and Oil see their respective configs
-- map('n', '<s-b>', ':NvimTreeToggle<cr>', { desc = "Old File Explorer", noremap = true, silent = true })
-- map('i', '<s-b>', '<esc>:NvimTreeToggle<cr>', { desc = "Old File Explorer", noremap = true, silent = true })
