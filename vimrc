"  _               _              _
" | |__   __ _ ___(_) ___  __   _(_)_ __ ___
" | '_ \ / _` / __| |/ __| \ \ / / | '_ ` _ \
" | |_) | (_| \__ \ | (__   \ V /| | | | | | |
" |_.__/ \__,_|___/_|\___|   \_/ |_|_| |_| |_|

" Automatically download Plugged if not installed
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins using Plugged
call plug#begin('~/.vim/plugged')

" fzf
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

" surround
    Plug 'tpope/vim-surround'

" commentary
    Plug 'tpope/vim-commentary'

" autoclose
    Plug 'Townk/vim-autoclose'

call plug#end()

" Basics
    let mapleader = " "
    inoremap jk <ESC>

    set number
    set relativenumber
    set ignorecase
    set smartcase

    set nocompatible
    set encoding=utf-8
    set showcmd

    syntax on
    filetype plugin on
    filetype indent on

    set wrap
    set redrawtime=10000
    set lazyredraw
    set nolist

    set wildmenu
    set wildmode=longest:full,full

" Undo Directory
    set hidden
    set noswapfile
    set nobackup
    set undodir=~/.vim/undodir
    set undofile

" Tabs
    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent

" Highlight searches and <Leader><Leader> to unhighlight
    set incsearch
    set hlsearch
    nnoremap <silent> <leader><leader> :nohl<CR><C-l>

"Disable auto-commenting
    autocmd FileType * setlocal formatoptions-=c formatoptions-=o

" Remove trailing white space on save
    autocmd BufWritePre * %s/\s\+$//e

" Terminal
    map <Leader>t :term<CR>:setlocal nonumber norelativenumber<CR>

" open folds
    nnoremap <CR> za

" increment number
    nnoremap <C-p> <C-a>

" toggle numbers
    nmap <silent> <leader>n :set invnumber<CR>:set invrelativenumber<CR>

" toggle spell
    nnoremap <silent> <leader>s :set invspell spelllang=en_us<cr>

" yank to end of line
    nnoremap Y y$

" Reselect visual after idents
    vnoremap < <gv
    vnoremap > >gv

" undo breakpoints
    inoremap , ,<c-g>u
    inoremap . .<c-g>u
    inoremap ! !<c-g>u
    inoremap ? ?<c-g>u

" moving text
    nnoremap <C-j> :m .+1<CR>==
    nnoremap <C-k> :m .-2<CR>==
    vnoremap <C-j> :m '>+1<CR>gv=gv
    vnoremap <C-k> :m '<-2<CR>gv=gv

" Fix splits
    set splitbelow splitright

" Vertical Split
    nnoremap <silent> <leader>f :vnew<CR>

" Horizontal Split
    nnoremap <silent> <leader>h :new<CR>

" fzf
    map <C-g> :Files<CR>
    map <C-f> :BLines<CR>

    if has('nvim')
        let g:fzf_layout = { 'up': '~90%', 'window': { 'width': 0.8, 'height': 0.8, 'yoffset':0.5, 'xoffset': 0.5, 'highlight': 'Todo' } }
    endif

    let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
    let $FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

" commentary
    nnoremap <silent> <C-a> :Commentary<CR>
    vnoremap <silent> <C-a> :Commentary<CR>
