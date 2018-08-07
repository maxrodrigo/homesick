if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

" Automatically install vim-plug if missing
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'gabesoft/vim-ags'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'

Plug 'editorconfig/editorconfig-vim'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colors
Plug 'morhetz/gruvbox'

" Python
Plug 'ambv/black'
Plug 'vim-scripts/indentpython.vim'
Plug 'tmhedberg/SimpylFold'

" HTML
Plug 'mattn/emmet-vim'

" Fancy stuff
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki'

call plug#end()

" PLUGINS *********************************

" NERDTree
autocmd FileType nerdtree setlocal nolist
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksFile = $HOME.'/.vim/NERDTree-bookmarks'
let g:NERDTreeChDirMode = 2
let g:NERDTreeHightlightCursorline = 1
let g:NERDTreeIgnore = ['\.pyc$', '^__pycache__$', '.svn$', '.DS_Store', '\.egg-info', '.sass-cache']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

let g:NERDTreeIndicatorMapCustom = {
    \ 'Modified':  '·',
    \ 'Staged':    '‧',
    \ 'Untracked': '?',
    \ 'Renamed':   '≫',
    \ 'Unmerged':  '≠',
    \ 'Deleted':   '✃',
    \ 'Dirty':     '⁖',
    \ 'Clean':     '✓',
    \ 'Unknown':   '⁇'
    \ }

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_python_python_exec = 'python3'

" Ariline
set laststatus=2
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

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
set foldlevel=2
set foldnestmax=10
set nofoldenable

" SWAP AND BACKUP *************************
set undofile
set backupcopy=yes
set noswapfile

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" APPAERANCE *******************************
syntax on

set encoding=utf-8
set number

set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ Mono:h11
set guioptions=aAce

colorscheme gruvbox
set background=dark

set showmatch " highlight matching [{()}]
set showcmd
set cursorline
set scrolloff=2

set wildmenu
set wildmode=list:longest,list:full

" FILE FIND ******************************
set path+=**

" SEARCHING ******************************
set hlsearch
set incsearch
set ignorecase
set smartcase
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
set ttyfast
set fileformats=unix
set mouse=a
set visualbell t_vb=
set clipboard=unnamed
set backspace=indent,eol,start

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" MAPPINGS **********************************

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Navigate through panels
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Copy current file and line number
nnoremap <leader>y :let @+=expand("%") . ':' . line(".")<CR>

" Buffer list selector
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:vert belowright sb<Space>

" Close buffer and move to the previous one.
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" bind K to grep word under cursor
nnoremap K :Ags "\b<C-R><C-W>\b"<CR>

nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>*       :%s//

" MAPPINGS PLUGINS ***************************

" YouCompleteMe
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" MAPPGINS FUNCTIONS ***************************
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

" AUTOCMD ***********************************

" Trigger autoread when changing buffers or coming back to vim.
autocmd FocusGained,BufEnter * :silent! !
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1

" FUNCTIONS ********************************

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

function! OpenMarkdownPreview() abort
    if exists('s:markdown_job_id')
        call jobstop(s:markdown_job_id)
        unlet s:markdown_job_id
    endif
    let available_port = system(
                            \ "lsof -s tcp:listen -i :40500-40800 | awk -F ' *|:' '{ print $10 }' | sort -n | tail -n1"
                            \ ) + 1
    if available_port == 1 | let available_port = 40500 | endif
    let job_id = jobstart('grip ' . shellescape(expand('%:p')) . ' :' . available_port)
    if job_id <= 0 | return | endif
    let s:markdown_job_id = job_id
    silent exec '!open http://localhost:' . available_port
endfunction
