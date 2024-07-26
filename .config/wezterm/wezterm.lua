local wezterm = require 'wezterm'
local config = {

    check_for_updates = false, -- Disable update check
    -- show_update_window = false

    -- Disabling the exit dialog, shouldn't be an issue if you're doing everything in zellij
    window_close_confirmation = 'NeverPrompt',

    -- Disabling the font problem notification. NOTE: This might be useful though!
    warn_about_missing_glyphs = false,

    ----- Fonts -----
    -- Ligatures are supported in WezTerm OOTB, unlike Alacritty (~~>)
    font = wezterm.font 'JetBrainsMono Nerd Font Mono', -- There is also a NL version with No Ligatures.
    -- font = wezterm.font 'Hack Nerd Font Mono'
    -- font = wezterm.font 'FiraCode Nerd Font Mono'
    -- font = wezterm.font 'RobotoMono Nerd Font Mono'
    -- font = wezterm.font 'Monaspace Neon Var' -- Argon, Krypton, Neon, Radon, Xenon (Variable versions, not really for terminals)
    -- font = wezterm.font 'Monaspace Neon' -- Argon, Krypton, Neon, Radon, Xenon
    -- font = wezterm.font 'MonispaceNe NF' -- WIP: See the NerdFont GitHub for more info on the Mon(?)space NF https://github.com/ryanoasis/nerd-fonts/issues/1403
    -- font = wezterm.font 'GohuFont uni11 Nerd Font Mono' -- The pixel font, also available as uni14 and non-Mono
    -- font = wezterm.font 'GeistMono Nerd Font Mono' -- Also available as non-Mono

    ----- Colors -----
    -- 950 themes available OOTB, nice ones are GitHub Dark, Catppuccin Mocha, Dracula, Batman
    -- See more here: https://wezfurlong.org/wezterm/colorschemes
    color_scheme = 'mgz',

    -- These are colors that override colors from the color scheme selected
    -- I recommend leaving this even if you set your own theme
    colors = {
        foreground = 'white',
        background = '#121212', -- Background of Nobara title bar, matches well (in Zellij too)
        -- Cursor override works in NeoVim aswell, like it should
        cursor_bg = 'white',
        cursor_fg = 'black',
        -- cursor_border = 'white',
    },

    ----- Zellij Window -----

    hide_tab_bar_if_only_one_tab = true,                -- Tabs are hidden by default
    adjust_window_size_when_changing_font_size = false, -- Don't know why it's true by default

    -- Change window size
    initial_cols = 128, -- Default 80
    initial_rows = 34,  -- Default 24

    window_frame = {
        font = wezterm.font 'JetBrainsMono Nerd Font Mono',
        font_size = 10,
        inactive_titlebar_bg = '#353535',
        active_titlebar_bg = '#2b2042',
        inactive_titlebar_fg = '#cccccc',
        active_titlebar_fg = '#ffffff',
        inactive_titlebar_border_bottom = '#2b2042',
        active_titlebar_border_bottom = '#2b2042',
        button_fg = '#cccccc',
        button_bg = '#2b2042',
        button_hover_fg = '#ffffff',
        button_hover_bg = '#3b3052',
    },

    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },

    -- window_decorations = "RESIZE", -- "RESIZE" keeps the resize feature but removes the titlebar
    -- use_fancy_tab_bar = false, -- ???

    ----- Keys -----

    keys = {
        { -- Bind Shift + Up to scroll up
            key = 'UpArrow',
            mods = 'SHIFT',
            action = wezterm.action.ScrollByLine(-1),
        },
        { -- Bind Shift + Down to scroll down
            key = 'DownArrow',
            mods = 'SHIFT',
            action = wezterm.action.ScrollByLine(1),
        },
    },
}

return config
