" ---------------
" Ctrlp
" ---------------
" Conditional Mappings
if has("gui_macvim")
  let g:ctrlp_map = '<D-t>'
else
  let g:ctrlp_map = '<M-t>'
endif

" Leader Commands
"nnoremap <leader>t :CtrlPRoot<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>c :CtrlPCurFile<CR>
nnoremap <leader>u :CtrlPMRUFiles<CR>

" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
