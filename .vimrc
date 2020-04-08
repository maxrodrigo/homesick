" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'airblade/vim-gitgutter'
Plug 'gabesoft/vim-ags'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'

" Deoplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'
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
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Fancy stuff
Plug 'vimwiki/vimwiki'

call plug#end()

" PLUGINS *********************************

" Global
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python'

" Deoplete
let g:deoplete#enable_at_startup = 1

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
let g:syntastic_loc_list_height = 5

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

" Lightline

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'right': [ [ 'lineinfo', 'syntastic' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ }
      \ }

" VimWiki
let g:vimwiki_autowriteall = 1
let g:vimwiki_list = [{'path': '~/Documents/wiki/'},
                     \{'path': '~/Documents/infosec/', 'syntax': 'markdown', 'ext': 'md'}]

" UltiSnip
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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

" Disable arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

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

" Toggle highlights
map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

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
