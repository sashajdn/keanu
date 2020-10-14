""" --- Keanu NeoVimRC


""" --- Leader
	nnoremap <SPACE> <Nop>
	let mapleader =" "


""" --- Plugin Manager
	call plug#begin('~/.vim/plugged')

	"" Airline
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-rooter'

	"" ALE
	Plug 'dense-analysis/ale'

	"" CoC
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile && yarn build'}

	"" I3
	Plug 'PotatoesMaster/i3-vim-syntax'
	
	"" FZF
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	"" Go
	Plug 'fatih/vim-go'

	"" Golden Ratio
	Plug 'roman/golden-ratio'

	"" GOYO
	Plug 'junegunn/goyo.vim'

	" Haskell
	Plug 'neovimhaskell/haskell-vim'

	"" Highlighting
	Plug 'haya14busa/incsearch.vim' " Vim Tree

	"" Tree
	Plug 'scrooloose/nerdtree'

	"" Theme
	Plug 'liuchengxu/space-vim-theme'

	call plug#end()


""" --- Base
	set background=dark
	set nocompatible
	set encoding=utf-8
	set relativenumber
	set noswapfile
	set cursorline
	set hlsearch
	set scrolloff=8
	set splitbelow splitright
	set noshowmode

	set hidden
	set cmdheight=2
	set updatetime=50
	set shortmess+=c

	set clipboard=unnamedplus

	if has("patch-8.1.1564")
		set signcolumn=number
	else
		set signcolumn=yes
	endif

	filetype plugin on
	syntax on

	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	let g:incsearch#auto_nohlsearch = 1


""" --- Mappings

	"" Base
	vnoremap <Leader>p "_dp

	"" ALE
	nmap <silent> <C-p> <Plug>(ale_previous_wrap)
	nmap <silent> <C-n> <Plug>(ale_next_wrap)


	"" COC
	let g:go_def_mapping_enabled = 0
	nmap <silent> <Leader>gd <Plug>(coc-definition)
	nmap <silent> <Leader>gt <Plug>(coc-type-definition)
	nmap <silent> <Leader>gi <Plug>(coc-implementation)
	nmap <silent> <Leader>gr <Plug>(coc-references)

	" Tab Completion
	inoremap <silent><expr> <TAB>
	      \ pumvisible() ? "\<C-n>" :
	      \ <SID>check_back_space() ? "\<TAB>" :
	      \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1] =~# '\s'
	endfunction

	if has('nvim')
		inoremap <silent><expr> <c-space> coc#refresh()
	else
		inoremap <silent><expr> <c-@> coc#refresh()
	endif


	"" FZF
	nnoremap <silent> <C-f> <Esc><Esc>:Files!<CR>
	inoremap <silent> <C-f> <Esc><Esc>:BLines!<CR>
	nnoremap <silent> <C-g> <Esc><Esc>:BCommits!<CR>


	"" GOYO
	noremap <Leader>gy :Goyo \| set linebreak<CR>


	"" NerdTree
	noremap <Leader>t :NERDTreeToggle<CR>
	nnoremap <silent> <Leader>pv :NERDTreeFind<CR>


	"" Vim
	nnoremap S :%s//g<Left><Left>

	nnoremap <silent> <Leader>V :split<CR>
	nnoremap <silent> <Leader>v :vsplit<CR>

	vnoremap < <gv
	vnoremap > >gv	

	nnoremap <Leader>h :wincmd h<CR>
	nnoremap <Leader>j :wincmd j<CR>
	nnoremap <Leader>k :wincmd k<CR>
	nnoremap <Leader>l :wincmd l<CR>


""" --- Backups & Undo
	let target_path = expand('~/.vim/dirs/backups')
        if !isdirectory(target_path)
		call system('mkdir -p ' . target_path)
	endif
        let &backupdir = target_path

	if has('persistent_undo')
	    let target_path = expand('~/.vim/dirs/undos')
	    if !isdirectory(target_path)
		call system('mkdir -p ' . target_path)
	endif
	    let &undodir = target_path
	    set undofile
	endif


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


""" --- Airline
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'onedark'


""" --- ALE
	highlight ALEWarning ctermbg=DarkMagenta
	let g:ale_sign_column_always = 1
	let g:ale_completion_enabled = 0
	let g:ale_completion_auto_import = 1
	let g:ale_lint_on_text_changed = 1
	let g:ale_set_highlights = 1
	let g:ale_disable_lsp = 1

	let g:airline#extensions#ale#enabled = 1

	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

	let g:ale_linters = {
	\	'python': ['pylint', 'flake8', 'isort', 'black', 'mypy'],
	\}


""" --- CoC


""" --- FZF
	let $FZF_DEFAULT_OPTS="--ansi --layout reverse --margin=1,4 --preview 'bat --color=always'"


""" --- Go


""" --- Goyo
	noremap <Leader>gy :Goyo \| set linebreak<CR>


""" --- NerdTree
	noremap <Leader>t :NERDTreeToggle<CR>
	nnoremap <silent> <Leader>pv :NERDTreeFind<CR>


""" --- Python
	if has('python3')
		set pyx=3
	elseif has ('python')
		set pyx=3
	elseif has ('python2')
		set pyx=2
	endif

	au FileType python noremap <Leader>b oimport ipdb; ipdb.set_trace()
	au FileType python noremap <Leader>c odef __init__(self, *args, **kwargs):


""" --- Colour Scheme
	colorscheme space_vim_theme
