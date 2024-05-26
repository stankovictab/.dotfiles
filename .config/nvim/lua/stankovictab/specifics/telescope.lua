require('telescope').setup {
    pickers = {
        find_files = {
            -- Allowing find_files to find hidden files
            find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }
        },
    },
    defaults = {
        initial_mode = "insert",             -- Initial mode to open telescope in, default is insert, normal is good to browse
        layout_config = {
            width = 900,                     -- Width of telescope
            preview_width = 0.5              -- Percentage of the telescope's width that the preview is
        },
        file_ignore_patterns = { "node_modules" }, -- Ignore node_modules folder
        -- Allowing live_grep to search through hidden files
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden" -- This is the only thing added in this list
        },

        -- Map Ctrl + j/k to go up and down
        mappings = {
            n = {
                ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move to previous result
                ["<C-j>"] = require("telescope.actions").move_selection_next -- Move to next result
            },
            i = {
                ["<C-k>"] = require("telescope.actions").move_selection_previous, -- Move to previous result
                ["<C-j>"] = require("telescope.actions").move_selection_next -- Move to next result
            }
        }
    }
}
