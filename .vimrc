" vimrc

let $BASH_ENV = "~/.bash_alias"
let g:plugin_manager = "plugged"

" Basics
set nocompatible
set backup		" save  backup files
set noswapfile
set autoread		" auto read file when changed from outside
set wrap
set showbreak=>
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
endif

" Keys:
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
filetype plugin indent on	" Enable file type detection.
set smarttab
set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
set nofixendofline


" Extensions
"  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
if g:plugin_manager == 'pathogen'
	execute pathogen#infect()
	execute pathogen#helptags()
endif

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
	Plug 'kamwitsta/nordisk'
	Plug 'tyrannicaltoucan/vim-quantum'
	Plug 'tpope/vim-fugitive'
	Plug 'nanotech/jellybeans.vim'
	Plug 'pangloss/vim-javascript'
	Plug 'jelera/vim-javascript-syntax'
	Plug 'scrooloose/syntastic'
	Plug 'davidhalter/jedi-vim'
	Plug 'bruno-/vim-man'
"	Plug 'klen/python-mode'
"	Plug 'rking/ag.vim'
	Plug 'itchyny/vim-cursorword'
	Plug 'mileszs/ack.vim'
	Plug 'arcticicestudio/nord-vim'
	Plug 'jnurmine/Zenburn' "Colorscheme that should be better for the eyes`
	call plug#end()
endif

" python-mode config
" let g:pymode_rope = 0 " use jedi instead of rope
" let g:pymode_doc = 0
" let g:pymode_doc_key = '<leader>pk'
" let g:pymode_lint = 1
" let g:pymode_lint_checkers = ['pyflakes', 'pep8']
" let g:pymode_lint_write = 1
" let g:pymode_virtualenv = 1
" let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_bind = '<leader>pb'
" let g:pymode_syntax = 1
" let g:pymode_syntax_all = 1
" " let g:pymode_syntax_indent_errors = g:pymode_syntax_all
" " let g:pymode_syntax_space_errors = g:pymode_syntax_all
" let g:pymode_folding = 0

" jedi-vim config
let g:jedi#goto_command = "<leader>pd"
let g:jedi#goto_assignments_command = "<leader>pg"
let g:jedi#goto_definitions_command = "<leader>pd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>pn"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>pr"

" nerdtree config
let g:NERDTreeWinPos = 'right'
let g:NERDTreeWinSize = 45
nnoremap <F9> :NERDTreeToggle<CR>

" tagbar config
let g:tagbar_width = 40
let g:tagbar_autofocus = 1
let g:tagbar_compact = 1
let g:tagbar_sort = 0
let g:tagbar_ctags_bin = 'ctags'
nmap <F8> :TagbarToggle<CR>

nmap <C-\> :cs find s <cword><CR>

" ctrlp config
let g:ctrlp_extensions = ['tag', 'buffertag']
let g:ctrlp_buftag_ctags_bin = 'ctags'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/](\.(git|hg|svn|cmadmin|lost+found)|(CMpub|linux50))$',
	\ 'file': '\v\.(exe|so|dll|gif|jpg|jpeg|png|lnk|zip|rar|gz|tar|db)$',
	\ }
let g:ctrlp_cache_dir = $HOME.'/.ctrlpcache'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_extensions = ['tag', 'buffertag']
nmap <C-O> :CtrlPBufTagAll<CR>
nmap <C-L> :CtrlPTag<CR>

" airline config
let g:airline_powerline_fonts = 1

" ag/ack configuration
" let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack!
cnoreabbrev aG Ack!
cnoreabbrev Ag Ack!
cnoreabbrev AG Ack!

if executable('ag')
  let g:ackprg = 'agv --vimgrep'
endif

map <F4> :Ack <cword><cr>

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

" syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_tex_checkers=[]
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" Tabs and Windows
set splitright
set splitbelow
noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-l> <C-W>l
noremap <C-h> <C-W>h
nnoremap <Tab> <C-W>w

"Tab navigation like Firefox.
" nnovemap <C-S-tab> :tabprevious<CR>
" nnoremap <C-tab>   :tabnext<CR>
" nnoremap <C-t>     :tabnew<CR>
" inoremap <C-S-tab> <Esc>:tabprevious<CR>i
" inoremap <C-tab>   <Esc>:tabnext<CR>i
" inoremap <C-t>     <Esc>:tabnew<CR>

" Alternatively use
nnoremap tl :tabnext<CR>
nnoremap th :tabprev<CR>
nnoremap tn :tabnew<CR>
nnoremap tm  :tabm<Space>

" j k move through wrap
nnoremap j gj
nnoremap k gk

" Leader Shortcuts
let mapleader=','
nnoremap <leader>/ :nohlsearch<CR>
nnoremap <leader>vr :registers<CR>
nnoremap <leader>vb :buffers<CR>
nnoremap <leader>vm :marks<CR>
nnoremap <leader><leader> :pc<CR>
nnoremap <leader>ev :tabe $MYVIMRC<CR>
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

" Theme and fonts
set background=dark
set termguicolors
if has("gui_running")
	if has("gui_gtk2")
		set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
	elseif has("gui_win32")
		set guifont=DejaVu_Sans_Mono_for_Powerline:h10:cANSI
	endif
else
	"let g:quantum_black=1
	let g:quantum_italics=1
	let g:airline_theme='quantum'
endif
"let g:solarized_termcolors=256
colorscheme quantum


" When editing a file, always jump to the last known cursor position.
augroup LastCursorPosition
au!
autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\	exe "normal g`\"" |
	\ endif

augroup END

augroup DetectFileTypes
au!
autocmd BufRead,BufNewfile Vagrantfile set filetype=ruby
autocmd FileType text setlocal textwidth=78
autocmd FileType python call FourSpacesTabStop()
autocmd FileType javascript call TwoSpacesTabStop()
autocmd FileType yaml call TwoSpacesTabStop()
autocmd FileType json call TwoSpacesTabStop()
autocmd FileType ruby call TwoSpacesTabStop()
autocmd FileType c,cpp setlocal cindent cinoptions=g-1
autocmd FileType rst call FourSpacesTabStop()
autocmd FileType markdown call FourSpacesTabStop()
autocmd FileType gitcommit setlocal colorcolumn=50
autocmd FileType dockerfile call FourSpacesTabStop()
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

function! FourSpacesTabStop()
	call TabStop(4, 1)
endfunction

function! TwoSpacesTabStop()
	call TabStop(2, 1)
endfunction

function! TabTabStop()
	call TabStop(8, 0)
endfunction

set secure

