""" --- Keanu NeoVimRC


""" --- Leader


""" --- Plugin Manager
	call plug#begin('~/.vim/plugged')

	"" -- CoC
		Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

	"" -- Go
		Plug 'fatih/vim-go'

	"" -- Theme
		Plug 'liuchengxu/space-vim-theme'

	call plug#end()


""" --- Base
	set background=dark
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	set noswapfile
	set cursorline
	autocmd Filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


""" --- Mappings

	"" COC
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent><leader> gt <Plug>(coc-type-definition)
	nmap <silent><leader> gi <Plug>(coc-implementation)
	nmap <silent><leader> gr <Plug>(coc-references)


""" --- CoC
	set hidden
	set cmdheight=2
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes

""" --- Go

	let g:go_def_mapping_enabled = 0


""" --- Colour Scheme
	colorscheme space_vim_theme
