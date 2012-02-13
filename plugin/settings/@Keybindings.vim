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

" Bubble single lines
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines
vmap <C-k> [egv
vmap <C-j> ]egv

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

" Window Movement
nmap <silent> <C-w>h :wincmd h<CR>
nmap <silent> <C-w>j :wincmd j<CR>
nmap <silent> <C-w>k :wincmd k<CR>
nmap <silent> <C-w>l :wincmd l<CR>
" Previous Window
nmap <silent> <C-w>p :wincmd p<CR>

" Equal Size Windows
nmap <silent> <leader>w= :wincmd =<CR>

" Window Splitting
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
" Because I'm dyslexic
nmap <silent> <leader>hs :split<CR>
nmap <silent> <leader>vs :vsplit<CR>
nmap <silent> <leader>sc :close<CR>
