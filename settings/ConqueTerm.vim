" ---------------
" ConqueTerm
" ---------------
let g:ConqueTerm_TERM = 'xterm-256'
let g:ConqueTerm_ReadUnfocused=1
let g:ConqueTerm_InsertOnEnter=1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_Color = 2
nmap <silent> <Leader>pry :execute 'ConqueTermSplit pry'<CR>
" Send the current selection to conqueterm. This lets you easily veal
" Ruby code in an irb console. Note: you must have only one ConqueTerm
" console open and running irb for this to work. Somehow it gets confused
" when multiple consoles are open. If you know how to fix this let me know :)
let g:ConqueTerm_SendVisKey = '<Leader>e'
