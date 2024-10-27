-- fidget.nvim displays a spinner in the bottom right when loading LSP, for example

-- NOTE: You can use fidget for notifications
-- Don't know how good of an idea that is

require("fidget").setup({
    -- TODO: This is just a random config that an LLM spit out - make a better one if you can
    text = {
        spinner = "line",
    },
    align = {
        bottom = true
    }
})
