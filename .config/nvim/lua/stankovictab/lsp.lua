-- A Lua config file for everything LSP -- 

require('nvim-lsp-installer').setup{} -- Needed for LSP Installer setup

require("lspconfig").pyright.setup{}
-- require('lspconfig').pylsp.setup{}
