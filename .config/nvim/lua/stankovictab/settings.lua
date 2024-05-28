------------ Vim Settings

vim.g.loaded_netrwPlugin = 1 -- Disable netrw
vim.g.loaded_netrw = 1       -- Disable netrw

vim.opt.showmode = false -- LuaLine already shows the mode, this is for the print in the status line, it adds -- INSERT -- and clears the last msg
vim.opt.number = true        -- Absolute line numbering
vim.opt.mouse =
'a'                          -- Enable mouse support - enables clicking, dragging puts you into visual mode, scroll is fixed - 'a' is for mouse support, 'r' disables it.
vim.opt.cursorline = true    -- Set highlight of the current line and line number
vim.opt.ignorecase = true    -- Set search to be case insensitive
-- vim.opt.smartcase = true -- Set search to be case sensitive when an uppercase letter is used - however, I suggest using \C at the end of your query for case sensitivity, this is a little weird
vim.opt.splitbelow = true    -- On automatic split, split down instead of up (default)
vim.opt.splitright = true    -- On automatic split, split right instead of left (default)
vim.opt.hidden = true        -- Keeps opened buffers (files) in memory, for faster use

-- Tabs & Spaces --
-- When you press tab, you get 4 spaces - end of discussion
-- See the Spaces vs Tabs Debate in the Vim Notion for explanation
-- By default NeoVim uses a width of 8 and tabs are tab chars, disgusting
vim.opt.tabstop = 4 -- Set tabs (result of pressing the tab key) to be 4 spaces WIDE
vim.opt.shiftwidth = 4 -- Set the width of a newline when indenting to also be 4 spaces wide, and the amount that gets shifted when using > and < in visual mode (see :h >) - ALWAYS make it the same as tabstop - don't change these two settings if you want tabs of 4 width, whether they're actual tab chars or spaces
vim.opt.expandtab = true -- Setting that if set to true, makes any new tabs be spaces, therefore you will no longer have any tabs when writing. false means that the tab key will insert tab chars. It doesn’t change the whole doc instantly, rather just newly typed tabs (it is a setting after all). Again, doesn’t change current tab chars in the file.
-- expandtab is used with the :retab command to convert all tabs in the buffer to whatever you set here
vim.opt.smarttab = true -- Changes the behaviour of backspace, if it's on, it'll delete the 4 space chars that made up the tab, if false it'll delete them one by one
vim.opt.listchars = "tab:>-,trail:-,space:+,extends:>,precedes:<,eol:⏎" -- Toggle with :set list! (or Tab + s + l)
-- Good options - Space: , Tabs: -

vim.opt.clipboard = 'unnamedplus' -- Enables system clipboard use, copy by yanking and paste with Ctrl + Shift + v
vim.opt.errorbells = false        -- Removes the stupid ass terminal bell sound
vim.opt.scrolloff = 1             -- Number of lines to keep at the cursor when scrolling up or down the file
vim.opt.signcolumn =
'yes'                             -- Column left of number line, used by git gutter and lsp, by default it's 'auto', and 'yes' means always on
vim.opt.updatetime = 250          -- The default update time is 4000ms (for things like vim-gitgutter), which is too long
vim.opt.linebreak = true          -- Word wrap / line break on word, not on character
vim.opt.termguicolors = true      -- Enables 24bit color (TrueColor) support for theming, therefore unlocks gui, guifg and guibg attributes for highlight groups (#rrggbb color support), instead of the old cterm attributes
-- This allows the arrow keys to go to the previous and next line when going left at the stand and right at the end of the line
vim.opt.whichwrap:append "<>[]"   -- This is for left and right arrow keys
vim.opt.whichwrap:append "h,l"    -- This is for h and l
-- vim.opt.ls = 0 -- Removes the status line, default is 2 (always have it) - just make sure you're not using lualine or something like that
-- vim.opt.ch = 0 -- Hides the command line until you start writing one
-- vim.opt.laststatus = 3 -- Always show the status line, even if there's only one window


-- NeoVide Settings (GUI NeoVim) --

if vim.g.neovide then
    vim.o.guifont = "JetBrainsMono Nerd Font Mono:h14"
end
