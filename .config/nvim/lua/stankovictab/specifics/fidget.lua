-- fidget.nvim displays a spinner in the bottom right when loading LSP, for example

-- NOTE: You can use fidget for notifications
-- Don't know how good of an idea that is

require("fidget").setup({
    -- TODO: This is just a random config that Codeium spit out, make a better one
    text = {
        spinner = "line",
    },
    align = {
        bottom = true
    }
})
