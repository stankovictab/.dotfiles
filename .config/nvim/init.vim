" Neovim Configuration File "
" ~~~~~~~~~~~~~~~~~~~~~~~~~ "

""""" Custom Shortcuts

let mapleader="\<tab>" " Setting the leader key to Tab instead of the default \
nnoremap <leader>, <cmd>e $MYVIMRC<cr> " Openning the init.vim

" Space + ff, Space + p and Ctrl + p is all the same thing
nnoremap <leader>p <cmd>Telescope find_files hidden=true<cr> 
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr> 
nnoremap <c-p> <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr> " Listing buffers
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <c-right> <cmd>bnext<cr> " Go to next buffer, works with bufferline
nnoremap <c-left> <cmd>bprevious<cr> " Go to previous buffer, works with bufferline
nnoremap <c-s-right> <cmd>BufferLineMoveNext<cr> " Move buffer to the right
nnoremap <c-s-left> <cmd>BufferLineMovePrev<cr> " Move buffer to the right
nnoremap <c-q> <cmd>bdelete<cr> " Delete buffer (and window technically) - c-q by default is visual block mode (which is also c-v)

nnoremap <c-b> :NvimTreeToggle<cr> " Toggling the file explorer both in Normal and Insert Mode
inoremap <c-b> <esc>:NvimTreeToggle<cr>

" Toggling comments with vim-commentary (c-_ is actually Ctrl + /)
nnoremap <c-_> :Commentary<cr> 
vnoremap <c-_> :Commentary<cr>

""""" Vim Settings

let loaded_netrwPlugin = 1 " Disables the builtin and buggy netrw file explorer
set mouse=a " Enable mouse support - enables clicking, highlighting puts you into visual mode, scroll is fixed
" set relativenumber " Line numbers will be relative to the current line
set number " Set absolute line numbering
set ignorecase " Set search to be case insensitive
set splitbelow " On automatic split, split down instead of up (default)
set splitright " On automatic split, split right instead of left (default)
set hidden " Keeps opened buffers (files) in memory, for faster use
set tabstop=4 " Set tabs to be 4 spaces wide
set shiftwidth=4 " Set the width of a newline when indenting to also be 4 spaces wide
" set expandtab " Changes tabs into spaces! (tabstop times)
set clipboard+=unnamedplus " Enables system clipboard use, copy by yanking and paste with Ctrl + Shift + v
set nohlsearch " Disables the highlight of a word after search is done (but then you don't see all of the search results...)
" incsearch is on by default, it searches by every inputed character
set noerrorbells " Removes the stupid ass terminal bell sound
set scrolloff=4 " Number of lines to keep at the cursor when scrolling up or down the file
set signcolumn=yes " Column at the left, useful for linting errors and for the git gutter

if (has("termguicolors"))
	" By default Neovim uses the terminal emulator's colours (cterm), but this allows the use of hex values for colours (gui)
	" This is absolutely necessary if you're using any colorschemes or plugins that use colors
	" There's an if here for tty based (8 colour) terminals
	set termguicolors
endif

""""Plugins (VimPlug)

call plug#begin()

Plug 'glepnir/dashboard-nvim' " Dashboard shown at nvim start without a file
Plug 'andweeb/presence.nvim' " The best Discord rich presence plugin
Plug 'nvim-lualine/lualine.nvim' " A way better status line than Airline
Plug 'kyazdani42/nvim-web-devicons' " Icons (that use a Nerd Font)
Plug 'nvim-lua/plenary.nvim' " Dependency for Telescope
Plug 'nvim-telescope/telescope.nvim' " File browser
Plug 'ap/vim-css-color' " Colours on hexadecimal values, like #33ffbc
Plug 'jiangmiao/auto-pairs' " Automatically close brackets and quotes
Plug 'akinsho/bufferline.nvim', {'tag': 'v2.*'} " Buffer bar at the top
Plug 'kyazdani42/nvim-tree.lua' " File explorer in left sidebar
Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'} " A better terminal than the built in one
Plug 'tpope/vim-commentary' " gc (block) and gcc (line) to comment out code
" Colorschemes
Plug 'rafi/awesome-vim-colorschemes' " A colorscheme collection, including iceberg, nord, onedark, etc
Plug 'tomasiser/vim-code-dark' " Default VSCode dark theme inspired
Plug 'marko-cerovac/material.nvim' " The Bosnian theme
" LSP
Plug 'hrsh7th/nvim-cmp' " Completion engine
Plug 'hrsh7th/cmp-buffer' " Completion engine - Adding buffer (file) sources
Plug 'hrsh7th/cmp-path' " Completion engine - Adding path sources
Plug 'rafamadriz/friendly-snippets' " Snippet collection
Plug 'L3MON4D3/LuaSnip' " LuaSnip snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " Completion engine - LuaSnip snippet engine source

call plug#end()

""""" Lua Plugins Import
" TODO: All of these can be set in a single lua/stankovictab.lua

lua require('stankovictab/presence')
lua require('stankovictab/lualine')
lua require('stankovictab/nvim-web-devicons')
lua require('stankovictab/dashboard')
lua require('stankovictab/bufferline')
lua require('stankovictab/nvim-tree')
lua require('stankovictab/toggleterm')
lua require('stankovictab/material')
lua require('stankovictab/nvim-cmp')

""""" Colorscheme

let g:material_style = "deep ocean" " Setting for the Bosnian theme
colorscheme material

" Toggling transparent background
" If you want to change over to transparency, set this to 1
let t:is_transparent = 0
function! Toggle_transparent_background()                      
  if t:is_transparent == 0                   
    hi Normal guibg=none ctermbg=none " Removes opaque background from the theme
	hi LineNr guibg=none ctermbg=none " Transparent line number gutter
	hi SignColumn guibg=none ctermbg=none " Transparent sign column gutter
    let t:is_transparent = 1
  else
    hi Normal guibg=none ctermbg=none
	set background=dark
    let t:is_transparent = 0                        
  endif
endfunction
if t:is_transparent == 1
	:call Toggle_transparent_background()
	:call Toggle_transparent_background()
endif
nnoremap <leader>t :call Toggle_transparent_background()<cr>
