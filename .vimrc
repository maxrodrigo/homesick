" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'jiangmiao/auto-pairs'
Plug 'gabesoft/vim-ags'
Plug 'kien/ctrlp.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
" Colors
Plug 'gruvbox-community/gruvbox'

" Python
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'vim-scripts/indentpython.vim'

" Other Tools
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Fancy stuff
Plug 'vimwiki/vimwiki'

call plug#end()

" PLUGINS *********************************

" NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeHightlightCursorline = 1
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '.svn$', '\.egg-info', '.sass-cache', '.direnv']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 3
let g:syntastic_python_flake8_args='--max-line-length=100'

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn|vagrant|bower_components|dist|node_modules|vendor|log|cache)$',
    \ 'file': '\tags$\|\.pyc$'
    \ }

if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column\ --vimgrep
    set grepformat=%f:%l:%c:%m,%f:%l:%m

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
endif

" VimWiki
let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]
let g:vimwiki_autowriteall = 1

" UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim-Snippets
let g:snips_author = "maxrodrigo"
let g:snips_email = "contact@maxrodrigo.com"

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']

" INDENTATION *****************************
set linebreak

set tabstop=4
set softtabstop=4
set shiftwidth=4

set expandtab
set smarttab
set autoindent

" FOLDING **********************************
set foldmethod=indent
set foldlevelstart=20

" SWAP AND BACKUP *************************
set swapfile
set backupcopy=yes
set undofile

set undodir=~/.vim/cache//
set backupdir=~/.vim/cache//
set directory=~/.vim/cache//

" APPAERANCE *******************************
syntax on

set encoding=utf-8
set number
set guioptions=aAce
set noshowmode " lightline shows the mode

set background=dark
colorscheme gruvbox

set showmatch " highlight matching [{()}]
set showcmd
set scrolloff=2

set wildmenu
set wildmode=list:longest,list:full

" FILE FIND ******************************
set path+=**

" SEARCHING ******************************
set hlsearch
set incsearch
set ignorecase
set nolazyredraw
set magic

" BUFFERS ********************************
set hidden
set splitright
set splitbelow

" SPELL CHECKING *************************
set complete+=kspell
setlocal spell

" EXTRAS **********************************
set lazyredraw
set fileformats=unix
set mouse=a
set visualbell t_vb=
set backspace=indent,eol,start

" Display extra whitespace
set list
set listchars=
set listchars+=tab:»·
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:░

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" MAPPINGS **********************************

" Use ctrl-[hjkl] to select the active split!
noremap <silent> <c-k> :wincmd k<CR>
noremap <silent> <c-j> :wincmd j<CR>
noremap <silent> <c-h> :wincmd h<CR>
noremap <silent> <c-l> :wincmd l<CR>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Copy current file and line number
nnoremap <leader>y :let @+=expand("%") . ':' . line(".")<CR>

" Buffers navigation
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:vert belowright sb<Space>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close buffer and move to the previous one.
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>qa :%bd<bar>e#<bar>bd#<CR><CR>

" bind K to grep word under cursor
nnoremap K :Ags "\b<C-R><C-W>\b"<CR>

" Replace mappings
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>//g<left><left>

" Exit TERMINAL MODE
tnoremap <Esc> <C-\><C-n>
tnoremap <i> <G><A>

" PLUGINS MAPPINGS ***************************

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" MAPPGINS FUNCTIONS ***************************

" Pytest
nmap <silent><Leader>t <Esc>:Pytest file verbose<CR>
nmap <silent><Leader>f <Esc>:Pytest function verbose<CR>

" AUTOCMD ***********************************

autocmd BufWritePre *.py execute ':Black'
autocmd FocusGained,BufEnter * :silent! !
