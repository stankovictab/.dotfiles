" Neovim Configuration File "
" ~~~~~~~~~~~~~~~~~~~~~~~~~ "

" TODO: Enter, Space and Backspace need a new use in Normal Mode
" TODO: Fix the hex colors, you can't read them most of the time, make it just
" a square next to the value or something, the font gets screwed up

""""" Custom Shortcuts
let mapleader="\<tab>" " Setting the leader key to Tab instead of the default \
nnoremap <leader>, <cmd>e $MYVIMRC<cr> " Opening the init.vim

" Space + ff, Space + p and Ctrl + p is all the same thing
" If you want to search hidden files, add hidden=true
nnoremap <leader>p <cmd>Telescope find_files<cr> 
nnoremap <leader>ff <cmd>Telescope find_files<cr> 
nnoremap <c-p> <cmd>Telescope find_files<cr> 
nnoremap <leader>fg <cmd>Telescope live_grep<cr> " TODO: Very useful - Live Grep is for searching inside of files
nnoremap <leader>fb <cmd>Telescope buffers<cr> " Listing buffers

nnoremap <c-PageDown> <cmd>bnext<cr> " Go to next buffer
nnoremap <c-PageUp> <cmd>bprevious<cr> " Go to previous buffer
nnoremap <leader><right> <cmd>bnext<cr> " Go to next buffer, for tty
nnoremap <leader><left> <cmd>bprevious<cr> " Go to previous buffer, for tty

nnoremap <c-s-right> <cmd>BufferLineMoveNext<cr> " Move buffer to the right
nnoremap <c-s-left> <cmd>BufferLineMovePrev<cr> " Move buffer to the right
nnoremap <c-q> <cmd>bdelete<cr> " Delete buffer (and window technically) - c-q by default is visual block mode (which is also c-v)

nnoremap <c-b> :NvimTreeToggle<cr> " Toggling the file explorer both in Normal and Insert Mode
inoremap <c-b> <esc>:NvimTreeToggle<cr>

" Toggling comments with vim-commentary (c-_ is actually Ctrl + /)
nnoremap <c-_> :Commentary<cr> 
vnoremap <c-_> :Commentary<cr>

inoremap <c-s> <esc><cmd>w<cr> " I'm very proud of this line, wrote it on a whim and it works first try

set whichwrap+=<,>,[,] " This allows the arrow keys to go to the previous and next line

""""" Vim Settings

let loaded_netrwPlugin = 1 " Disables the builtin and buggy netrw file explorer
set mouse=a " Enable mouse support - enables clicking, highlighting puts you into visual mode, scroll is fixed
" set relativenumber " Line numbers will be relative to the current line
set number " Set absolute line numbering

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set cursorline " Set highlight of the current line and line number
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
" set signcolumn=yes " Column at the left, useful for linting errors and for the git gutter - automatically opens when needed by default
set updatetime=300 " The default update time is 4000ms (for things like vim-gitgutter), which is too long
set linebreak " Word wrap / line break on word, not on character

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
Plug 'norcalli/nvim-colorizer.lua' " Colours on hexadecimal values, like #123123, changed instead of 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs' " Automatically close brackets and quotes
Plug 'akinsho/bufferline.nvim', {'tag': 'v2.*'} " Buffer bar at the top
Plug 'kyazdani42/nvim-tree.lua' " File explorer in left sidebar
Plug 'akinsho/toggleterm.nvim', {'tag': 'v1.*'} " A better terminal than the built in one
Plug 'tpope/vim-commentary' " gc (block) and gcc (line) to comment out code
Plug 'airblade/vim-gitgutter' " Git gutter integration
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Better syntax highlight
Plug 'lukas-reineke/indent-blankline.nvim' " Vertical lines on indentation, made off of Yggroot/indentLine
Plug 'yamatsum/nvim-cursorline' " Includes cursorline and cursorword, the latter of which highlights all occurances of the selected word
Plug 'petertriho/nvim-scrollbar' " Scrollbar so that I don't get lost
" Colorschemes
Plug 'rafi/awesome-vim-colorschemes' " A colorscheme collection, including iceberg, nord, onedark, etc
Plug 'tomasiser/vim-code-dark' " Default VSCode dark theme inspired
Plug 'marko-cerovac/material.nvim' " The Bosnian theme
" CMP & LSP
Plug 'hrsh7th/nvim-cmp' " Completion engine
Plug 'hrsh7th/cmp-buffer' " Completion engine - Adding buffer (file) sources
Plug 'hrsh7th/cmp-path' " Completion engine - Adding path sources
Plug 'rafamadriz/friendly-snippets' " Snippet collection
Plug 'L3MON4D3/LuaSnip' " LuaSnip snippet engine
Plug 'saadparwaiz1/cmp_luasnip' " Completion engine - LuaSnip snippet engine sources
Plug 'hrsh7th/cmp-nvim-lsp' " Completion engine - LSP sources
Plug 'neovim/nvim-lspconfig' " LSP - Configuration plugin
Plug 'williamboman/nvim-lsp-installer' " LSP - Language Server installer

call plug#end()

""""" Lua Plugins Import
" NOTE: All of these can be set in a single lua/stankovictab.lua

lua require('stankovictab/dashboard-nvim')
lua require('stankovictab/presence')
lua require('stankovictab/lualine')
lua require('stankovictab/nvim-web-devicons')
lua require('stankovictab/nvim-colorizer')
lua require('stankovictab/bufferline')
lua require('stankovictab/nvim-tree')
lua require('stankovictab/toggleterm')
lua require('stankovictab/treesitter')
lua require('stankovictab/indent-blankline')
lua require('stankovictab/nvim-cursorline')
lua require('stankovictab/material')
lua require('stankovictab/nvim-cmp')
lua require('stankovictab/lsp')
lua require('stankovictab/nvim-scrollbar')

""""" Colorscheme

colorscheme material

" Toggling transparent background
" If you want to change over to transparency, set this to 1
" TODO: Turning back to opaque screws up nvim-cursorline and nvim-colorizer, I
" think this is a known bug with nvim_set_hl(), see issue #18160 in neovim/neovim
" let t:is_transparent = 1

hi Normal guibg=none ctermbg=none " Removes opaque background from the theme
hi LineNr guibg=none ctermbg=none " Transparent line number gutter
hi SignColumn guibg=none ctermbg=none " Transparent sign column gutter

" function! Toggle_transparent_background()                      
"   if t:is_transparent == 0                   
"     hi Normal guibg=none ctermbg=none " Removes opaque background from the theme
" 	hi LineNr guibg=none ctermbg=none " Transparent line number gutter
" 	hi SignColumn guibg=none ctermbg=none " Transparent sign column gutter
"     let t:is_transparent = 1
"   else
" 	colorscheme material
"     " hi Normal guibg=none ctermbg=none
" 	" set background=dark " ?
"     let t:is_transparent = 0                        
"   endif
" endfunction
" nnoremap <leader>t :call Toggle_transparent_background()<cr>
