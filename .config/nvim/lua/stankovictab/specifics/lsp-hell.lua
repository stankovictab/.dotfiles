-- Config for Everything LSP --

-- In order to add support for a language, add it in the ensure_installed list in mason-lspconfig (or just install it with :Mason), and then add lspconfig's .setup(), that's what actually enables the language
-- You should go to nvim-lspconfig's server_configurations.md to see the setup for that language, it may have something other than just .setup()
-- Also, it's important to note that mason and lspconfig, for some reason, name their language servers differently - here you need to use lspconfig's names
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-------------------------------------

require('mason').setup()

-------------------------------------

require('mason-lspconfig').setup({
	-- You can preinstall LSPs here, or do it manually with :Mason
	ensure_installed = { "tsserver", "pyright", "lua_ls", "bashls" }
})

-------------------------------------

-- Specific lspconfig's setups for various LSPs, from server_configurations.md
-- Each one can have it's own on_attach function, which is called when the language server is attached to the buffer

require('lspconfig').tsserver.setup {
	on_attach = function()
		-- print("LSP tsserver () attached!")
	end
}

require('lspconfig').pyright.setup {}

require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			runtime = { -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = 'LuaJIT',
			},
			diagnostics = { -- Get the language server to recognize the `vim` global
				globals = { 'vim' },
			},
			workspace = { -- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { -- Do not send telemetry data containing a randomized but unique identifier
				enable = false,
			},
		},
	},
}

require('lspconfig').bashls.setup{}
