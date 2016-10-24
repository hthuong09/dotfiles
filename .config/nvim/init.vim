if &compatible
    set nocompatible
endif

" Plugins {{{
let isFirstTime = 0

if !filereadable($HOME . '/.config/nvim/autoload/plug.vim')
    echo "Installing vim-plug\n"
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let isFirstTime = 1
endif

call plug#begin('~/.vim/plugged')

" Colorscheme
Plug 'jacoborus/tender.vim'


" Vim Helpers
" Asynchronous execution library
Plug 'Shougo/vimproc.vim', {'do' : 'make'}


" WebDev Tools
" HTML generator
Plug 'mattn/emmet-vim'


" Gits
" Highlight git modification realtime in file
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'


" Auto fills
" Auto close brackets
Plug 'jiangmiao/auto-pairs'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Autocomplete
Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'm2mdas/phpcomplete-extended'
" Plug 'phpvim/phpcd.vim'
Plug 'shawncplus/phpcomplete.vim'

" Auto close brackets when complete is done
Plug 'Shougo/neopairs.vim'

" Auto close html tag
Plug 'alvan/vim-closetag'


" Linter
Plug 'scrooloose/syntastic'


" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'stanangeloff/php.vim', {'for': 'php'}


" Others
Plug 'Shougo/unite.vim'
"Plug 'equalsraf/neovim-gui-shim'

" User Interface (UI should at the end)
" File tree sidebar
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Better indent highlight
"Plug 'yggdroot/indentline'

" Icons
"Plug 'ryanoasis/vim-devicons'


call plug#end()

if isFirstTime == 1
    echo "Install plugins with vim-plug"
    :PlugInstall
endif

" }}}

" Vim Tweaks {{{

" Enable true color if supported
"if (has("termguicolors"))
"    set termguicolors
"endif

" Default encoding - Use UTF-8 without BOM
set encoding=utf8 nobomb

" Using soft tab
set tabstop=4
set shiftwidth=4
set expandtab

" Highlight current line
set cursorline
" Highlight current column
"set cursorcolumn

" Show line number, relative
set number
set relativenumber

" Search tweaks
set hlsearch
set incsearch
set ignorecase
set smartcase

" Auto indent
set autoindent

" No backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Folding
set foldmethod=marker

" }}}

" Plugin Settings {{{

" Colorscheme
syntax enable
colorscheme tender

" NerdTREE
" let g:nerdtree_tabs_open_on_console_startup = 1
" let NERDTreeShowHidden = 1 " Press I to toggle show/hide hidden files

" Vim Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
let g:airline_left_sep = '▓▒░'
let g:airline_right_sep = '░▒▓'
" Fix powerline display weird
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#left_sep = '▓▒░'
let g:airline#extensions#tabline#left_alt_sep = '▒'

" GitGutter
let g:gitgutter_enabled = 1
set updatetime=250
"let g:gitgutter_sign_added = 'xx'
"let g:gitgutter_sign_modified = 'yy'
"let g:gitgutter_sign_removed = 'zz'
"let g:gitgutter_sign_removed_first_line = '^^'
"let g:gitgutter_sign_modified_removed = 'ww'

" Deoplete.
let g:deoplete#enable_at_startup = 1
set completeopt-=preview " no review windows
let g:deoplete#auto_complete_delay = 300
" deoplete-tern
"let g:tern_request_timeout = 1
"let g:tern_show_signature_in_pum = '0'  " This do disable full signature type on autocomplete
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.php = 'phpcomplete#CompletePHP'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.php = '\w+|[^. \t]->\w*|\w+::\w*'

" vim-devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:webdevicons_enable_airline_statusline = 1

" Syntastic
let g:syntastic_javascript_checkers = ['eslint']

" Indentguide
" let g:indentLine_char = ''

" vim-closetag
let g:closetag_filenames = '*.html,*.xml,*.jsx,*.js,*.php'

" Javascript syntax
let g:javascript_Plug_jsdoc = 1
" let g:jsx_ext_required = 0

" }}}

" Key Bindings {{{

" Toggle NerdTree
map <F3> <plug>NERDTreeTabsToggle<CR>

" Fuzzy file with Unite
map <c-p> :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>

" Saving files
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

" Quitting files
noremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>

" Close buffer
nnoremap <leader>q :bp<cr>:bd #<cr>
" nnoremap <C-w> :bp<cr>:bd #<cr>
nnoremap <leader>Q :bp<cr>:bd! #<cr>
" Switching buffers
nnoremap <C-l> <Esc>:bnext<CR>
nnoremap <C-h> <Esc>:bprevious<CR>

" Disable arrow key
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" <TAB>: completion
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" Enter to select autocomplete option
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
" Esc to cancel autocomplete
inoremap <expr><Esc> pumvisible() ? "\<C-e>" : "\<Esc>"

" }}}

