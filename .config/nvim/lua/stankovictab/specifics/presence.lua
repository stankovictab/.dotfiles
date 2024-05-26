-- You might notice that rich presence doesn't fire up instantly
-- That's because it, by default, fires up on autocmd events
-- Events like this are switching buffers, opening new windows, etc

require("presence"):setup({
    neovim_image_text = "Losing My Mind in Neovim", -- Text displayed when hovered over the Neovim image
    main_image        = "file",                     -- Main image display (either "neovim" or "file")
})
