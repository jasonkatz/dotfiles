syntax on
filetype plugin indent on

" Information on the following setting can be found with
" :help set
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4    " This is the level of autoindent, adjust to taste
set ruler
set number
set backspace=indent,eol,start
set mouse=a
set cursorline
set autochdir

nmap \l :setlocal number!<CR>
nmap \p :set paste!<CR>

" Move up/down lines on the screen rather than in the file
nmap j gj
nmap k gk

" Search options
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>

" Switch between buffered files quickly
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" For git commits, wrap at 72 characters
au FileType gitcommit set tw=72

colorscheme monokai

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

execute pathogen#infect()
