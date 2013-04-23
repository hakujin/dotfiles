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
set guioptions=
set guifont=Courier\ New\ 10

filetype plugin on
filetype indent on
syntax on

colorscheme jellybeans

let g:SuperTabDefaultCompletionType = "context"

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <silent> <leader><space> :nohls<cr>
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader>t :TagbarOpenAutoClose<CR>
