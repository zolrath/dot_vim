" =======================================
" Who: Matt Furden @zolrath (based off of @mutewinter's config)
" What: vimrc for Ruby/Rails and Clojure
" Version: 1.0
" =======================================

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

filetype plugin indent on  " Automatically detect file types. (must turn on after Vundle)

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
 let mapleader=","

" ----------------------------------------
" Vundle
" ----------------------------------------

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" ---------------
" Plugin Bundles
" ---------------

" Navigation
Bundle 'ZoomWin'
" This fork is required due to remapping ; to :
Bundle 'christoomey/vim-space'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'corntrace/bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'xolox/vim-easytags'
Bundle 'timgreen/vim-tagbar'
" UI Additions
Bundle 'mutewinter/vim-indent-guides'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'Rykka/ColorV'
Bundle 'nanotech/jellybeans.vim'
Bundle 'altercation/vim-colors-solarized'
" Commands
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-unimpaired'
Bundle 'visualrepeat'
Bundle 'godlygeek/tabular'
Bundle 'mileszs/ack.vim'
Bundle 'gmarik/sudo-gui.vim'
" Automatic Helpers
Bundle 'IndexedSearch'
Bundle 'xolox/vim-session'
Bundle 'Raimondi/delimitMate'
Bundle 'scrooloose/syntastic'
Bundle 'ervandew/supertab'
Bundle 'gregsexton/MatchTag'
Bundle 'Shougo/neocomplcache'
Bundle 'honza/snipmate-snippets'
Bundle 'rson/vim-conque'
Bundle 'zolrath/vim-ruby-conque'
" Language Additions
"   Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-haml'
Bundle 'bbommarito/vim-slim'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-cucumber'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'YankRing.vim'
"   Clojure
" Not currently working in Clojure.
"Bundle 'emezeske/paredit.vim'
"Bundle 'VimClojure'
"   JavaScript
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'leshill/vim-json'
Bundle 'itspriddle/vim-jquery'
"   Misc
Bundle 'tpope/vim-repeat'
Bundle 'mutewinter/nginx.vim'
Bundle 'tpope/vim-markdown'
Bundle 'mattn/gist-vim'
Bundle 'rgarver/Kwbd.vim'
" MatchIt
Bundle 'matchit.zip'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'austintaylor/vim-indentobject'

" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Consolas:h10
  set guioptions-=T " Toolbar
  set guioptions-=m " Menubar

  " Set height and width on Windows
  set lines=60
  set columns=120

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Inconsola-dz font for Powerline
  " From: https://github.com/Lokaltog/vim-powerline/wiki/Patched-fonts
  set guifont=Inconsola-dz\ for\ Powerline:h12

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
endif

" ----------------------------------------
" Regular Vim Configuration (No Plugins Needed)
" ----------------------------------------

" ---------------
" Color
" ---------------
"set background=dark
"colorscheme jellybeans

"" Solarized color options for iTerm2
let g:solarized_termcolors=16
syntax enable
set background=dark
colorscheme solarized

" Set Indent Guides plugin colors for Solarized
"let g:indent_guides_auto_colors = 0
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size  = 1
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=12

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" --------------
"  Undo
" --------------
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

" ---------------
" UI
" ---------------
set ruler  " Ruler on
set nu  " Line numbers on
set nowrap  " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=2
set encoding=utf-8

" ---------------
" Behaviors
" ---------------
syntax enable
set autoread           " Automatically reload changes if detected
set wildmenu           " Turn on WiLd menu
set hidden             " Change buffer - without saving
set history=768        " Number of things to remember in history.
set cf                 " Enable error files & error jumping.
set clipboard+=unnamed " Yanks go on clipboard instead.
set autowrite          " Writes on make/shell commands
set timeoutlen=350     " Time to wait for a command (after leader for example)
set foldlevelstart=99  " Remove folds
set formatoptions=crql

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2 " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase " Non-case sensitive search
set incsearch
set hlsearch
set wildignore+=*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache
nnoremap <esc> :noh<return><esc>

" ---------------
" Visual
" ---------------
set showmatch  " Show matching brackets.
set matchtime=2 " How many tenths of a second to blink

" ---------------
" Sounds
" ---------------
set noerrorbells
set novisualbell
set t_vb=

" ---------------
" Mouse
" ---------------
set mousehide  " Hide mouse after chars typed
set mouse=a  " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  " No formatting on o key newlines
  autocmd BufNewFile,BufEnter * set formatoptions-=o

  " No more complaining about untitled documents
  autocmd FocusLost silent! :wa

  " When editing a file, always jump to the last cursor position.
  " This must be after the uncompress commands.
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line ("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
end

" ---------------
" Fix pasting into Terminal from System Clipboard
" ---------------
if &term =~ "xterm.*"
  let &t_ti = &t_ti . "\e[?2004h"
  let &t_te = "\e[?2004l" . &t_te
  function XTermPasteBegin(ret)
    set pastetoggle=<Esc>[201~
    set paste
    return a:ret
  endfunction
  map <expr> <Esc>[200~ XTermPasteBegin("i")
  imap <expr> <Esc>[200~ XTermPasteBegin("")
  cmap <Esc>[200~ <nop>
  cmap <Esc>[201~ <nop>
endif

" ----------------------------------------
" Plugin Configuration
" ----------------------------------------
" See plugins/settings directory for plugin customization.
