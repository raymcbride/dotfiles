set nocompatible
filetype off

" setup and run vundle
set rtp+=~/.vim/bundle/Vundle.vim


call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'saltstack/salt-vim'
Plugin 'taglist.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'ruby.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'einars/js-beautify'
Plugin 'Chiel92/vim-autoformat'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/undotree.vim'
Plugin 'django.vim'
Plugin 'python.vim'
Plugin 'nginx.vim'
Plugin 'othree/html5.vim'
Plugin 'groenewege/vim-less'

call vundle#end() " required
set encoding=utf-8

filetype plugin on
filetype plugin indent on
syntax enable

" With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" keep 50 lines of command line history
set history=50

" Show (partial) command in status line.
set showcmd

" Show matching brackets.
set showmatch

" Set to not auto read when a file is changed from the outside
set noautoread

" Don't automatically save before commands like :next and :make
set noautowrite

" Don't make buffers hidden when abandoned
set nohid

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*.so,*.swo,*.swp,*.pyc,*.pyo,*~
let NERDTreeIgnore=['\.egg-info$','\.o$','\.so$','\.swo$','\.swp$','\.pyc$','\.pyo$','\~$']

" No case insensitive matching
set noignorecase

" Turn of smart case matching
set nosmartcase

" Incremental search
set noincsearch

" Highlight search results
set hlsearch

" Apply substitutions to all lines by default
set nogdefault

set mouse=a        " Enable mouse usage (all modes)

" always set autoindenting on
set autoindent
set nosmartindent

" Use spaces instead of tabs
set expandtab
set tabstop=4
set softtabstop=4
set smarttab
set shiftwidth=4
set wrap

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Fold using filetype syntax
set foldmethod=syntax
set foldlevel=999	" open all folds


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" set 7 lines to the cursor
set so=7

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Numbering style
"set number
set relativenumber

" No backups or swapfiles and global undo
set nobackup
set noswapfile
if has("persistent_undo")
    set undodir=$HOME/.vimundo
    set undofile
endif
"set nowb
"set viminfo^=%
"set viminfo='100,:200,<50,s10,h

" Undotree
nnoremap <F5> :UndotreeToggle<cr>

set esckeys

" Don't use Ex mode, use Q for formatting
map Q gq

" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Remap VIM 0 to first non-blank character
map 0 ^

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
    set switchbuf=useopen,usetab",newtab
    set stal=2
catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
    nmap <D-j> <M-j>
    nmap <D-k> <M-k>
    vmap <D-j> <M-j>
    vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc

" Colorize column at 80 characters
set colorcolumn=80
highlight ColorColumn guibg=#cccccc ctermbg=darkgray
highlight Folded ctermfg=6 ctermbg=0

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    set t_Co=256
    " If using a dark background within the editing area and syntax highlighting
    " turn on this option as well
    set background=dark
    "set term=xterm
    let g:solarized_termcolors=16
    let g:solarized_contrast="high"
    let g:solarized_visibility="high"
    let g:solarized_termtrans=1
    colorscheme solarized
endif


" salt

"nnoremap / /\v " use python/perl style regex
"vnoremap / /\v
nnoremap <tab> %
vnoremap <tab> %
map <Esc>[H  <Home>
map <Esc>[F  <End>
map <F4> <Esc>:%s/\s\+$//g<CR>
nmap <leader>w :w!<cr>
set pastetoggle=<F2>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell! spelllang=en_gb<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" NERDTree
nmap <leader>y :NERDTreeToggle<cr>

" Insert modeline at top of file
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! InsertModeline(onlyft)
    if a:onlyft
        let l:modeline = printf(" vim: set filetype=%s :", &filetype)
    else
        let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d %set :",
            \ &filetype, &tabstop, &shiftwidth, &textwidth,
            \ &expandtab ? '' : 'no')
    endif
    let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
    let l:modeline = substitute(l:modeline, '\/', '\\/', "g")
    call CmdLine("1s/^/" . l:modeline . "\\r/<CR><C-o>")
endfunction
nnoremap <silent> <Leader>ml :call InsertModeline(0)<CR>
nnoremap <silent> <Leader>mf :call InsertModeline(1)<CR>


function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

cnoremap mkd !mkdir -p <c-r>=expand("%:h")<cr>

" nerdtree
let NERDTreeShowHidden=1

" powerline
let g:Powerline_symbols = 'fancy'

" vim-jedi
let g:jedi#popup_on_dot = 0
"let g:jedi#show_function_definition = "0"
let g:jedi#show_call_signatures = "0"

" Auto-wrap git commit lines
au FileType gitcommit set tw=72

set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim

" CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_extensions = ['tag', 'undo', 'mixed']

" vim-gitgutter
let g:gitgutter_enabled = 0
nmap <F12> :GitGutterToggle<cr>
nmap <C-F12> :GitGutterLineHighlightsToggle<cr>

" errors
noremap <F7> :Errors<cr>

" autoformat
noremap <F3> :Autoformat<CR><CR>
let g:formatprg_args_cs = '--mode=cs --style=linux --indent=spaces=4'
let g:formatprg_args_c = '--mode=c --style=linux --indent=spaces=4'
let g:formatprg_java = 'astyle'
let g:formatprg_args_java = '--mode=java --style=linux --indent=spaces=4'

" syntastic
let g:syntastic_python_checkers=['flake8', 'python']
let g:syntastic_html_checkers=['tidy',]

" Set filetype
autocmd BufRead,BufNewFile,FileReadPost *.html set filetype=htmldjango
autocmd BufRead,BufNewFile,FileReadPost *.json set filetype=json
autocmd BufRead,BufNewFile,FileReadPost *.less set filetype=less
autocmd BufRead,BufNewFile,FileReadPost *.py set filetype=python
autocmd BufRead,BufNewFile,FileReadPost *.sls set filetype=sls
autocmd BufRead,BufNewFile,FileReadPost *.vcl set filetype=vcl

autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python
autocmd BufRead,BufNewFile,FileReadPost *.js source ~/.vim/javascript

autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


" Source a local configuration file if available
if filereadable("~/.vimrc.local")
    source ~/.vimrc.local
endif
