" ---------------
" Powerline
" ---------------
" Needs to be in main files to setup statusline
" Keep ^B from showing on Windows in Powerline
if has('win32') || has('win64')
  let g:Powerline_symbols = 'compatible'
else 
  let g:Powerline_symbols = 'fancy'
endif
