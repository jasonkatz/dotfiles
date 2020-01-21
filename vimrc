syntax on
filetype plugin indent on

" Add toolkit vimfiles to the runtimepath
let &rtp.=','."$HOME/toolkit/vimfiles"

" Information on the following setting can be found with
" :help set
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4    " This is the level of autoindent, adjust to taste
set ruler
set number
set backspace=2
set mouse=a
set cursorline
set autochdir
set laststatus=2
set numberwidth=5

"
" From Craig's .vimrc
"
set wildmenu
set so=7

let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w<CR>

inoremap lkj <ESC>:w<CR>

set lazyredraw

set showmatch
set mat=2

"
" End of Craig's stuff
"

nmap \l :setlocal number!<CR>
nmap \p :set paste!<CR>

" Move up/down lines on the screen rather than in the file
nmap j gj
nmap k gk
nmap J <C-e>
nmap K <C-y>
nmap B zb
nmap T zt

" Search options
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

vnoremap <C-c> "*y

" Switch between buffered files quickly
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>
nmap <C-k> :e %<.cpp<CR>
nmap <C-h> :e %<.h<CR>

inoremap kj <ESC>
inoremap Kj <ESC>
inoremap kJ <ESC>
inoremap KJ <ESC>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

au FileType gitcommit set tw=72

colorscheme monokai

" Set syntax for ypp files
autocmd BufNewFile,BufRead *.ypp set syntax=yacc

" Automatically generate code skeleton
autocmd BufNewFile *.cpp exec ":call CppCodeSkeleton()"
autocmd BufNewFile *.h exec ":call HeaderCodeSkeleton()"

function CppCodeSkeleton()
    call setline(1,             "/************************************************")
    call append(line(".")    ,  "***File name: ".expand("%:t"))
    call append(line(".") + 1,  "***Author: Jason Katz (jkatz94@gmail.com)")
    call append(line(".") + 2,  "***Create time: ".strftime("%c"))
    call append(line(".") + 3,  "*************************************************/")
    call append(line(".") + 4,  "")
    call append(line(".") + 5,  "namespace package {")
    call append(line(".") + 6,  "")
    call append(line(".") + 7,  "")
    call append(line(".") + 8,  "")
    call append(line(".") + 9,  "}  // close package namespace")
endfunction

function HeaderCodeSkeleton()
    call setline(1,             "/************************************************")
    call append(line(".")    ,  "***File name: ".expand("%:t"))
    call append(line(".") + 1,  "***Author: Jason Katz (jkatz94@gmail.com)")
    call append(line(".") + 2,  "***Create time: ".strftime("%c"))
    call append(line(".") + 3,  "*************************************************/")
    call append(line(".") + 4,  "")
    let IncludeGuard = "INCLUDED_".toupper(expand("%:t:r"))
    call append(line(".") + 5,  "#ifndef ".IncludeGuard)
    call append(line(".") + 6,  "#define ".IncludeGuard)
    call append(line(".") + 7,  "")
    call append(line(".") + 8,  "namespace package {")
    call append(line(".") + 9,  "")
    call append(line(".") + 10, "")
    call append(line(".") + 11, "")
    call append(line(".") + 12, "}  // close package namespace")
    call append(line(".") + 13, "")
    call append(line(".") + 14, "#endif")
endfunction

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif
