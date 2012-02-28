" ----------------------------------------
" Bindings
" ----------------------------------------
" Fixes common typos
command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Use kj as Esc alternative
inoremap kj <Esc>

" Make C-y get word above it in insert mode.
inoremap <expr> <C-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" put cursor back to original position after repeating with .
nmap . .`[

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Set C-c and C-v in visual mode to copy/paste with system buffer on OS X.
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" Make Y behave like other capitals
map Y y$

" Reselect visual section after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand)
" C + d (page up)
" C + f (page down)
nmap <C-d> <C-b>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" :mk. allows creation of directories leading to current file.
cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>/

" Make j and k go through line wrapped text as if they were multiple lines.
noremap j gj
noremap k gk

" Use Ctrl+dir to move lines up/down.
" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

" Use Ctrl+dir to indent left/right.
nnoremap <C-h> <<
nnoremap <C-l> >>
inoremap <C-h> <Esc><<`]a
inoremap <C-l> <Esc>>>`]a
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Disable arrow keys
" Remapped arrow keys to resize splits below.
" map <Up>    :echo 'Jump up, jump up..'<cr>
" map <Down>  :echo 'and get down!'<cr>
" map <Left>  :echo 'Jump! Jump! Jump!'<cr>
" map <Right> :echo 'Jump around!'<cr>

" ---------------
" Leader Commands
" ---------------

" Toggle spelling mode with ,s
nmap <silent> <leader>s :set spell!<CR>

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
" Because I'm dyslexic
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>


" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Use Leader direction to move to or create new splits.
" ---------------

function! WinMove(key) 
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else 
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction
 
map <leader>h              :call WinMove('h')<cr>
map <leader>k              :call WinMove('k')<cr>
map <leader>l              :call WinMove('l')<cr>
map <leader>j              :call WinMove('j')<cr>

" Capital directions to move splits.
map <leader>H              :wincmd H<cr>
map <leader>K              :wincmd K<cr>
map <leader>L              :wincmd L<cr>
map <leader>J              :wincmd J<cr>

" ,x to close split. ,sr to rotate splits.
map <leader>x :wincmd q<cr>
map <leader>sr <C-W>r

" Use arrow keys to resize splits.
nmap <left>  :3wincmd <<cr>
nmap <right> :3wincmd ><cr>
nmap <up>    :3wincmd +<cr>
nmap <down>  :3wincmd -<cr>
" ---------------
" Fix Trailing White Space
" ---------------
map <leader>ws :%s/\s\+$//e<CR>
command! FixTrailingWhiteSpace :%s/\s\+$//e

" ---------------
" Quick spelling fix (first item in z= list)
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>
