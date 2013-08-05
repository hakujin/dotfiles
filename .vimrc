set nocompatible

call pathogen#infect()

function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfunction

function! StripTrailingWhitespace()
    call Preserve("%s/\\s\\+$//e")
endfunction

function! s:unite_settings()
    nmap <buffer> <esc> <plug>(unite_exit)
endfunction

set shiftwidth=4
set tabstop=4
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set nobackup
set noswapfile
set nowrap
set sidescroll=1
set sidescrolloff=10
set scrolloff=3
set autoread
set title
set wildmenu
set wildmode=list:longest
set ruler
set relativenumber
set ignorecase
set smartcase
set hlsearch
set incsearch
set noerrorbells
set expandtab
set laststatus=2
set shortmess=a
set cursorline
set showmatch
set showcmd
set smarttab
set autoindent
set smartindent
set mouse=a
set gdefault
set colorcolumn=81
set clipboard=unnamedplus
set encoding=utf-8
set t_Co=256
set background=dark
colorscheme solarized

filetype plugin on
filetype indent on
syntax on

let mapleader = "\<space>"
let g:necoghc_enable_detailed_browse = 1
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:hasksyn_dedent_after_return = 1
let g:hasksyn_dedent_after_catchall_case = 1
let g:UltiSnipsExpandTrigger="<cr>"

inoremap <C-h> <left>
inoremap <C-l> <right>

nnoremap <space> <nop>
nnoremap <down> :bprev<cr>
nnoremap <up> :bnext<cr>
nnoremap <left> :tabprev<cr>
nnoremap <right> :tabnext<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <silent> <leader>f :Unite file_rec/async<cr>
nnoremap <silent> <leader>/ :Unite grep:.<cr>
nnoremap <silent> <leader>y :Unite history/yank<cr>
nnoremap <silent> <leader>b :Unite -quick-match buffer<cr>
nnoremap <silent> <cr> :set hlsearch! hlsearch?<cr>
nnoremap <silent> <leader>v <C-w>v<C-w>l
nnoremap <silent> <leader>s <C-w>s

au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType haskell setlocal omnifunc=necoghc#omnifunc
au BufWritePre <buffer> call StripTrailingWhitespace()
au FileType unite call s:unite_settings()
