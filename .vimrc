" vimrc

let g:plugin_manager = "plugged"

" Basics
set nocompatible
set nobackup		" don't save ~ backup files
set noswapfile
set autoread		" auto read file when changed from outside
set wrap
set showbreak=>
filetype plugin indent on	" Enable file type detection.
set noerrorbells
set novisualbell
set vb t_vb=
set viminfo^=%
set mouse=a
let g:netrw_dirhistmax = 0
set nomousehide
set mousemodel=popup
set encoding=utf-8
if v:progname =~? "evim"
	finish
endif

if !empty($TMUX)
	let &t_8f="\e[38;2;%ld;%ld;%ldm"
	let &t_8b="\e[48;2;%ld;%ld;%ldm"
	"set t_ku=OA
	"set t_kd=OB
	"set t_kr=OC
	"set t_kl=OD
endif

"Keys:
set backspace=indent,eol,start
map Q gq
set whichwrap=<,>,h,l
set nohidden

" Commands and Wild Menu
set history=50		" keep 50 lines of command line history
set cmdheight=2		" Command line height in lines
set wildmenu
set wildmode=longest:full,full
set wildignore=*.o,*~,*.pyc,*.a,*.so,*.zip,*.rar,*.swp,*/tmp/*,*/vendor/*,*.exe,*.dll


" Paste
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode

set clipboard^=unnamedplus

" Folds
set foldmethod=marker
nnoremap <space> za
nnoremap zO zR
nnoremap zC zM
set diffopt+=context:99999	" no folds in diffs

" Search
set incsearch		" do incremental searching
set hlsearch		" Highlight search matches
set ignorecase		" Ignore case on searches
set smartcase
"set magic		" Regex magic mode
set showmatch		" show matching (brackets)
set mat=2		" Tenth of a second to blink matching brackets

" Indent
set autoindent
set smartindent
set smarttab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab


" Extensions
if g:plugin_manager == 'pathogen'
	execute pathogen#infect()
	execute pathogen#helptags()
endif
"
"vim-plug:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if g:plugin_manager == 'plugged'
	call plug#begin('~/.vim/plugged')
	Plug 'majutsushi/tagbar'
	Plug 'kien/ctrlp.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'notpratheek/vim-luna'
	Plug 'scrooloose/nerdtree'
	"Plug 'crusoexia/vim-monokai'
	"Plug 'KeitaNakamura/neodark.vim'
	Plug 'kamwitsta/nordisk'
	Plug 'tyrannicaltoucan/vim-quantum'
	Plug 'tpope/vim-fugitive'
	Plug 'airblade/vim-gitgutter'
	Plug 'nanotech/jellybeans.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'scrooloose/syntastic'
	Plug 'davidhalter/jedi-vim'
	Plug 'bruno-/vim-man'
	Plug 'klen/python-mode'
	Plug 'rking/ag.vim'
	Plug 'itchyny/vim-cursorword'
	Plug 'mileszs/ack.vim'
	Plug 'arcticicestudio/nord-vim'
	call plug#end()
endif

let g:pymode_rope = 0
let g:pymode_doc = 0
let g:pymode_doc_key = '<leader>pk'
let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8']
let g:pymode_lint_write = 1
let g:pymode_virtualenv = 1
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>pb'
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_folding = 0

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<C-\\>"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>c"

let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 45
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
nmap <C-O> :CtrlPBufTagAll<CR>
nmap <C-L> :CtrlPTag<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:ctrlp_buftag_ctags_bin = 'ctags'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['module.conf']
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|hg|svn|cmadmin|lost+found)|(CMpub|linux50))$',
	\ 'file': '\v\.(exe|so|dll|gif|jpg|jpeg|png|lnk|zip|rar|gz|tar|db)$',
	\ }

let g:airline_powerline_fonts = 1

nmap <F8> :TagbarToggle<CR>
nnoremap <F9> :NERDTreeToggle<CR>
map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" let g:ackprg = 'ag --vimgrep --smart-case'
" cnoreabbrev ag Ack
" cnoreabbrev aG Ack
" cnoreabbrev Ag Ack
" cnoreabbrev AG Ack


let g:ctrlp_cache_dir = $HOME.'/.ctrlpcache'
let g:ctrlp_clear_cache_on_exit = 0
let g:session_autoload = 'no'
let g:session_autosave = 'no'
if has("cscope")
	set csprg='cscope'
	set csto=0
	set cst
	if filereadable("cscope.out")
		cs add cscope.out
	endif
endif
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['eslint']

" Tabs and Windows
set splitright
set splitbelow
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h

"noremap <Right> :tabnext<CR>
"noremap <Left> :tabprevious<CR>
"noremap <Up> :tabnew<CR>
"noremap <Down> <nop>
nnoremap <Tab> <C-W>w

"Tab navigation like Firefox.
" nnovemap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

nnoremap <C-S-A-Right>  :tabnext<CR>
nnoremap <C-S-A-Left>  :tabprev<CR>

" nnoremap th  :tabfirst<CR>
" nnoremap tj  :tabnext<CR>
" nnoremap tk  :tabprev<CR>
" nnoremap tl  :tablast<CR>
" nnoremap tt  :tabedit<Space>
" nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
" nnoremap td  :tabclose<CR>
" Alternatively use
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>


" map <leader>tn :tabnew<CR>
" map <leader>tl :tabnext<CR>
" map <leader>th :tabprevious<CR>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Leader
let mapleader=','
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>vr :registers<CR>
nnoremap <leader>vb :buffers<CR>
nnoremap <leader>vm :marks<CR>
nnoremap <leader><leader> :pc<CR>
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>eb :tabe $HOME/.bashrc<CR>
nnoremap <leader>ec :tabe $HOME/.cshrc<CR>
nnoremap <leader>eg :tabe $HOME/.gitconfig<CR>
nnoremap <leader>et :tabe $HOME/.tmux.conf<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>rp :CtrlPClearCache<CR>
nnoremap <leader>ru :PlugUpdate<CR>
nnoremap <leader>dd :call DiffToggle()<CR>
nnoremap <leader>gs :!git status<CR>
nnoremap <leader>gd :!git diff %<CR>
nnoremap <leader>vc :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
nnoremap <leader>vx :echo synIDattr(synID(line("."),col("."),1),"name")<CR>
nmap <leader>m <Plug>(Vman)

" View
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set number		" Line numbers
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
set laststatus=2
set scrolloff=10
syntax enable
set cursorline
set list lcs=trail:·,tab:»\ 
set colorcolumn=80
"let g:Powerline_symbols = 'fancy'
set background=dark
set termguicolors
if has("gui_running")
	if has("gui_gtk2")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
	elseif has("gui_win32")
		set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
	endif
else
	"let g:solarized_termcolors=256
	"Only for monokai
	"set t_Co=256

	"let g:quantum_black=1
	let g:quantum_italics=1
	let g:airline_theme='quantum'
endif
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme monokai
"colorscheme neodark
"let g:neodark#background='brown' " black, gray or brown
"colorscheme nordisc
colorscheme quantum



" LastCursorPosition
augroup vimrcEx
au!
autocmd FileType text setlocal textwidth=78
autocmd FileType python call PyTabStop()
autocmd FileType javascript call JsTabStop()
autocmd FileType yaml call JsTabStop()
autocmd FileType json call JsTabStop()
autocmd FileType ruby call RubyTabStop()
autocmd FileType c,cpp setlocal cindent cinoptions=g-1

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal g`\"" |
	\ endif

augroup END

augroup GitCommitMessage
au!
autocmd BufRead,BufNewfile,BufEnter COMMIT_EDITMSG setlocal colorcolumn=50
augroup END

augroup DetectFileTypes
au!
autocmd BufRead,BufNewfile Vagrantfile set filetype=ruby
augroup END

" Functions

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

function! DiffToggle()
	if &diff
		windo diffoff
	else
		windo diffthis
	endif
endfunction

function! TabStop(space, expand)
	execute "setlocal tabstop=".a:space
	execute "setlocal softtabstop=".a:space
	execute "setlocal shiftwidth=".a:space
	if a:expand == 1
		setlocal expandtab
	else
		setlocal noexpandtab
	endif
endfunction

function! PyTabStop()
	call TabStop(4, 1)
endfunction

function! JsTabStop()
	call TabStop(2, 1)
endfunction

function! RubyTabStop()
	call TabStop(2, 1)
endfunction

function! TabTabStop()
	call TabStop(8, 0)
endfunction

set secure

"File config:
" vim:foldmethod=marker

