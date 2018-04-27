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
" incsearch.vim                   vim-colors-solarized            vim-rhubarb
" javascript-libraries-syntax.vim vim-commentary                  vim-surround
" jplaut                          vim-fugitive                    vimperator.vim

Plugin 'tpope/vim-commentary.git'
Plugin 'tpope/vim-repeat.git'
Plugin 'tpope/vim-surround.git'
" :help fugitive
Plugin 'tpope/vim-fugitive.git'
" :Gbrowse and use hub instead of git
Plugin 'tpope/vim-rhubarb.git'
" use gC or :help capslock
Plugin 'tpope/vim-capslock.git'

Plugin 'haya14busa/incsearch.vim'

":DetectIndent
Plugin 'roryokane/detectindent.git'

Plugin 'godlygeek/tabular.git'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree'
"Syntax checking/error highlighting
Plugin 'vim-syntastic/syntastic'

"Syntax highlighting
" Plugin 'jelera/vim-javascript-syntax'
"More syntax highlighting
Plugin 'pangloss/vim-javascript'

"highights indents
Plugin 'nathanaelkane/vim-indent-guides'
"highights indents for jsx
Plugin 'mxw/vim-jsx'
"highights indents for json
Plugin 'leshill/vim-json'
"vimperator syntax highlighting
Plugin 'vimperator/vimperator.vim.git'
"typescript sytax highlighting
Plugin 'leafgarland/typescript-vim.git'
"systemverilog sytax highlighting
Plugin 'vhda/verilog_systemverilog.vim'

"Adds closing brace with some smarts
" Plugin 'Raimondi/delimitMate'

"Arduino
Plugin '4Evergreen4/vim-hardy'

" Vim Script helpers
Plugin 'eparreno/vim-l9'

let delimitMate_expand_cr = 1
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

" YCM haskell trigge
let g:ycm_semantic_triggers = {'haskell' : ['.']}

"Highlighting for common libraries
"https://github.com/othree/javascript-libraries-syntax.vim
Plugin 'othree/javascript-libraries-syntax.vim'

" command-t
" Plugin 'wincent/command-t'
" Plugin 'ctrlpvim/ctrlp.vim'

" Color schemes
Plugin 'altercation/vim-colors-solarized.git'
Plugin 'zcodes/vim-colors-basic.git'

Plugin 'vim-airline/vim-airline'
" Plugin 'airblade/vim-gitgutter'

Plugin 'sjl/gundo.vim'

"js completion engine
Plugin 'ternjs/tern_for_vim.git'

"typescript
Plugin 'Quramy/vim-js-pretty-template'
Plugin 'Quramy/tsuquyomi'

"Ack support
Plugin 'mileszs/ack.vim'

" Reason stuff
" Plugin 'reasonml-editor/vim-reason-plus'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'roxma/nvim-yarp'
" Plugin 'autozimu/LanguageClient-neovim'

Bundle 'mattn/webapi-vim'
Bundle 'mattn/gist-vim'

Plugin 'prettier/vim-prettier'

" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


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

" Snippets
" function! g:UltiSnips_Complete()
"     call UltiSnips#ExpandSnippet()
"     if g:ulti_expand_res == 0
"         if pumvisible()
"             return "\<C-n>"
"         else
"             call UltiSnips#JumpForwards()
"             if g:ulti_jump_forwards_res == 0
"                return "\<TAB>"
"             endif
"         endif
"     endif
"     return ""
" endfunction

" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsListSnippets="<c-e>"

" " this mapping Enter key to <C-y> to chose the current highlight item
" " and close the selection list, same as other IDEs.
" " CONFLICT with some plugins like tpope/Endwise
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsListSnippets="<c-e>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir=$HOME.'/.config/UltiSnips'
let g:UltiSnipsSnippetDirectories=[$HOME."/.config/UltiSnips"]

" Prettier
let g:prettier#autoformat = 0
let g:prettier#config#single_quote = 'true'
let g:prettier#config#trailing_comma = 'all'

" setting the defaults
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#parser = 'babylon'

autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*\(package\)\@<!.json,*.graphql,*.vue Prettier

