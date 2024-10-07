local function treeshitter_icon()
    return ""
end

local function treeshitter_color()
    -- Check if TreeSitter highlighting is active in the current buffer - this is dynamic, I love lualine
    if vim.treesitter.highlighter.active[vim.api.nvim_get_current_buf()] ~= nil then
        return { fg = "#58f5ab" }
    else
        return { fg = "#444444" } -- TODO: Make this dynamic to the theme? On catppuccin it's blending into the background.
    end
end

local function supermaven_icon()
    return "󰚩" -- Also  "", "󱙺"
end

local function supermaven_color()
    local status_output = ""
    local success, _ = pcall(function()
        status_output = vim.fn.execute('SupermavenStatus')
    end)
    if not success then
        -- print("SupermavenStatus command not available yet") -- This gets printed around 6 times when starting NeoVim
        return { fg = "#444444" } -- Default to "not running" color
    end
    if string.find(status_output:lower(), "not running") then
        return { fg = "#444444" }
    else
        return { fg = "#1babff" }
    end
end

local function visualmulti_icon()
    -- return "󰡀"
    if vim.fn.exists(":VMQfix") == 2 then -- This command is only available in VisualMulti
        return '󰈈'
    else
        return '󰈉' -- Also "󰈉", """
    end
end

local function visualmulti_color()
    if vim.fn.exists(":VMQfix") == 2 then -- This command is only available in VisualMulti
        return { fg = "#c25dfc" }
    else
        return { fg = "#444444" }
    end
end

require('lualine').setup {
    options = {
        theme = 'auto', -- If the current colorscheme has a lualine theme built in, it'll recognize it
        -- The color of component_separators is the same as the text
        -- component_separators = { left = '', right = ''},
        -- component_separators = { left = '|', right = '|' },
        -- component_separators = { left = '', right = ''},
        component_separators = { left = '', right = '' },
        -- The color of section_separators is the same as the background
        section_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        disabled_filetypes = { 'NvimTree' }, -- Filetypes where lualine won't be used
        -- ignore_focus = { 'NvimTree' }, -- Filetypes where lualine will be inactive
    },
    sections = {
        -- Some unused sections are 'encoding', 'fileformat', 'progress' and 'buffers'
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', icon = '', color = { fg = "white" } }, 'diff', 'diagnostics' },
        lualine_c = { {
            'filename',
            file_status = true,    -- Displays file status (readonly status, modified status)
            newfile_status = true, -- Display new file status (new file means no write after created)
            path = 1,              -- 0: Just the filename (default)
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40,         -- Shortens path to leave 40 spaces in the window for other components.
            symbols = {
                modified = '[Modified]',  -- Text to show when the file is modified.
                readonly = '[Read Only]', -- Text to show when the file is non-modifiable or readonly.
                unnamed = '[No Name]',    -- Text to show for unnamed buffers.
                newfile = '[New]',        -- Text to show for newly created file before first write
            },
            -- color = { fg = '#aa90ff', gui='italic,bold' }
        },
            -- {
            -- 	'filetype',
            -- 	colored = true,   -- Displays filetype icon in color if set to true
            -- 	icon_only = true, -- Display only an icon for filetype
            -- 	icon = { align = 'right' }, -- Display filetype icon on the right hand side
            -- 	-- icon =    {'X', align='right'}
            -- 	-- Icon string ^ in table is ignored in filetype component
            -- }
        },

        -- Shows the current loaded LSP clients - their names and icon
        -- Got this from here https://www.reddit.com/r/neovim/comments/11kumh3/comment/jbacpna/
        -- You can click on it to open the LSP info window
        lualine_x = {
            {
                function()
                    -- Last folder of the current working directory
                    return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                end,
                color = { fg = '#444444', gui = 'italic,bold' }
            },
            {
                function()
                    local lsps = vim.lsp.get_clients({ bufnr = vim.fn.bufnr() })
                    -- local icon = require("nvim-web-devicons").get_icon_by_filetype(
                    -- 	vim.api.nvim_buf_get_option(0, "filetype")
                    -- )
                    if lsps and #lsps > 0 then
                        local names = {}
                        for _, lsp in ipairs(lsps) do
                            table.insert(names, lsp.name)
                        end
                        return string.format("%s", table.concat(names, "  ")) -- Line that gets printed
                    else
                        -- return icon or ""
                        return ""
                    end
                end,
                on_click = function()
                    vim.api.nvim_command("LspInfo")
                end,
                color = function()
                    -- Set the color to the icon's color
                    -- local _, color = require("nvim-web-devicons").get_icon_cterm_color_by_filetype(
                    -- 	vim.api.nvim_buf_get_option(0, "filetype")
                    -- )
                    -- return { fg = color }

                    -- Set the color to the color of the text in the lualine segment
                    local color = vim.fn.synIDattr(vim.fn.hlID('lualine_c_normal'), 'fg')
                    return { fg = color }
                end,
            } },

        -- lualine_y = { 'filetype' },
        -- lualine_y = { require('copilot_status').status_string, },
        lualine_y = {
            { 'filetype' },
            { visualmulti_icon, color = visualmulti_color },
            { supermaven_icon,  color = supermaven_color },
            { treeshitter_icon, color = treeshitter_color },
        },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        -- Styling of the inactive version, for when you're in the ignored filetype (NvimTree), or when splitting the window, the lualine of the inactive pane
        lualine_a = { 'mode' },
        lualine_b = { { 'branch', icon = '', color = { fg = "white" } }, 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = { 'filetype' }, -- Removed 'progress'
        lualine_z = { 'location' }
    },
    tabline = {},
    -- winbar = {}, -- Sorta like a buffer line?
    extensions = {}
}
