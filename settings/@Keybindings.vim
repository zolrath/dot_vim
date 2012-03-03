" ----------------------------------------
" Bindings
" ----------------------------------------

" swap ` with ' because the ' key is closer and jumping to the character is more useful.
nnoremap ' `
nnoremap ` '

" Fixes common typos
" command W w " Commented out to allow :W! to write with sudo.
command Q q
map <f1> <esc>
imap <f1> <esc>
" removes doc lookup binding because it's easy to fat finger.
vnoremap K k

" Map Q to repeat last run macro.
map Q @@

" Auto-indent pastes according to surrounding code.
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v`]=`]
nnoremap P P'[v`]=`]

" Use kj as Esc alternative.
inoremap kj <Esc>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Remove search highlighting by pressing Enter.
nnoremap <CR> :noh<CR><CR>

" Allow the . to execute once for each line of a visual selection.
vnoremap . :normal .<CR>

" put cursor back to original position after repeating with .
nnoremap . .`[

" Use Q for formatting the current paragraph (or selection).
vmap Q gq
nmap Q gqap

" Set C-c and C-v in visual mode to copy/paste in vim without +clipboard.
" Can only yank whole lines. If possible, recompile with +clipboard.
if has("mac")
  let g:clip_command = 'pbcopy'
elseif has("unix")
  let g:clip_command = 'xclip -selection clipboard'
elseif has('win32') || has('win64')
  let g:clip_command = 'clip'
endif
vmap <C-x> :!<c-r>=clip_command<CR><CR>
vmap <C-c> :w !<c-r>=clip_command<CR><CR><CR>

" Make Y behave like other capitals.
map Y y$

" YY to yank from first non-blank to last non-blank on line.
noremap <silent> YY :call Preserve("normal!" . "^yg_")<CR>

" Reselect visual section after indent/outdent.
vnoremap < <gv
vnoremap > >gv

" Visually select the text that was last edited/pasted.
nnoremap gV `[v`]

" Make line completion easier.
imap <C-l> <C-x><C-l>

" Easier Scrolling (think j/k with left hand).
" C + d (page up)
" C + f (page down)
nmap <C-d> <C-b>

" Make j and k go through line wrapped text as if they were multiple lines.
noremap j gj
noremap k gk

" Use ; for : in normal and visual mode, less keystrokes.
nnoremap ; :
vnoremap ; :
nnoremap ;; :!
vnoremap ;; :!

"----------------------------
" New Features
" ---------------------------
" Write with sudo.
cnoremap w!! w !sudo tee % >/dev/null<CR>

" Remap K to split line to right of current cursor position.
nnoremap K a<CR><Esc>`[

" Make C-y get word above it in insert mode.
inoremap <expr> <C-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" :mk. allows creation of directories leading to current file.
cnoremap mk. !mkdir -p <c-r>=expand("%:h")<cr>/

" Use Ctrl+dir to move lines up/down.
" Bubble single lines.
nmap <C-k> [e
nmap <C-j> ]e
" Bubble multiple lines.
vmap <C-k> [egv
vmap <C-j> ]egv

" Use Ctrl+dir to indent left/right.
nnoremap <C-h> <<
nnoremap <C-l> >>
inoremap <C-h> <Esc><<`]a
inoremap <C-l> <Esc>>>`]a
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" Yank text by deleting, then visually highlight what you want to swap it with
" then press C-r.
vnoremap <C-r> <Esc>`.``gvP``P

" ---------------
" Leader Commands
" ---------------
" Use ,d (or ,dd or ,dj or 20,dd) to delete a line without adding it to the
" yank stack (also, in visual mode).
nmap <silent> <leader>d "_d
vmap <silent> <leader>d "_d

" Toggle spelling mode with ,s
" nmap <silent> <leader>s :set spell!<CR>

" ,s or ,S to search for word under cursor.
nnoremap <leader>s :%s/\v/<left>
nnoremap <Leader>S :%s/<c-r>=expand('<cword>')<cr>//gc<left><left><left>

" Edit vimrc with ,v
nmap <silent> <leader>v :e ~/.vim/vimrc<CR>

" ----------------------------------------
" Window Controls
" ----------------------------------------
" Equal Size Windows.
nmap <silent> <leader>w= :wincmd =<CR>

" Traditional Window Splitting.
nmap <silent> <leader>sh :split<CR>
nmap <silent> <leader>sv :vsplit<CR>
nmap <silent> <leader>sc :close<CR>

" Use Leader direction to move to or create new splits.
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved.
    if (match(a:key,'[jk]')) "were we going up/down?
      wincmd v
    else
      wincmd s
    endif
  endif
    exec "wincmd ".a:key
endfunction

map <leader>h   :call WinMove('h')<cr>
map <leader>k   :call WinMove('k')<cr>
map <leader>l   :call WinMove('l')<cr>
map <leader>j   :call WinMove('j')<cr>

" Capital directions to move splits.
map <leader>H   :wincmd H<cr>
map <leader>K   :wincmd K<cr>
map <leader>L   :wincmd L<cr>
map <leader>J   :wincmd J<cr>

" ,x to close split. ,sr to rotate splits.
map <leader>x   :wincmd q<cr>
map <leader>sr   <C-W>r

" Use arrow keys to resize splits.
nmap <left>    :3wincmd <<cr>
nmap <right>   :3wincmd ><cr>
nmap <up>      :3wincmd +<cr>
nmap <down>    :3wincmd -<cr>

" ----------------------------------------
" Functions
" ----------------------------------------

" ---------------
" Preserves/Saves the state, executes a command, and returns to the saved state.
" ---------------
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction

" ---------------
" Fix Trailing White Space.
" ---------------
nnoremap <silent> <leader>ws  :call Preserve("%s/\\s\\+$//e")<CR>

" ---------------
" Reindent File.
" ---------------
nnoremap <silent> <leader>re :call Preserve("normal!" . "gg=G")<CR>

" ---------------
" Diff current edits with saved version.
" ---------------
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()
nnoremap <leader>ds :DiffSaved<CR><C-w>l

" ---------------
" Quick spelling fix (first item in z= list).
" ---------------
function! QuickSpellingFix()
  if &spell
    normal 1z=
  else
    " Enable spelling mode and do the correction.
    set spell
    normal 1z=
    set nospell
  endif
endfunction

command! QuickSpellingFix call QuickSpellingFix()
nmap <silent> <leader>z :QuickSpellingFix<CR>
