"----------------------------------------------------------------------------------------------------------------------------o
"      _ ,.,              ,.,             ',:'/¯/`:,                  _             _                                         o
"    '/:::::/`,           /:::/';         /:/_/::::/';'          ,·´/:::::'`:,   ,:´/::::'`:,'                               o
"   /;: :;/:::\         /;:;/:'i‘        /:'     '`:/::;‘       '/  /:::::::::'`·/::/::::::::/'\                              o
"  ,´     `;::';       ,´   'i:'i         ;         ';:';‘       /,·'´ ¯¯'`·;:::/:;·´ ¯ '`·;/:::i                            o
"  i        \::',      ,:    'i:';        |         'i::i      /            '`;':/            \:::';                          o
"  ;         ';::\ .,_';     ';:'i'       ';        ;'::i    ,'               `'              ';:::i°                        o
"  ';         ';::/::::';     ;':;        'i        'i::i'  ,'                                 ;::i‘'                         o
"   \          \/::::;'      i:/'°        ;       'i::;'   ;'       ,^,         ,:^,           'i::;°                        o
"    '\          '`~'´     ,'/            ';       i:/'   'i        ;:::\       ;/   ',         'i:;'                         o
"      \                   /              ';     ;/ °    'i       'i::/  \     /      ;       ;/                             o
"       '`,              ;'                ';    / °     ;      'i:/      `*'´       'i      ;/ °                             o
"          `·.,    ,.·´                      `'´         '`.    ,'                    '.     /                               o
"               ¯                                           `*´                         `'*'´                                 o
"                  __                ,:'/¯/`:,        .·/¯/`:,'         ',:'/¯/`:,             ,.-~·-.,__,.-::^·- .,'   ‘    o
"            ,·:'´/::::/'`;·.,      /:/_/::::/';     /:/_/::::';        /:/_/::::/';'         /:::::::::::::::::::::::::/';   o
"        .:´::::/::::/:::::::`;    /:'     '`:/::;  /·´    `·,::';      /:'     '`:/::;‘     /;:·–– :;:::::_ ;: – .,/::;i'‘  o
"       /:;:· '´ ¯¯'`^·-;::::/'    ;         ';:';  ;         ';:;      ;         ';:';‘    /´          ¯¯           ';::/    o
"      /·´           _   '`;/‘     |         'i::i  i         'i:';°     |         'i::i   ,:                          ,:/   o  
"     'i            ;::::'`;*      ';        ;'::/¯/;        ';:;‘'      ';        ;'::i   ';_,..–-.,_     _    _,.·´‘        o
"      `;           '`;:::::'`:,   'i        i':/_/:';        ;:';°      'i        'i::i'          ,·´'    '`·;'i¯           o  
"        `·,           '`·;:::::';  ;       .´   '`·;       ;:/°         ;       'i::;'            i         'i:i'            o   
"      ,~:-'`·,           `:;::/'  ';      ;·,  '  ,·;      ;/'          ';       i:/'            ';        ';:i'            o  
"     /:::::::::';           ';/   ';    ';/ '`'*'´  ';    ';/'           ';     ;/ °              i        i:/'              o 
"   ,:~·- . -·'´          ,'´        \   /            '\   '/'             ';   / °                 ;      i/                o 
"   '`·,               , ·'´          '`'´             `''´                  `'´                     \   '/'                  o 
"        '`*^·–·^*'´'                                                                                 ¯                      o
"                                                                                                                             o
" ---------------------------------------------------------------------------------------------------------------------------o

syntax on               " ~ enable syntax highlights
set number              " ~ enable numbered lines
set ruler               " ~ shows cursor position
set showmatch           " ~ show matched curly braces
set autoindent          " ~ set automatic indent
set tabstop=4           " ~ set tab spaces to 4
set shiftwidth=4        " ~ more indent config.
set softtabstop=4       " ~ remove spaces as if they were tabs
set expandtab           " ~ set tab to spaces

filetype on
set showmatch
set ignorecase
set smartcase
set ignorecase  " ~ search in file config.

autocmd BufWritePost .vimrc so %    " ~ source vimrc every time is saved

" ~~~ [ pretty things ]
autocmd vimenter * ++nested colorscheme gruvbox
set bg=dark
" ~~~

set wildmenu            " ~ displays command's options menu 
set wildignore=*.docx,*.jpg,*.jpeg,*.png,*.gif,*.pdf,*.mp4,*.mp3

" ~~~ [ plugins (testing) ]
call plug#begin()
    Plug 'https://github.com/vim-airline/vim-airline'   " ~ set status bar in Vim
    Plug 'neoclide/coc.nvim', {'branch': 'release'}     " ~ coc!
    Plug 'https://github.com/fatih/vim-go'              " ~ Go support plugin for vim
    Plug 'preservim/nerdtree'                           " ~ file tree support
    Plug 'morhetz/gruvbox'                              " ~ nice color scheme

    " ~~~ (testing plugs)
    Plug 'junegunn/goyo.vim'
    Plug 'amix/vim-zenroom2'
    Plug 'mileszs/ack.vim'
    Plug 'terryma/vim-multiple-cursors'
call plug#end()
" ~~~

" ~~~ [ NERDTree configuration ]
" ~ start nerdtree with vim and put cursor back in open file window
autocmd VimEnter * NERDTree | wincmd p

" ~ close vim if NERDTree is last window remaining 
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ~ refix windows if a buffer tries to take out NERDTree buffer
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" ~ show hidden files on tree
let NERDTreeShowHidden=1
" ~~~

" ~~~ [ key mappings ]
" ~ NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" ~ Window movement key mappings
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>
" ~~~
