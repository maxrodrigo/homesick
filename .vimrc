" Vundle **********************************
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jiangmiao/auto-pairs'
Plugin 'sheerun/vim-polyglot'
Plugin 'gabesoft/vim-ags'

Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-obsession'

" Interface
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
" Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Colors
Plugin 'morhetz/gruvbox'

" Python
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'

" Bash
Plugin 'kawaz/batscheck.vim'

" HTML
Plugin 'mattn/emmet-vim'

" Fancy stuff
Plugin 'mattn/calendar-vim'
Plugin 'vimwiki/vimwiki'
Plugin 'mhinz/vim-startify'

call vundle#end()
filetype plugin indent on

" PLUGINS *********************************

" NERDTree
autocmd FileType nerdtree setlocal nolist
let NERDTreeIgnore = ['\.pyc$', '.svn$', '.DS_Store', '\.egg-info', '.sass-cache']
let NERDTreeHightlightCursorline = 1
let NERDTreeShowHidden = 1
let NERDTreeChDirMode = 2
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeBookmarksFile = $HOME.'/.vim/NERDTree-bookmarks'

" NERDTree Highlight
" let g:NERDTreeLimitedSyntax = 1
" let g:NERDTreeFileExtensionHighlightFullName = 1
" let g:NERDTreeExactMatchHighlightFullName = 1
" let g:NERDTreePatternMatchHighlightFullName = 1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_loc_list_height = 5

" Ariline
set laststatus=2
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" CtrlP
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

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Vim-Snippets
let g:snips_author = "maxrodrigo"
let g:snips_email = "contact@maxrodrigo.com"

" YouCompleteMe
let g:ycm_seed_identifiers_with_syntax = 1 " Completion for programming language's keyword
let g:ycm_complete_in_comments = 1 " Completion in comments
let g:ycm_complete_in_strings = 1 " Completion in string
let g:ycm_filetype_blacklist = {}

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
set foldlevel=99
set foldnestmax=1
set nofoldenable

" SWAP AND BACKUP *************************
set undofile
set backupcopy=yes
set noswapfile

set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.saswp//

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

" Buffer navigation
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

" Close buffer and move to the previous one.
map <leader>q :bp<bar>sp<bar>bn<bar>bd<CR>

" bind K to grep word under cursor
nnoremap K :Ags "\b<C-R><C-W>\b"<CR>

nnoremap <Space><Space> :'{,'}s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>%       :%s/\<<C-r>=expand('<cword>')<CR>\>/
nnoremap <Space>*       :%s///g

" MAPPINGS PLUGINS ***************************

" YouCompleteMe
" Goto definition with F3
map <F3> :YcmCompleter GoTo<CR>

" Tabularize
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" MAPPGINS FUNCTIONS ***************************
noremap <silent> <leader>om :call OpenMarkdownPreview()<cr>

" AUTOCMD ***********************************

" Trigger autoread when changing buffers or coming back to vim.
autocmd FocusGained,BufEnter * :silent! !
autocmd BufWritePre * call StripTrailingWhitespace()
autocmd FileType markdown let b:noStripWhitespace=1

" Set filetype for bats bash testing tool
autocmd BufRead,BufNewFile *.bats set filetype=sh

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
