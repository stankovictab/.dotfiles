-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/stankovictab/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/stankovictab/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/stankovictab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/stankovictab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/stankovictab/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["alpha-nvim"] = {
    commands = { "Alpha", "AlphaRedraw" },
    config = { "require('stankovictab.specifics.alpha')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('stankovictab.specifics.bufferline')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  catppuccin = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-status.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/copilot-status.nvim",
    url = "https://github.com/jonahgoldwastaken/copilot-status.nvim"
  },
  ["copilot.lua"] = {
    commands = { "Copilot" },
    config = { "\27LJ\2\n©\2\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\14filetypes\1\0\t\thelp\1\tyaml\2\rmarkdown\2\6.\1\bcvs\1\bsvn\1\rhgcommit\1\14gitrebase\1\14gitcommit\1\15suggestion\1\0\0\vkeymap\1\0\6\16accept_line\1\16accept_word\1\vaccept\n<Tab>\fdismiss\n<C-]>\tnext\n<C-h>\tprev\n<C-l>\1\0\3\17auto_trigger\2\fenabled\2\rdebounce\3K\nsetup\fcopilot\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('stankovictab.specifics.indent-blankline')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('stankovictab.specifics.lualine')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["mgz.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/mgz.nvim",
    url = "https://github.com/stankovictab/mgz.nvim"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/neovim-ayu",
    url = "https://github.com/Shatur/neovim-ayu"
  },
  ["nord.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nord.nvim",
    url = "https://github.com/shaunsingh/nord.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "require('stankovictab.specifics.nvim-cmp')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('stankovictab.specifics.nvim-colorizer')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { "require('stankovictab.specifics.nvim-cursorline')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lspconfig"] = {
    config = { "require('stankovictab.specifics.lsp-hell')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollbar"] = {
    config = { "require('stankovictab.specifics.nvim-scrollbar')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-tree.lua"] = {
    config = { "require('stankovictab.specifics.nvim-tree')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('stankovictab.specifics.treesitter')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    config = { "require('stankovictab.specifics.playground')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["presence.nvim"] = {
    config = { "require('stankovictab.specifics.presence')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/presence.nvim",
    url = "https://github.com/andweeb/presence.nvim"
  },
  ["telescope.nvim"] = {
    config = { "require('stankovictab.specifics.telescope')" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "require('stankovictab.specifics.toggleterm')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-code-dark"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/vim-code-dark",
    url = "https://github.com/tomasiser/vim-code-dark"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\2\nL\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\vwindow\1\0\0\nsetup\rzen-mode\frequire\0" },
    loaded = true,
    path = "/home/stankovictab/.local/share/nvim/site/pack/packer/start/zen-mode.nvim",
    url = "https://github.com/folke/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\vwindow\1\0\0\nsetup\rzen-mode\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('stankovictab.specifics.nvim-cmp')
time([[Config for nvim-cmp]], false)
-- Config for: presence.nvim
time([[Config for presence.nvim]], true)
require('stankovictab.specifics.presence')
time([[Config for presence.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('stankovictab.specifics.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('stankovictab.specifics.nvim-colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
require('stankovictab.specifics.bufferline')
time([[Config for bufferline.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('stankovictab.specifics.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-cursorline
time([[Config for nvim-cursorline]], true)
require('stankovictab.specifics.nvim-cursorline')
time([[Config for nvim-cursorline]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('stankovictab.specifics.nvim-tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('stankovictab.specifics.lsp-hell')
time([[Config for nvim-lspconfig]], false)
-- Config for: playground
time([[Config for playground]], true)
require('stankovictab.specifics.playground')
time([[Config for playground]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('stankovictab.specifics.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('stankovictab.specifics.telescope')
time([[Config for telescope.nvim]], false)
-- Config for: nvim-scrollbar
time([[Config for nvim-scrollbar]], true)
require('stankovictab.specifics.nvim-scrollbar')
time([[Config for nvim-scrollbar]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'AlphaRedraw', function(cmdargs)
          require('packer.load')({'alpha-nvim'}, { cmd = 'AlphaRedraw', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'alpha-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('AlphaRedraw ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Copilot', function(cmdargs)
          require('packer.load')({'copilot.lua'}, { cmd = 'Copilot', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'copilot.lua'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Copilot ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'StartupTime', function(cmdargs)
          require('packer.load')({'vim-startuptime'}, { cmd = 'StartupTime', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'vim-startuptime'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('StartupTime ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Alpha', function(cmdargs)
          require('packer.load')({'alpha-nvim'}, { cmd = 'Alpha', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'alpha-nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Alpha ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'alpha-nvim', 'toggleterm.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPost * ++once lua require("packer.load")({'copilot-status.nvim'}, { event = "BufReadPost *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'copilot.lua'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
