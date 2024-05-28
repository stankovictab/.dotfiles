-- Better scrollbar than nvim-scrollbar
-- Has mouse support, and doesn't break up on word wrap
-- It uses signs to show relevant info on the scrollbar line, in a stacked way
require('scrollview').setup({
    excluded_filetypes = { 'nerdtree' },
    current_only = true, -- Whether to display only in current window
    base = 'right',
    -- Available signs: conflicts, cursor, diagnostics, folds, loclist, marks, quickfix, search, spell, textwidth, trail
    -- The cursor is a little dot next to the bar
    signs_on_startup = { 'diagnostics', 'marks', 'search', 'folds', 'loclist', 'quickfix', 'spell', 'textwidth', 'trail' },
    -- diagnostics_severities = { vim.diagnostic.severity.ERROR }
})

-- Scrollview supports third party "signs" providers, such as Gitsigns
require('scrollview.contrib.gitsigns').setup()
