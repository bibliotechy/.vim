" Allow Vim-only settings even if they break vi keybindings.
set nocompatible

filetype off "Disable filetype detection; required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-vividchalk'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/L9'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()
filetype indent plugin on " enable loading indent file for filetypes


"General settings
set incsearch               "Find as you type
set ignorecase              "Ignore case in search
set scrolloff=2             "Number of lines to keep above/below cursor
set smartcase               "Only ignore case when all letters are lowercase
set number                  "Show line numbers
set pastetoggle=<F2>        "Toggle paste mode
set fileformats=unix        "Use Unix line endings
set smartindent             "Smart autoindenting on new line
set smarttab                "Respect space/tab settings
set expandtab               "Don't use actual tab character"
set history=300             "Number of commands to remember
set showmode                "Show whether in Visual, Replace, or Insert Mode
set showmatch               "Show matching brackets/parentheses
set backspace=2             "Use standard backspace behavior
set hlsearch                "Highlight matches in search
set ruler                   "Show line and column number
set linebreak               "Break lines when appropriate


syntax enable
let g:syntastic_ruby_checkers=['mri', 'rubocop']

set t_Co=256
"Enable syntax highlighting
if &t_Co > 1
  syntax enable
endif

autocmd FileType html   setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby   setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=8 softtabstop=4 


"Custom key mappings

map <S-u> :redo<cr>
map <C-n> :tabn<cr>
map <C-p> :tabp<cr>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-l> <C-w-l>

" Leader here can be set to athing.  The default is \
map <leader>n :NERDTreeToggle<CR>

set background=dark
colorscheme vividchalk
if $SSH_CONNECTION
  colorscheme vividchalk
  set background=dark
endif


set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%{fugitive#statusline()}

if filereadable("tags")
  set tags=tags
endif


