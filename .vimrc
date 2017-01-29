set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

"Syntax highlighting
Plugin 'jelera/vim-javascript-syntax'
"More syntax highlighting
Plugin 'pangloss/vim-javascript'
"highights indents
Plugin 'nathanaelkane/vim-indent-guides'
"Adds closing brace
Plugin 'Raimondi/delimitMate'
"Arduino
Plugin '4Evergreen4/vim-hardy'
let delimitMate_expand_cr = 1

"Highlighting for common libraries
"https://github.com/othree/javascript-libraries-syntax.vim
Plugin 'othree/javascript-libraries-syntax.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ

au BufNewFile,BufRead .bash_local set filetype=sh
au BufNewFile,BufRead .bash_aliases set filetype=sh
execute pathogen#infect()


" ========================
" SOFT LINES (I'M A PUSSY)
" Arrow keys move down soflines(multilines with no enter)
" Or, use gj and gk to move down and up
" ========================
map <silent> <Up> gk
imap <silent> <Up> <C-o>gk
map <silent> <Down> gj
imap <silent> <Down> <C-o>gj
map <silent> <home> g<home>
imap <silent> <home> <C-o>g<home>
map <silent> <End> g<End>
imap <silent> <End> <C-o>g<End>


set t_Co=256 "256 color
set encoding=utf-8 "UTF-8 character encoding
set tabstop=2  "4 space tabs
set shiftwidth=2  "4 space shift
set softtabstop=2  "Tab spaces in no hard tab mode
set expandtab  " Expand tabs into spaces
set autoindent  "autoindent on new lines
set showmatch  "Highlight matching braces
set ruler  "Show bottom ruler
set equalalways  "Split windows equal size
set formatoptions=croq  "Enable comment line auto formatting
set wildignore+=*.o,*.obj,*.class,*.swp,*.pyc "Ignore junk files
set title  "Set window title to file
set hlsearch  "Highlight on search
set ignorecase  "Search ignoring case
set smartcase  "Search using smartcase
set incsearch  "Start searching immediately
set scrolloff=5  "Never scroll off
set wildmode=longest,list  "Better unix-like tab completion
set cursorline  "Highlight current line
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Syntax highlighting and stuff
syntax on

" Vavious LaTex Settings
autocmd FileType tex call Tex_SetTeXCompilerTarget('View','pdf')
let g:tex_flavor='latex'
let g:Tex_TreatMacViewerAsUNIX = 1
let g:Tex_ExecuteUNIXViewerInForeground = 1
let g:Tex_ViewRule_pdf='open -a /Applications/Skim.app'
"let g:Tex_ViewRule_pdf='open -a Preview'
let g:Tex_ViewRule_dvi='open -a Preview'
let g:Tex_ViewRule_ps='open -a Preview'
set grepprg=grep\ -nH\ $*

" Get rid of warning on save/exit typo
command WQ wq
command Wq wq
command W w
command Q q

set nopaste

" prevents scrolling
set mouse=

noremap <ScrollWheelUp>      <Nop>
noremap <S-ScrollWheelUp>    <Nop>
noremap <C-ScrollWheelUp>    <Nop>
noremap <ScrollWheelDown>    <Nop>
noremap <S-ScrollWheelDown>  <Nop>
noremap <C-ScrollWheelDown>  <Nop>
noremap <ScrollWheelLeft>    <Nop>
noremap <S-ScrollWheelLeft>  <Nop>
noremap <C-ScrollWheelLeft>  <Nop>
noremap <ScrollWheelRight>   <Nop>
noremap <S-ScrollWheelRight> <Nop>
noremap <C-ScrollWheelRight> <Nop>
