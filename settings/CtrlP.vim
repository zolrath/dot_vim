" ---------------
" Ctrlp
" ---------------
" Conditional Mappings
if has("gui_macvim")
  let g:ctrlp_map = '<D-t>'
else
  let g:ctrlp_map = '<M-t>'
endif
let g:ctrlp_extensions = ['tag']
let g:ctrlp_custom_ignore = 'node_modules$\|.lock$\|.gitkeep$\|tmp/'

" Leader Command
nnoremap <C-p> :CtrlPRoot<CR>
"nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>c :CtrlPCurFile<CR>
nnoremap <leader>r :CtrlPMRUFiles<CR>



" Ensure max height isn't too large. (for performance)
let g:ctrlp_max_height = 10
