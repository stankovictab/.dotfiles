-- mini.files configuration - an in-buffer file explorer
-- Similarly to oil it uses native vim keybinds for editing the fs
-- And similarly to ranger you can use h/l to move around
-- NOTE: If preview or editing isn't working, check on directory permissions
-- See :help mini.files
--
-- CON: Pressing = every time you do a change is kinda bad imo
-- CON: It can very easily crash and mess your screen up if you do something you shouldn't while it's open (open Telescope, open Oil inside it, etc)
-- CON: It doesn't support git integration ootb, no plans to, there is https://www.reddit.com/r/neovim/comments/1cfd5w1/minifiles_git_status_integration/, but I haven't gotten it to work
--
-- TODO: Shouldn't ESC and Ctrl + c also quit? And shouldn't <CR> be bound for go_in?
--
-- Here are the available highlight groups (see :help mini.files) :
-- * `MiniFilesBorder` - border of regular windows.
-- * `MiniFilesBorderModified` - border of windows showing modified buffer.
-- * `MiniFilesCursorLine` - cursor line in explorer windows.
-- * `MiniFilesDirectory` - text and icon representing directory.
-- * `MiniFilesFile` - text representing file.
-- * `MiniFilesNormal` - basic foreground/background highlighting.
-- * `MiniFilesTitle` - title of regular windows.
-- * `MiniFilesTitleFocused` - title of focused window.

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
        synchronize = '=', -- NOTE: Used to apply your changes (important)
        trim_left   = '<',
        trim_right  = '>',
    },
    options = {
        permanent_delete = false,        -- Whether to delete permanently or move into module-specific trash
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

function MiniFilesToggle()
    if not MiniFiles.close() then MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
end

vim.keymap.set({ 'n', 'i', 'v' }, '<c-b>', '<esc>:lua MiniFilesToggle()<cr>',
    { desc = "File Explorer", noremap = true, silent = true })
