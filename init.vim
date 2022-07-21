set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=
set relativenumber
set number
set hidden

set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile

set incsearch
set scrolloff=8
set completeopt=menuone,noinsert,noselect

set signcolumn=yes
set colorcolumn=84

set cmdheight=2
set updatetime=50

call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none ctermbg=NONE

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search For > ")})<CR>

