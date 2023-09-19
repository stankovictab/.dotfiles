------------ Vim Settings

vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.g.loaded_netrw = 1 -- Disable netrw

vim.opt.number = true -- Absolute line numbering
vim.opt.mouse = 'a' -- Enable mouse support - enables clicking, dragging puts you into visual mode, scroll is fixed - 'a' is for mouse support, but I don't like clicking on NeoVim from another window and accidentally dragging and it putting me in Visual mode because of that so I start typing and nothing happens and I need to Esc out. Idk. 'r' basically disables it. 
vim.opt.cursorline = true -- Set highlight of the current line and line number
vim.opt.ignorecase = true -- Set search to be case insensitive
-- vim.opt.smartcase = true -- Set search to be case sensitive when an uppercase letter is used - however, I suggest using \C at the end of your query for case sensitivity, this is a little weird
vim.opt.splitbelow = true -- On automatic split, split down instead of up (default)
vim.opt.splitright = true -- On automatic split, split right instead of left (default)
vim.opt.hidden = true -- Keeps opened buffers (files) in memory, for faster use
vim.opt.tabstop = 4 -- Set tabs to be 4 spaces wide
vim.opt.shiftwidth = 4 -- Set the width of a newline when indenting to also be 4 spaces wide
-- set expandtab -- Changes tabs into spaces! (tabstop times)
vim.opt.clipboard = 'unnamedplus' -- Enables system clipboard use, copy by yanking and paste with Ctrl + Shift + v
vim.opt.errorbells = false -- Removes the stupid ass terminal bell sound
vim.opt.scrolloff = 1 -- Number of lines to keep at the cursor when scrolling up or down the file
vim.opt.signcolumn = 'yes' -- Column left of number line, used by git gutter and lsp, by default it's 'auto', and 'yes' means always on
vim.opt.updatetime = 250 -- The default update time is 4000ms (for things like vim-gitgutter), which is too long
vim.opt.linebreak = true -- Word wrap / line break on word, not on character
vim.opt.termguicolors = true -- Enables 24bit color (TrueColor) support for theming, therefore unlocks gui, guifg and guibg attributes for highlight groups (#rrggbb color support), instead of the old cterm attributes
-- This allows the arrow keys to go to the previous and next line when going left at the stand and right at the end of the line
vim.opt.whichwrap:append "<>[]" -- This is for left and right arrow keys
vim.opt.whichwrap:append "h,l" -- This is for h and l
-- vim.opt.ls = 0 -- Removes the status line, default is 2 (always have it) - just make sure you're not using lualine or something like that
-- vim.opt.ch = 0 -- Hides the command line until you start writing one
-- vim.opt.laststatus = 3 -- Always show the status line, even if there's only one window
