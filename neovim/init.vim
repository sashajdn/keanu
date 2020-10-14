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

	"" CoC
	Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
	
	"" FZF
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	"" Go
	Plug 'fatih/vim-go'

	"" Golden Ratio
	Plug 'roman/golden-ratio'

	"" GOYO
	Plug 'junegunn/goyo.vim'

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


	"" COC
	let g:go_def_mapping_enabled = 0
	nmap <Leader>gd <Plug>(coc-definition)
	nmap <Leader>gt <Plug>(coc-type-definition)
	nmap <Leader>gi <Plug>(coc-implementation)
	nmap <Leader>gr <Plug>(coc-references)

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
	nnoremap <silent> <C-p> <Esc><Esc>:Files!<CR>
	inoremap <silent> <C-p> <Esc><Esc>:BLines!<CR>
	nnoremap <silent> <C-g> <Esc><Esc>:BCommits!<CR>


	"" GOYO
	noremap <Leader>gy :Goyo \| set linebreak<CR>


	"" NerdTree
	noremap <Leader>t :NERDTreeToggle<CR>
	nnoremap <silent> <Leader>pv :NERDTreeFind<CR>


	"" Vim
	nnoremap S :%s//g<Left><Left>

	nnoremap <Silent><Leader>h :split<CR>
	nnoremap <Silent><Leader>v :vsplit<CR>

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


""" --- Colour Scheme
	colorscheme space_vim_theme
