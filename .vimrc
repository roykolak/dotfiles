" This is vim, not vi
set nocompatible

filetype off

" Ready vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Active bundles
Bundle 'tpope/vim-fugitive'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/jslint.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'groenewege/vim-less'
Bundle 'othree/html5-syntax.vim'
Bundle 'othree/coffee-check.vim'

" How many lines of history to remember
set history=700

" Auto read when a file is changed from the outside
set autoread

" Wild Menus
set wildmenu

" Ignore case when searching
set ignorecase

" Ignore case only when search string is lowercase
set smartcase

" Match search as you type
set incsearch

" auto indent when inserting a new line
set autoindent

" Quickly jump to matching bracket
set showmatch
set mat=2

" Syntax highlighting
syntax on

" Tab configuration
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab
filetype plugin indent on

" Auto indent
set ai

" Smart indent
set si

" Wrap lines
set wrap

" Line numbering
set number

" Enable 256 colors
set t_Co=256

" Set color scheme
colorscheme wombat256

" Highlight search term
set hls

" Highlight current line
highlight CursorLine ctermbg=238
set cursorline

" Fancy symbols for powerline
let g:Powerline_symbols = 'fancy'

" Create private gists by default
let g:gist_private = 1

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Lines to the cursors - when moving vertical..
set so=7

" Ctrl P mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Infinite search range for Ctrl P
let g:ctrlp_max_files = 0

" Ignore dumb files
set wildignore+=.git,tmp,log,*.png,*.jpg,*.jpeg,*.gif
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard']

" For jslint
let $JS_CMD='node'

" Automatically remove whitespace
autocmd BufWritePre * :%s/\s\+$//e

" To detect if in vim sub shell
let $UNDER_VIM='Yes, probably.'

" Show more results for ctrlP
let g:ctrlp_max_height = 25

" Adjust keycode timeout length
set ttimeoutlen=100
