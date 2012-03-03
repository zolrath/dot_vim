" =======================================
" Who: Matt Furden @zolrath
" What: vimrc for Ruby/Rails and Clojure
" =======================================

set nocompatible " be iMproved
filetype off     " required!

set rtp+=~/.vim/bundle/vundle/
silent! call vundle#rc()

" Set leader to ,
" Note: This line MUST come before any <leader> mappings
let mapleader=","

" ----------------------------------------
" Vundle
" ----------------------------------------

" Let Vundle manage Vundle, required
silent! Bundle 'gmarik/vundle'

" Edit VundlePackages.vim to add new plugins.
source ~/.vim/settings/@Packages.vim

" Automatically detect file types. (must turn on after Vundle)
filetype plugin indent on

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
  set guifont=Inconsola-dz\ for\ Powerline:h14

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
set t_Co=256
set background=dark
" Solarized color options for iTerm2
" let g:solarized_termcolors=16

silent! colorscheme jellybeans
" colorscheme molokai
" colorscheme solarized

" ---------------
" Backups
" ---------------
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" --------------
"  Undo
" --------------
set undodir=~/.vim/undo
set undofile
set undolevels=1000  "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload"

" ---------------
" UI
" ---------------
set ruler         " Ruler on
set nu            " Line numbers on
set nowrap        " Line wrapping off
set laststatus=2  " Always show the statusline
set cmdheight=1
set encoding=utf-8
set shortmess+=I
" Make currently selected split as large as possible while allowing other
" splits to maintain a height of at least five.
" set winheight=5
" set winminheight=5
" set winheight=999

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
set foldmethod=syntax  " Fold on syntax for ruby support.
set foldlevelstart=99  " Remove folds
set formatoptions=crql
set scrolloff=5        " start scrolling when within 5 lines near the top/bottom
set sidescrolloff=10   " start scrolling when within 10 characters of the left/right
set sidescroll=1       " scroll to left/right one column at a time.
set virtualedit+=block " allow freeform selection (i.e. ignoring line endings) in visual block mode

" ---------------
" Text Format
" ---------------
set tabstop=2
set backspace=2   " Delete everything with backspace
set shiftwidth=2  " Tabs under smart indent
set cindent
set autoindent
set smarttab
set expandtab
set backspace=2
set list
set listchars=tab:▸\ ,trail:⋅,extends:❯,precedes:❮
set showbreak=↪

" ---------------
" Searching
" ---------------
set ignorecase " Case insensitive search
set smartcase  " Non-case sensitive search
set incsearch
set hlsearch

" Disable image/video/audio files
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.avi,*.mkv,*.mov,*.mp3

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.hg,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable compiled files
set wildignore+=*.exe,*.pyc,*.elc

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*,
      \*.lock

" Disable temp and backup files
set wildignore+=*.swp,*~,._*,.DS_Store,*/.vim/undo/*

" ---------------
" Visual
" ---------------
set showmatch   " Show matching brackets.
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
set mouse=a    " Mouse in all modes

" Better complete options to speed it up
set complete=.,w,b,u,U

" ----------------------------------------
" Auto Commands
" ----------------------------------------

if has("autocmd")
  augroup autocommands
    autocmd!

    " Only have cursorline in active window.
    au WinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline

    " Only have color column to warn after 80 characters in insert.
    if exists("&colorcolumn")
      autocmd InsertEnter * set colorcolumn=81
      autocmd InsertLeave * set colorcolumn=""
    endif

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

    " When vim is resized, automatically equalize split size.
    au VimResized * exe "normal! \<c-w>="

    " Source the vimrc file after saving it
    autocmd bufwritepost .vimrc source $MYVIMRC

    " Don't show trailing whitespace in insert mode.
    au InsertEnter * :set listchars-=trail:⋅
    au InsertLeave * :set listchars+=trail:⋅

    " Leave insert mode after 15 seconds of inactivity.
    au CursorHoldI * stopinsert
    au InsertEnter * let updaterestore=&updatetime | set updatetime=15000
    au InsertLeave * let &updatetime=updaterestore

    " Autofold Ruby comments
    au FileType ruby,eruby
          \ set foldmethod=expr |
          \ set foldexpr=getline(v:lnum)=~'^\\s*#' |
          \ exe "normal zM``"
  augroup END
endif

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
" Autoloading config files in /plugin wasnt working properly so:
for f in split(glob('~/.vim/settings/*.vim'), '\n')
  exe 'source' f
endfor
" Allow others to add their own customizations outside of my /settings/
for f in split(glob('~/.vim/custom/*.vim'), '\n')
  exe 'source' f
endfor
