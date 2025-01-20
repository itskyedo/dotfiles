" ╔════════════════════════════════════════════════════════════════════════════════════╗
" ║                                    USER OPTIONS                                    ║
" ╚════════════════════════════════════════════════════════════════════════════════════╝

syntax on
filetype plugin indent on

set undofile
set history=10000
set hidden
set sessionoptions=blank,buffers,curdir,folds,help,globals,tabpages,winsize,terminal
set mouse=a

set ruler
set wildmenu
set number
set relativenumber
set cursorline
set signcolumn=yes
set showtabline=2

set ignorecase
set smartcase
set hlsearch
set incsearch

set wrap
set breakindent
set tabstop=2
set shiftwidth=0
set autoindent
set expandtab

set matchpairs=(:),{:},[:],<:>

set directory=$HOME/.local/state/vim/swap//
set backupdir=$HOME/.local/state/vim/backup//
set undodir=$HOME/.local/state/vim/undo//

" Conditionally change cursor
" Source: https://stackoverflow.com/a/70135079
let &t_SI.="\e[6 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[2 q" "EI = NORMAL mode (ELSE)

" Removes cursor change delay
" Source: https://stackoverflow.com/a/58042714
set ttimeout
set ttimeoutlen=1
set ttyfast

" Prevents redrawtime error
" Source: https://github.com/prabirshrestha/vim-lsp/issues/786 
set re=0

" Show search line count
set shortmess-=S

" ╔════════════════════════════════════════════════════════════════════════════════════╗
" ║                                    USER KEYMAPS                                    ║
" ╚════════════════════════════════════════════════════════════════════════════════════╝

nnoremap <esc> :noh<cr><esc>

nnoremap [b :bprevious<cr>
nnoremap ]b :bnext<cr>
nnoremap [B :bfirst<cr>
nnoremap [B :blast<cr>
nnoremap [t :tabprevious<cr>
nnoremap ]t :tabnext<cr>
nnoremap [T :tabfirst<cr>
nnoremap [T :tablast<cr>

" ╔════════════════════════════════════════════════════════════════════════════════════╗
" ║                                    USER COMMANDS                                   ║
" ╚════════════════════════════════════════════════════════════════════════════════════╝

command Source :source $MYVIMRC

if !isdirectory($HOME.'/.local/state/vim/backup')
    call mkdir($HOME.'/.local/state/vim/backup', 'p')
endif
if !isdirectory($HOME.'/.local/state/vim/swap')
    call mkdir($HOME.'/.local/state/vim/swap', 'p')
endif
if !isdirectory($HOME.'/.local/state/vim/undo')
    call mkdir($HOME.'/.local/state/vim/undo', 'p')
endif

" ╔════════════════════════════════════════════════════════════════════════════════════╗
" ║                                    COLORSCHEME                                     ║
" ╚════════════════════════════════════════════════════════════════════════════════════╝

set termguicolors
set background=dark
colorscheme wildcharm

hi TabLine guifg=#8a8a8a guibg=NONE
hi TabLineSel cterm=bold gui=bold guifg=#000000 guibg=#56c3f9
hi! link TabLineFill TabLine
