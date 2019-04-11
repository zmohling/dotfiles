""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                        ZACH'S VIMRC                        "
"              CONFIGURED FOR C/C++ DEVELOPMENT              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM INITIAL SETUP
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Init temporary files' directory structure
if empty(glob("~/.vim/temp_dirs"))
   silent !mkdir -p ~/.vim/temp_dirs/backups
   silent !mkdir -p ~/.vim/temp_dirs/swap
   silent !mkdir -p ~/.vim/temp_dirs/undodir
endif

" Init plugin directory
if empty(glob("~/.vim/plugins"))
   silent !mkdir -p ~/.vim/plugins
endif

" Download vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM-PLUG PLUGIN MANAGER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugins')

" Plugin Suite made by Google
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Plugin for WPGTK & Pywal colorscheming
"Plug 'deviantfero/wpgtk.vim'

" Plugin for asynchronous linting/fixing
Plug 'w0rp/ale'

" Plugin for surrounding text with quotes, peren., brackets, etc.
Plug 'tpope/vim-surround'

" A light and configurable statusline/tabline
Plug 'itchyny/lightline.vim'

" Solarized8 for Vim
Plug 'lifepillar/vim-solarized8'

" Base16 for Vim
"Plug 'chriskempson/base16-vim/'

call plug#end()

call glaive#Install()



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""" ALE """""""""""""""""
" Set linters, notably: Google's cpplint for C/C++ linting
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'c': ['gcc', 'cpplint'],
\   'cc': ['g++', 'cpplint'],
\   'cpp': ['g++', 'cpplint'],
\   'h': ['g++', 'cpplint']
\}

" Disabling highlighting
let g:ale_set_highlights = 1

" C/C++ Options
"let g:ale_c_clang_options = '-Wall'

" Lint on leave insert mode
let g:ale_lint_on_text_changed = 'always'

" Javascript fixer
let g:ale_fixers = {
 \ 'javascript': ['eslint'],
 \ }

let g:ale_fix_on_save = 0


""""""""""""""""" SURROUND """""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>


""""""""""""""""" LIGHTLINE """""""""""""""""
" Statusbar color and formatting
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


""""""""""""""""" VIM-CODEDMT """""""""""""""""
" Auto-formatting
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cc,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

" use google style for clang-format
Glaive codefmt clang_format_style='google'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM remembers
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Set Vim clipboard to global clipboard
set clipboard=unnamedplus

" Set language
let $LANG='en' 
set langmenu=en

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Set .viminfo location to temp_dir
set viminfo+=n~/.vim/temp_dirs/viminfo

" Turn persistent undo on 
set undodir=~/.vim/temp_dirs/undodir
set undofile

" Backup files directory
set backupdir=~/.vim/temp_dirs/backups

" Swap files directory
set dir=~/.vim/temp_dirs/swap

" Create a backup files
set backup
set writebackup

" Create swap files
set swapfile

" Do not store network history
let g:netrw_dirhistmax = 0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM UI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" force vim to use 256 colors
set t_Co=256

" Enable syntax highlighting
syntax enable 

" Set light/dark mode
set background=light

" Colorscheme
try
    set termguicolors
    colorscheme solarized8_high
catch
    colorscheme default
endtry

" Set font
set gfn=Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11

" Set hybrid relative line numbering
set number relativenumber
set nu rnu

" Always show current position
set ruler

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Height of the command bar
set cmdheight=1

" Left margin
set foldcolumn=1

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fix default backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Remap VIM 0 to first non-blank character
map 0 ^

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.c,*.cc,*.cpp,*.h :call CleanExtraSpaces()
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab and Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs 
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" indent for special file
autocmd FileType c,cc,cpp,h setlocal expandtab shiftwidth=2 softtabstop=2 cindent 

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
