local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
math.randomseed(os.time())

local logo = {
"        °*o#@@##           o@#°               ",
"    .o#Oo**.                 .*@@@@#o         ",
"  *°°                             *o@@@*      ",
"      ..@@O°O#@@@@o                  °#@O*    ",
"   o@@#.#o  *@@@@o       oO°#@@@@@@#*    *o   ",
"  o@@@#@#@@*.#..         #@@.°.#° °#@@@.   °  ",
" .*...°°...°              *#@@°#@ °@@@@@@*    ",
"                               °°°*OO#@@@@*   ",
"                                         *@°  ",
"                                          *@  ",
"                                          .@  ",
"                                          o*  ",
"                                          @.  ",
"                                         °O   ",
"                                         :    ",
"                                         .    "
}

dashboard.section.header.val = logo
dashboard.section.header.opts.hl = "Define" -- Color of logo, was "AlphaHeader"

local function button(sc, txt, keybind, keybind_opts)
  local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = "Define" -- Color
    b.opts.hl_shortcut = "AlphaButton" -- Color
    return b
  end

-- You can change up the menu here
-- The command on the end is just for the Enter press on the menu item
dashboard.section.buttons.val = {
  button("Ctrl + b", "  File Explorer", ":NvimTreeToggle<cr>"),
  button("Tab + ff", "  Find File", ":Telescope find_files <cr>"),
  button("Tab + fg", "  Find Word", ":Telescope live_grep<cr>"),
  button("Tab + ,", "  Config", ":e $MYVIMRC<cr>"),
  button("Tab + ps", "  Reload Plugins", ":PackerClean<cr>:PackerSync<cr>"),
  button("q", "  Quit", ":qa<cr>")
}

local function footer()
    local total_plugins = #vim.tbl_keys(packer_plugins)
    return "Loaded " .. total_plugins .. " plugins  "
end

local heading = {
  type = "text",
  val = "We're miles beyond the sound",
  opts = {
    position = "center",
	hl = "Comment" -- Color of top comment, was "AlphaComment"
  },
}

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "Comment" -- Color of bottom comment

local opts = {
  layout = { -- The layout is like a stack that follows these elements in order
    {type = "padding", val = 1}, -- Padding top
    dashboard.section.header,
    {type = "padding", val = 0}, -- Distance between logo and top comment
    heading,
    {type = "padding", val = 1}, -- Distance between top comment and buttons
    dashboard.section.buttons,
    {type = "padding", val = 0}, -- Distance between buttons and bottom comment
    dashboard.section.footer,
  },
  opts = {
    margin = 5 -- ???
  },
}

alpha.setup(opts)
vim.cmd([[ autocmd FileType alpha setlocal nofoldenable]])
vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  command = "set showtabline=0 laststatus=0 noruler",
})

vim.api.nvim_create_autocmd("FileType", {
  group = "alpha_tabline",
  pattern = "alpha",
  callback = function()
    vim.api.nvim_create_autocmd("BufUnload", {
      group = "alpha_tabline",
      buffer = 0,
      command = "set showtabline=2 ruler laststatus=3",
    })
  end,
})