"https://github.com/autozimu/LanguageClient-neovim
"reason
let g:LanguageClient_serverCommands = {
    \ 'reason': ['ocaml-language-server', '--stdio'],
    \ 'ocaml': ['ocaml-language-server', '--stdio'],
    \ }

"syntactic reommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_ocaml_checkers = ['merlin']
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'


"set filetypes
au BufNewFile,BufRead .bash_local set filetype=sh
au BufNewFile,BufRead .bash_aliases set filetype=sh
au BufNewFile,BufRead *.sig set filetype=sml
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufFilePre,BufRead *.md
      \ set filetype=markdown |
      \ set spell spelllang=en_us "Enable spellchecking

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

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
" set cursorline  "Highlight current line
set clipboard=unnamed  "Copy and paste from system clipboard
set lazyredraw  "Don't redraw while running macros (faster)
" set autochdir  "Change directory to currently open file
set nocompatible  "Kill vi-compatibility
set wrap  "Visually wrap lines
set linebreak  "Only wrap on 'good' characters for wrapping
set backspace=indent,eol,start  "Better backspacing
set linebreak  "Intelligently wrap long files
set ttyfast  "Speed up vim
set nostartofline "Vertical movement preserves horizontal position

" Strip whitespace from end of lines when writing file
autocmd BufWritePre * :%s/\s\+$//e

" Open all folds by default
autocmd BufRead * normal zR

" Syntax highlighting and stuff
syntax on

"Line Numbers
set number

"Errors on line longer than 80 characters
2mat ErrorMsg '\%80v.'

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

set background=dark
let g:solarized_termcolors = 256

"solarized after 10pm and before 8am
if 8 < strftime("%H") && strftime("%H") > 21
  colorscheme solarized
else
  color basic-dark
endif

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


"merlin -ocaml completion
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

" map leader # to resolve conflicts
if &diff
    map <leader>1 :diffget LOCAL<CR>
    map <leader>2 :diffget BASE<CR>
    map <leader>3 :diffget REMOTE<CR>
endif

autocmd BufReadPost *.re setlocal filetype=reason

autocmd FileType ocaml setlocal commentstring=(*\ %s\ *)
autocmd BufNew,BufNewFile,BufRead *.mly setlocal commentstring=/*\ %s\ */

autocmd BufNew,BufNewFile,BufRead *.l1,*.l2,*.l3,*.l4,*.l5,*.l6 setlocal ft=c

map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nnoremap <C-g> :GundoToggle<CR>

" Just show the filename (no path) in the tab
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1

" let g:airline#extensions#syntastic#stl_format_err = 1
" let g:airline#extensions#syntastic#stl_format_warn = 1

"typescript
autocmd FileType typescript JsPreTmpl html
autocmd FileType typescript syn clear foldBraces
autocmd FileType typescript map <leader>g :TsuDefinition<CR>
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

set foldmethod=syntax

set shell=/usr/local/bin/zsh

" Use ag if present for Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" command Ag Ack

command -nargs=1 Ag execute "Ack" '<args>'

"markdown
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'js=javascript', 'javascript']

" Plugin 'mattn/emmet-vim'
" Plugin 'christoomey/vim-tmux-navigator'
" Bundle 'jistr/vim-nerdtree-tabs'


" call vundle#end() " required
" filetype plugin indent on " required

" colorscheme wombat256
" let g:airline_powerline_fonts = 1

" if executable('ag')
"   let g:ackprg = 'ag --vimgrep'
" endif

" nnoremap <C-J> <C-W><C-J>
" nnoremap <C-K> <C-W><C-K>
" nnoremap <C-L> <C-W><C-L>
" nnoremap <C-H> <C-W><C-H>
" nmap <silent> <C-N> :NERDTreeTabsToggle<CR>

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
" " let g:syntastic_check_on_open = 1
" " let g:syntastic_check_on_wq = 0


" let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" set list
" set listchars=eol:¬,tab:▸\ ,trail:·
" set listchars=tab:▸\ ,trail:·
" set tabstop=4
" set shiftwidth=4
" set nu
" set scrolloff=10 " Keep 3 lines below and above the cursor
