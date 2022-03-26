if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'honza/vim-snippets'

Plug 'ayu-theme/ayu-vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'

" Tim
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'

" Extras
Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Plugin: COC

let g:coc_global_extensions = [
      \ 'coc-css', 'coc-html',
      \ 'coc-prettier', 'coc-pairs', 'coc-snippets',
      \ 'coc-pyright',
      \ 'coc-json', 'coc-yaml',
      \ 'coc-git', 'coc-markdownlint'
      \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>cl <Plug>(coc-codelens-action)

nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

" Plugin: fzf

nnoremap <C-p> :Files<Cr>
nnoremap <leader>f :Ag<Cr>
nnoremap <leader>b :Buffers<Cr>

" Plugin: NERDTree

let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Plugin: Lightline

let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" Plugin: VimWiki

let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]

" Indentation

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Swap / Backups / Undo

set swapfile
set directory=~/.cache/nvim/swap//

set backupcopy=yes
set backupdir=~/.cache/nvim/backup//

set undofile
set undodir=~/.cache/nvim/cache//

" Interface

set number
set termguicolors
let &colorcolumn="80,".join(range(100,999),",")
let ayucolor="mirage"
colorscheme ayu

hi CocHighlightText guibg=DarkSlateGray

" Extras

set list
set listchars=
set listchars+=tab:»·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

set updatetime=300

set ignorecase
set smartcase

set wrap linebreak nolist

" Mappings

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

noremap <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
noremap <leader>qa :%bd<bar>e#<bar>bd#<CR><CR>

noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
