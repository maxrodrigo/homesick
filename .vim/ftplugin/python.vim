set textwidth=100
let &colorcolumn="80,".join(range(100,999),",")
hi ColorColumn ctermbg=236

let python_highlight_all=1
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>
