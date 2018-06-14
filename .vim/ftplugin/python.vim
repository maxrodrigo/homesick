set textwidth=80
set colorcolumn=80
let python_highlight_all=1

nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
