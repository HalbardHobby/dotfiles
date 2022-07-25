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

" Add Icon support
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Better file explorer
Plug 'preservim/nerdtree'

" Telescope dependencies
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal.vim'

" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Setup appereance
colorscheme wal
highlight Normal guibg=none ctermbg=NONE

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search For > ")})<CR>
nnoremap <C-p> :lua require'telescope.builtin'.find_files()<CR>

" Remap for easier clipboard use
nnoremap <leader>pp "+p
nnoremap <leader>yy "+y

" Remap for scrolling
nnoremap <C-k> <C-y>
nnoremap <C-j> <C-e>

" NERDtree configuration
nnoremap <C-e> :NERDTreeToggle<CR>

" Disable arrow keys
nnoremap <UP> :echo "Trust the force ⚡"<CR>
nnoremap <DOWN> :echo "Trust the force ⚡"<CR>
nnoremap <LEFT> :echo "Trust the force ⚡"<CR>
nnoremap <RIGHT> :echo "Trust the force ⚡"<CR>

inoremap <UP> <ESC>:echo "Trust the force ⚡"<CR>a
inoremap <DOWN> <ESC>:echo "Trust the force ⚡"<CR>a
inoremap <LEFT> <ESC>:echo "Trust the force ⚡"<CR>a
inoremap <RIGHT> <ESC>:echo "Trust the force ⚡"<CR>a

" Better tabs
nnoremap tt :tabnew<CR>
nnoremap tw :tabclose<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprevious<CR>
nnoremap th :tabfirst<CR>
nnoremap tl :tablast<CR>

" TreeSitter Configuration

lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "cpp", "c_sharp", "css", 
                         "dockerfile", "go", "hcl", "python"},
    auto_install = true,
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
    },
}
EOF
