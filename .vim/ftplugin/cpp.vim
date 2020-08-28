set textwidth=100
let &colorcolumn="80,".join(range(100,999),",")
hi ColorColumn ctermbg=236

nnoremap <buffer> <F9> :!g++ % -ggdb -o %:r && ./%:r <CR>
nnoremap <buffer> <F10> :!g++ % -ggdb -o %:r <CR>
