set nocompatible
call pathogen#infect()

set shiftwidth=4
set tabstop=4
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak
set nobackup
set noswapfile
set nowrap
set sidescroll=1
set scrolloff=3
set sidescrolloff=10
set autoread
set autowrite
set title
set backspace=eol,start,indent
set wildmode=list:longest
set wildmenu
set ruler
set relativenumber
set ignorecase
set smartcase
set hlsearch
set incsearch
set expandtab
set laststatus=2
set shortmess=a
set showmatch
set showcmd
set smarttab
set autoindent
set smartindent
set mouse=a
set gdefault
set noerrorbells
set visualbell
set t_vb=
set cursorline
set lazyredraw
set ttyfast
set textwidth=80
set colorcolumn=+1
set clipboard=unnamedplus
set encoding=utf-8
set t_Co=256
set background=dark

filetype plugin on
filetype indent on
syntax on
colorscheme solarized

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

let mapleader = "\<space>"
let g:necoghc_enable_detailed_browse = 1
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
let g:hasksyn_dedent_after_return = 1
let g:hasksyn_dedent_after_catchall_case = 1
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:ycm_filetype_blacklist = {'unite':1}

inoremap <C-h> <left>
inoremap <C-l> <right>

nnoremap K :q<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap H ^
nnoremap L $
nnoremap / /\v
vnoremap / /\v
nnoremap <space> <nop>
nnoremap <down> :bprev<cr>
nnoremap <up> :bnext<cr>
nnoremap <left> :tabprev<cr>
nnoremap <right> :tabnext<cr>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <bar> <C-w>v<C-w>l
nnoremap _ <C-w>s<C-w>j
nnoremap <cr> :set hlsearch! hlsearch?<cr>
nnoremap <silent> <leader>f :Unite file_rec/async<cr>
nnoremap <silent> <leader>/ :Unite grep:.<cr>
nnoremap <silent> <leader>y :Unite history/yank<cr>
nnoremap <silent> <leader>b :Unite -quick-match buffer<cr>
nnoremap <silent> <leader>gc :Gcommit<cr>
nnoremap <silent> <leader>gl :Glog<cr>
nnoremap <silent> <leader>gp :Git push<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>ht :GhcModType<cr>
nnoremap <silent> <leader>htc :GhcModTypeClear<cr>

au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType haskell setlocal omnifunc=necoghc#omnifunc
au FileType unite call s:unite_settings()
au BufWritePre <buffer> call StripTrailingWhitespace()
au BufWritePost *.hs GhcModCheckAndLintAsync
au WinLeave * set nocursorline
au WinEnter * set cursorline
au VimResized * :wincmd =
