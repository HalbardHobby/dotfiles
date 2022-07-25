" Basic Setup
set nocompatible
syntax enable
filetype plugin on
set encoding=UTF-8

" Tab Behavior
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Some Customization
set exrc
set guicursor=
set relativenumber
set number

" Basic IDE behavior
set hidden
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile

" Autocomplete behavior
set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect

" Default fuzzyfinding
set path+=**
set wildmenu

set signcolumn=yes
set colorcolumn=80

set cmdheight=2
set updatetime=50

call plug#begin('~/.local/share/nvim/plugged')
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

" Telescope dependencies
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

Plug 'gruvbox-community/gruvbox'
call plug#end()

" Setup appereance
colorscheme gruvbox
highlight Normal guibg=none ctermbg=NONE

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search For > ")})<CR>
nnoremap <C-p> :lua require'telescope.builtin'.find_files()<CR>

" Remap for easier clipboard use
nnoremap <leader>pp "+p
nnoremap <leader>yy "+y

" NERDtree configuration
nnoremap <C-e> :NERDTreeToggle<CR>

