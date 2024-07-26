-- WAY Better scrollbar than nvim-scrollbar
-- I think this is actually my favourite NeoVim plugin, it's so nicely done!
-- Has mouse support (in terminal NeoVim, not GUI NeoVide), and doesn't break up on word wrap
-- It uses signs to show relevant info on the scrollbar line, in a stacked way
-- See :help scrollview
-- ScrollView has some pretty useful commands like :ScrollViewLegend, :ScrollViewNext, :ScrollViewPrev, etc
require('scrollview').setup({
    excluded_filetypes = { 'nerdtree' },
    current_only = true, -- Whether to display only in current window
    base = 'right',
    -- Available signs: conflicts, cursor, diagnostics, folds, loclist, marks, quickfix, search, spell, textwidth, trail
    -- The cursor is a little dot next to the bar
    -- conflicts look really nice in the scrollbar, it seperates >, = and <
    -- NOTE: trail (for trailing whitespace) is right now a white box for some reason, makes it look like the icon is bugged, but it's not
    signs_on_startup = { 'conflicts', 'diagnostics', 'folds', 'loclist', 'marks', 'quickfix', 'search', 'spell', 'textwidth', 'trail' },
    -- diagnostics_severities = { vim.diagnostic.severity.ERROR }
})

-- TODO: Don't know how to put this into the setup function, but this works
vim.g.scrollview_trail_symbol = "󰼞"
vim.g.scrollview_search_symbol = ""

-- Scrollview supports third party "signs" providers, such as Gitsigns
require('scrollview.contrib.gitsigns').setup()
