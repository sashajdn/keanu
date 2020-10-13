""" --- Keanu NeoVimRC


""" --- Leader
	let mapleader = ' ' 


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

	filetype plugin on
	syntax on

	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	let g:incsearch#auto_nohlsearch = 1


""" --- Mappings

	"" COC
	nnoremap <Leader> gd <Plug>(coc-definition)
	nnoremap <Leader> gt <Plug>(coc-type-definition)
	nnoremap <Silent> <Leader> gi <Plug>(coc-implementation)
	nnoremap <Silent> <Leader> gr <Plug>(coc-references)

	"" Vim
	nnoremap S :%s//g<Left><Left>

	nnoremap <silent> <Leader>h :split<CR>
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
	set noshowmode


""" --- CoC
	set hidden
	set cmdheight=2
	set updatetime=50
	set shortmess+=c
	set signcolumn=yes


""" --- FZF


""" --- Go
	let g:go_def_mapping_enabled = 0

	autocmd Filetype go setlocal ts=4 sw=4 sts=4S colorcolumn=99 expandtab


""" --- Colour Scheme
	colorscheme space_vim_theme
