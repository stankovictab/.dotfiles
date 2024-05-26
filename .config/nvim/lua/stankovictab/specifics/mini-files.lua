-- Out of all file explorers (netrw, nvim-tree, oil) this is the best one imo
-- Similarly to oil it uses native vim keybinds for editing the fs
-- And similarly to ranger you can use h/l to move around
-- NOTE: If preview or editing isn't working, check on directory permissions
-- See :help mini.files
--
-- For git integration see https://www.reddit.com/r/neovim/comments/1cfd5w1/minifiles_git_status_integration/
-- FIXME: I didn't manage to get it working, and the dev of mini.files has no plans on integrating git status into this
--
-- TODO: Shouldn't ESC and Ctrl + c also quit? And shouldn't <CR> be bound for go_in?
-- FIXME: Trying to open Telescope while in mini.files closes everything, it's weird

require('mini.files').setup({
    mappings = {           -- Use `''` (empty string) to not create one.
        close       = 'q',
        go_in       = 'L', -- Leaves mini.files window open
        go_in_plus  = 'l', -- Exits mini.files window when opening
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>', -- Reset the window
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '=', -- To apply your changes (important)
        trim_left   = '<',
        trim_right  = '>',
    },
    options = {
        permanent_delete = true,        -- Whether to delete permanently or move into module-specific trash
        use_as_default_explorer = true, -- Whether to use for editing directories
    },
    windows = {
        max_number = math.huge,
        preview = true,
        width_focus = 50,   -- Default: 50
        width_nofocus = 15, -- Default: 15
        width_preview = 50, -- Default: 25
    },
})
