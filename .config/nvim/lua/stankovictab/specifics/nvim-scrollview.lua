-- WAY Better scrollbar than nvim-scrollbar
-- I think this is actually my favourite NeoVim plugin, it's so nicely done!
-- Has mouse support (in terminal NeoVim, not GUI NeoVide), and doesn't break up on word wrap
-- It uses signs to show relevant info on the scrollbar line, in a stacked way (like git diff, search, cursor position, etc, left of the scrollbar)
-- See :help scrollview
-- ScrollView has some pretty useful commands like :ScrollViewLegend, :ScrollViewNext, :ScrollViewPrev, etc
require('scrollview').setup({
    excluded_filetypes = { 'nerdtree', 'help', 'alpha' },
    current_only = true, -- Whether to display only in current window (when splits are open)
    base = 'right',
    -- Available signs: conflicts, cursor, diagnostics, folds, loclist, marks, quickfix, search, spell, textwidth, trail
    -- The cursor is a little dot next to the bar
    -- conflicts look really nice in the scrollbar, it seperates >, = and <
    signs_on_startup = { 'conflicts', 'diagnostics', 'folds', 'loclist', 'marks', 'quickfix', 'search', 'spell', 'textwidth', 'trail' },
    -- diagnostics_severities = { vim.diagnostic.severity.ERROR }

    -- By default, the scrollbar is printed over characters that don't get wrapped into a new line
    -- The old vim.opt.wrapmargin doesn't work for NeoVim it seems, so you can't set a margin of 3 characters from the right
    -- Instead, you can use nvim-scrollview's hiding features
    hide_bar_for_insert = true, -- Default false, hides scrollbar when in insert mode
    hide_on_cursor_intersect = true, -- Default false, hides scrollbar when it would otherwise intersect with the cursor (when the cursor is on the bar or sign itself)
    -- hide_on_float_intersect = true, -- Default false, hides scrollbar when it would otherwise intersect with a floating window
    signs_hidden_for_insert = { 'all' }, -- Default {}, hides all signs in the current window when in insert mode
    hide_on_text_intersect = false, -- Default false, hides scrollbar when it would otherwise intersect with text (the whole scrollbar, not just parts of it like nvim-scrollbar does). Also applies to signs if the sign is in the way of the text.
})

-- TODO: Don't know how to put this into the setup function, but this works
vim.g.scrollview_trail_symbol = "󰼞"
vim.g.scrollview_search_symbol = ""

-- Scrollview supports third party "signs" providers, such as Gitsigns
require('scrollview.contrib.gitsigns').setup()
