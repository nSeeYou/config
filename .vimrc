"              __     _____ __  __ ____   ____     ______   __
"              \ \   / /_ _|  \/  |  _ \ / ___|   | __ ) \ / /
"               \ \ / / | || |\/| | |_) | |       |  _ \\ V /
"                \ V /  | || |  | |  _ <| |___    | |_) || |
"                 \_/  |___|_|  |_|_| \_\\____|   |____/ |_|
"
"                  _    ____  _____ ______        ___    ____
"                 / \  |  _ \| ____/ ___\ \      / / \  |  _ \
"                / _ \ | |_) |  _| \___ \\ \ /\ / / _ \ | |_) |
"               / ___ \|  _ <| |___ ___) |\ V  V / ___ \|  _ <
"              /_/   \_\_| \_\_____|____/  \_/\_/_/   \_\_| \_\


" Colorscheme
colorscheme molokai

" Disable vi compatibility mode
set nocompatible

" Reload a file when it is changed from the outside
set autoread

" Set the leader key to ,
let mapleader=","

" Write the file when we leave the buffer
set autowrite

" Force encoding to utf-8, for systems where this is not the default (windows
" comes to mind)
set encoding=utf-8

" Show line number
set number

" Removes spaces at end of lines when writing
autocmd BufWritePre *.c,*.h,*.cpp,*.cxx,*.cc,*.hh,*.hxx :%s/\s\+$//ge

" Closes Brackets, braces, strings... automatically
autocmd FileType php,c,java,cpp,js inoremap /* /*  */<Esc>hhha
autocmd FileType php,c,java,cpp,js inoremap {<CR> {<CR><Esc>O
autocmd FileType c,cpp inoremap //* /**<CR><Esc>0i*/<Esc>O<Esc>0i**

" Displays Line ends and invisible chars
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤


" Set the minimal amount of lignes under and above the cursor
" Useful for keeping context when moving with j/k
set scrolloff=5

" Enables syntax highlighting
syntax on

" Default cterm foreground and background color to NONE

" Colors 80th column
set colorcolumn=80

" Allow mouse use in vim
set mouse=a

" Highlight current line
hi CursorLine cterm=NONE ctermbg=234
set cursorline

" The length of a tab
" This is for documentation purposes only,
" do not change the default value of 8, ever.
set tabstop=8

" The number of spaces inserted when you press tab
set softtabstop=2

" The number of spaces inserted/removed when using < or >
set shiftwidth=2

" Insert spaces instead of tabs
set expandtab

" When tabbing manually, use shiftwidth instead of tabstop and softtabstop
set smarttab

" Set basic indenting (i.e. copy the indentation of the previous line)
" When filetype detection didn't find a fancy indentation scheme
set autoindent
autocmd Filetype c set cindent

noremap <F2> :bn<CR>

filetype off

" Enable Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle Bundle
Plugin 'gmarik/vundle'

" YouCompleteMe completion Plugin
" Bundle 'Valloric/YouCompleteMe'
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" Neocomplete Bundle
Plugin 'Shougo/neocomplete.vim'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#max_list = 20

" Syntastic plugin
Plugin 'scrooloose/syntastic'
au BufRead,BufNewFile *.cc,*.hh,*.hxx set ft=cpp
let g:syntastic_c_compiler='clang' " Use clang instead of gcc
let g:syntastic_c_compiler_options = '-Wall -Wextra -pedantic -std=c99'
let g:syntastic_c_check_header=1 " Check headers in c
let g:syntastic_cpp_compiler = 'clang++' " Use clang++ instead of g++
let g:syntastic_cpp_compiler_options = '-Wall -Wextra -pedantic -std=c++1y'
let g:syntastic_cpp_check_header=1 " Check headers in c++
let g:syntastic_ocaml_use_ocamlc = 1 " Use ocamlc instead of ocamlopt

" Header/Source files switching
Plugin 'derekwyatt/vim-fswitch'
nmap <F1> :FSHere<cr>

" Supertab Bundle
Plugin 'ervandew/supertab'
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabMappingTabLiteral = "<C-v>"
let g:SuperTabDefaultCompletionType = "<C-n>"

" Ultisnips/vim-snippets Bundles
Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Airline Bundle
Plugin 'bling/vim-airline'
set laststatus=2
set timeoutlen=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme="wombat"
let g:airline_powerline_fonts = 1

" Fugitive Bundle - Git management
Bundle 'tpope/vim-fugitive.git'

"Bundle 'vim-scripts/DoxygenToolkit.vim'
"let g:DoxygenToolkit_paramTag_pre="@param "
"let g:DoxygenToolkit_returnTag="@return "

" Auto close brackets braces and others
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'townk/vim-autoclose'


" Toogle number lines
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
let g:NumberToggleTrigger=',m'

filetype plugin indent on
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

au BufRead,BufNewFile *.aasm set filetype=aasm
