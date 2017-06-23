"Created by Chris Nixon
" 6.22.2017
" http://devnix.io




" Plugin manager config (Vundle)
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

" Start plugins here
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rakr/vim-one'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline-themes'


call vundle#end()
filetype plugin indent on
" Stop Plugins here



"
"UI Config
"

set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
filetype indent on  " load filetype-specific indent files
set wildmenu  " visual autocomplete for command menu
set lazyredraw " redraw only when we need to
set showmatch " highlight matching [{()}]

" Spaces & Tabs
set tabstop=4 " number of visual spaces per TAB
set softtabstop=4 " number of spaced in tab when editing
set expandtab  " makes tabs spaces

" Colors and syntax
syntax on
let g:arline_theme='one'
colorscheme one
set background=dark " for dark version
"set background=light " for light version

" Searching
set incsearch  " search as characters are entered
set hlsearch  " highlights matches

" turn off search highlight 
nnoremap <leader><space> :noh1search<CR>

" Folding
set foldenable  " enable folding
set foldlevelstart=10 " openmostfoldsbydefault
set foldnestmax=10  " 10 nested fold max
set foldmethod=indent   "fold based on indent level












