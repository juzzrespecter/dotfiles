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
set autoindent          " ~ set autotamic indent
set expandtab           " ~ set tab to spaces
set tabstop=4           " ~ set tab spaces to 4
set softtabstop=4       " ~ remove spaces as if they were tabs

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
" ~~~

" ~~~ [ key mappings ]
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFrind<CR>
