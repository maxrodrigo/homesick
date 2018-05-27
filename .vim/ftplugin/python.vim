set textwidth=80
set colorcolumn=80
let python_highlight_all=1

autocmd BufWritePost *.py execute ':Black'
noremap <F9> <ESC>:w<CR>:!python %<CR>
