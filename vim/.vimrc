call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'https://github.com/adelarsq/vim-matchit'
Plug 'itchyny/lightline.vim'
Plug 'hashivim/vim-terraform'

call plug#end()

syntax on
set re=0
filetype plugin indent on

" Information on the following setting can be found with
" :help set
set encoding=utf-8
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

" Configure cursor to block, bar in insert mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

" 2-space tabs for js/ts/react/graphql
autocmd FileType javascript setlocal ts=2 sts=2 sw=2
autocmd FileType javascriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType typescript setlocal ts=2 sts=2 sw=2
autocmd FileType typescriptreact setlocal ts=2 sts=2 sw=2
autocmd FileType graphql setlocal ts=2 sts=2 sw=2

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

noremap <leader>y "*y

map m %

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

" <leader>c to close a buffer
nmap <leader>c :bd<CR>

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
    call setline(1,             "namespace package {")
    call append(line(".")    ,  "")
    call append(line(".") + 1,  "")
    call append(line(".") + 2,  "")
    call append(line(".") + 3,  "}  // close package namespace")
endfunction

function HeaderCodeSkeleton()
    let IncludeGuard = "INCLUDED_".toupper(expand("%:t:r"))
    call setline(1,             "#ifndef ".IncludeGuard)
    call append(line(".")    ,  "#define ".IncludeGuard)
    call append(line(".") + 1,  "")
    call append(line(".") + 2,  "namespace package {")
    call append(line(".") + 3,  "")
    call append(line(".") + 4, "")
    call append(line(".") + 5, "")
    call append(line(".") + 6, "}  // close package namespace")
    call append(line(".") + 7, "")
    call append(line(".") + 8, "#endif")
endfunction

if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
endif

""""""""""""""""""""""""
" coc configuration
""""""""""""""""""""""""

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-eslint', 'coc-go' ]

" Improve menu color
highlight Pmenu ctermbg=black

" Improve highlight color
highlight CursorColumn term=reverse cterm=underline gui=underline ctermfg=141 guifg=#ae81ff

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>-d to show documentation in preview window.
nnoremap <silent> <leader>d :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
set updatetime=100

" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f :CocCommand eslint.executeAutofix<cr>
nmap <leader>f :CocCommand eslint.executeAutofix<cr>

autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')


autocmd FileType h,cpp map <C-f> :py3f ~/clang-format.py<cr>
autocmd FileType h,cpp imap <C-f> <c-o>:py3f ~/clang-format.py<cr>

function! Formatonsave()
    let l:formatdiff = 1
    py3f ~/clang-format.py
endfunction
autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
