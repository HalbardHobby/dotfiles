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

" trailing chars
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→

" Basic IDE behavior
set hidden
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undo
set undofile

" Autocomplete behavior
set incsearch
set scrolloff=8
set completeopt=menu,menuone,noinsert,noselect

" Default fuzzyfinding
set path+=**
set wildmenu

set signcolumn=yes
set colorcolumn=80
set showtabline=2

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

" LSP configuration
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'

" Git integration
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'

Plug 'altercation/vim-colors-solarized'
Plug 'gruvbox-community/gruvbox'
Plug 'dylanaraps/wal.vim'

" air line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Setup appereance
set background=dark
colorscheme solarized
let g:airline_theme = 'solarized_flood'
highlight Normal guibg=none ctermbg=NONE

" AirLine configuration

" Enable powerline fonts
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = "\ue0c6"
let g:airline_left_alt_sep = "\ue0c4"
let g:airline_right_sep = "\ue0c7"
let g:airline_right_alt_sep = "\ue0c5"

let g:airline_symbols.branch = "\uf113"

let g:airline#extensions#tabline#enabled = 1
let g:airline#extension#tabline#left_sep = "\ue0c6"
let g:airline#extension#tabline#left_alt_sep = "ue0c4"
let g:airline#extension#tabline#right_sep = "\ue0c7"
let g:airline#extension#tabline#right_alt_sep = "\ue0c5"

let mapleader = " "
nnoremap <leader>ps :lua require'telescope.builtin'.grep_string({ search = vim.fn.input("Search For > ")})<CR>
nnoremap <leader>pc :lua require'telescope.builtin'.commands()<CR>
nnoremap <C-p> :lua require'telescope.builtin'.find_files()<CR>

" Remap for easier clipboard use
nnoremap <leader>pp "+p
nnoremap <leader>yy "+y

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
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprevious<CR>

" Better windows
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

set splitright splitbelow

" LSP Configuration
lua <<EOF
require'gitsigns'.setup()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, bufopts)
end

require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.terraformls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

require'lspconfig'.dockerls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
    }, {
        { name = 'buffer' },
    })
})

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

