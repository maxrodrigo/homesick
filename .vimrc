" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'

" Colors
Plug 'gruvbox-community/gruvbox'

" Python
Plug 'vim-scripts/indentpython.vim'
Plug 'deoplete-plugins/deoplete-jedi'

" Other Tools
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'andrewstuart/vim-kubernetes'

" Fancy stuff
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" PLUGINS *********************************

" Global
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python'

" ALE
let g:ale_open_list = 1
let g:ale_list_window_size = 4
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black', 'autopep8'],
\   'cpp': ['clang-format'],
\}

" Deoplete
let g:deoplete#enable_at_startup = 1

" fzf
nnoremap <C-p> :Files<Cr>
nnoremap <C-k> :Ag! <C-R><C-W><CR>

" NERDTree
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeChDirMode = 2
let g:NERDTreeHightlightCursorline = 1
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '.svn$', '\.egg-info', '.sass-cache', '.direnv', 'venv', '.venv', 'node_modules', '.vagrant']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

autocmd FileType nerdtree setlocal nolist
map <C-n> :NERDTreeToggle<CR>

" Lightline

let g:lightline = {
\   'colorscheme': 'wombat',
\   'active': {
\       'left':  [ [ 'mode', 'paste' ],
\                  [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
\       'right': [ [ 'lineinfo', 'syntastic' ],
\                  [ 'percent' ],
\                  [ 'fileformat', 'fileencoding', 'filetype' ]
\                ]
\   },
\   'component_function': {
\       'syntastic': 'SyntasticStatuslineFlag',
\       'gitbranch': 'FugitiveHead'
\   }
\}

" VimWiki
let g:vimwiki_global_ext = 0
let g:vimwiki_autowriteall = 1
let g:vimwiki_list = [{'path': '~/Documents/wiki/'}]

" UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" indentLine
let g:indentLine_fileType = ['yaml']

" INDENTATION *****************************
set linebreak

set tabstop=2
set softtabstop=2
set shiftwidth=2

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
set inccommand=nosplit " live substitution
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
setlocal spell spelllang=en_us

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
nnoremap <leader>b :Buffers<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close buffer and move to the previous one.
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>
map <leader>qa :%bd<bar>e#<bar>bd#<CR><CR>

" Replace mappings
nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>//g<left><left>

" Toggle highlights
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

" Exit TERMINAL MODE
tnoremap <Esc> <C-\><C-n>
tnoremap <i> <G><A>
