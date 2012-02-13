" ----------------------------------------
" Bindings
" ----------------------------------------
" Fixes common typos
" command W w
command Q q
map <F1> <Esc>
imap <F1> <Esc>

" Removes doc lookup binding because it's easy to fat finger
nmap K k
vmap K k

" Make line completion easier
imap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand)
" All variations are mapped for now until I get used to one
" C/M/D + d (page up)
" C/M/D + f (page down)
nmap <C-d> <C-b>

" Use ; for : in normal and visual mode, less keystrokes
nnoremap ; :
vnoremap ; :

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" :mk. allows creation of directories leading to current file.
cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>/

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
map <Up>    :echo 'Jump up, jump up..'<cr>
map <Down>  :echo 'and get down!'<cr>
map <Left>  :echo 'Jump! Jump! Jump!'<cr>
map <Right> :echo 'Jump around!'<cr>

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
