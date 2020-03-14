""" --- Keanu VIMRC --- """

""" --- Leader
let mapleader =" "

""" --- Colours
set t_Co=256

""" --- Plugin Manager Install
	if empty(glob('~/.vim/autoload/plug.vim'))
		silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
					\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
		autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

""" --- Plugin Manager
	call plug#begin('~/.vim/plugged')
	" Code
	Plug 'ervandew/supertab'
	Plug 'scrooloose/nerdcommenter'
	" Navigation
	Plug 'scrooloose/nerdtree'
	" Highlighting
	Plug 'haya14busa/incsearch.vim' " Vim Tree
	" Fuzzy Finder
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '/.install --all' }
	Plug 'junegunn/fzf.vim'
	" Syntax Highlighting
	Plug 'junegunn/goyo.vim'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'dense-analysis/ale'
	" Python
	Plug 'vim-scripts/indentpython.vim'
	Plug 'kh3phr3n/python-syntax'
	" Theme
	Plug 'liuchengxu/space-vim-theme'

	call plug#end()

""" --- Basics
	set nocompatible
	filetype plugin on
	filetype indent on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set noswapfile
	set colorcolumn=100
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""" --- File Storage
	set directory=~/.vim/dirs/tmp
	set backup
	set backupdir=~/.vim/dirs/backups
	set undofile
	set undodir=~/.vim/dirs/undos
	set viminfo+=n~/.vim/dirs/viminfo

	if !isdirectory(&backupdir)
		call mkdir(&backupdir, "p")
	endif

	if !isdirectory(&directory)
		call mkdir(&directory, "p")
	endif

	if !isdirectory(&undodir)
		call mkdir(&undodir, "p")
	endif

""" --- Operations
	ca w!! w !sudo tee "%"            " Save as sudo by default

""" --- Keybindings
	nnoremap S :%s//g<Left><Left>

""" --- Autocompletion:
	set wildmode=longest,list,full

""" --- Cursor
	if &term =~ "screen."
	    let &t_ti.="\eP\e[1 q\e\\"
	    let &t_SI.="\eP\e[5 q\e\\"
	    let &t_EI.="\eP\e[1 q\e\\"
	    let &t_te.="\eP\e[0 q\e\\"
	else
	    let &t_ti.="\<Esc>[1 q"
	    let &t_SI.="\<Esc>[5 q"
	    let &t_EI.="\<Esc>[1 q"
	    let &t_te.="\<Esc>[0 q"
	endif

""" --- Scrolling
	set scrolloff=3

""" --- Highlighting
	set hlsearch
	let g:incsearch#auto_nohlsearch = 1
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	map g/  <Plug>(incsearch-stay)
	map n  <Plug>(incsearch-nohl-n)
	map N  <Plug>(incsearch-nohl-N)
	map *  <Plug>(incsearch-nohl-*)
	map #  <Plug>(incsearch-nohl-#)
	map g* <Plug>(incsearch-nohl-g*)
	map g# <Plug>(incsearch-nohl-g#)

""" --- Goyo
	map <leader>g :Goyo \| set linebreak<CR>

""" --- NerdTree
	map <leader>f :NERDTreeToggle<CR>
	highlight! link NERDTreeFlags NERDTreeDir

	let NERDTreeIgnore = ['\.pyc$']

""" --- Spell-check
	map <leader>o :setlocal spell! spelllang=en_gb<CR>

""" --- Vim Splits
	set splitbelow splitright
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

	set fillchars+=vert:\

""" --- ALE
	highlight ALEWarning ctermbg=DarkMagenta
	let g:ale_completion_enabled = 1
	let g:ale_lint_on_text_changed = 1
	let g:ale_set_highlights = 1
	let g:ale_linters = {'python': ['pylint', 'flake8', 'isort']}

""" --- Python
	au BufNewFile,BufRead *.py
	    \ set expandtab	|"  replace tabs with spaces
	    \ set autoindent    |"  copy indent when starting a new line
	    \ set tabstop=4
	    \ set softtabstop=4
	    \ set shiftwidth=4
	    \ set fileformat=unix
	    \ set textwidth=99

	au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>
	au FileType python map <silent> <leader>i Odef __init__(self):<esc>

	let python_highlight_all = 1
	highlight pythonDecorator guibg=red

""" --- Front End 
	au BufNewFile,BufRead *.js *.html, *.css
	    \ set tabstop=2
	    \ set softtabstop=4
	    \ set shiftwidth=2

""" --- Whitespace

""" --- Clipboard
set clipboard=unnamedplus

""" --- Theme
colorscheme space_vim_theme
