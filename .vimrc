" This is vim, not vi
set nocompatible

filetype off

" Ready vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Active bundles
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'ervandew/supertab'
Bundle 'mattn/gist-vim'
Bundle 'wincent/Command-T'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/jslint.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tomtom/quickfixsigns_vim'
Bundle 'groenewege/vim-less'
Bundle 'othree/html5-syntax.vim'

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

" Mappings
map <F3> <ESC>:NERDTreeToggle<CR>
map ? <ESC>:set hls!<CR>

" Bigger search range for command-t
let g:CommandTMaxFiles=30000

" Ignore dumb files for command-t
set wildignore+=.git,tmp,log,*.png,*.jpg,*.jpeg,*.gif

" For jslint
let $JS_CMD='node'

" Automatically remove whitespace
autocmd BufWritePre * :%s/\s\+$//e
