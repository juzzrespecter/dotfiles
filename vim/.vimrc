syntax on
set number
set autoindent
set expandtab
set tabstop=4
set softtabstop=4
colorscheme industry

" --- plugins
call plug#begin()
    Plug 'https://github.com/vim-airline/vim-airline'  " --- status bar in Vim
    Plug 'neoclide/coc.nvim'
"    Plug 'https://github.com/fatih/vim-go' " --- Go support
call plug#end()
