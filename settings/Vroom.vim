let g:vroom_map_keys = 0
let g:vroom_use_colors = 1

" Run test file/rerun last test with ,t
map <Leader>t :VroomRunTestFile<CR>
" Run closest individual test with ,T
map <Leader>T :VroomRunNearestTest<CR>
