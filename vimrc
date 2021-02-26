
let mapleader=";"

" === Tests ===

" Tabs configuration

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set relativenumber

" === Filetype Use ===

" set filetype
set nobri

" === Fuzzy File Search ===

" No VI compatible
set nocompatible

" Enable syntax and plugins
syntax enable
filetype plugin on

" Enable Subfolder search
set path+=**

" Display matching files on tab complete
set wildmenu

" === File Browsing ===

let g:netrw_banner=0        " disable banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=',\(^\|\s\s\)\zs\.\S\+'

" Snippets



