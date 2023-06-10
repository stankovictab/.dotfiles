require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = "all",
  ensure_installed = {
	"bash",
	"c",
	"cmake",
	"comment",
	"cpp",
	"css",
	"dockerfile",
	"fish",
	"git_config",
	"git_rebase",
	"gitcommit",
	"gitignore",
	"go",
	"gomod",
	"html",
	"java",
	"javascript",
	"jq",
	"jsdoc",
	"json",
	"jsonc",
	"kotlin",
	"latex",
	"lua",
	"markdown",
	"markdown_inline",
	"matlab",
	"python",
	"r",
	"regex",
	"rust",
	"scala",
	"scss",
	"sql",
	"svelte",
	"terraform",
	"toml",
	"typescript",
	"vim",
	-- XML is not a thing yet
	"yaml",
	"zig"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole reason for treeshitter
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = true, -- Default is false
  },
}
