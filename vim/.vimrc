" VIMRC


" Install Plugin Manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins Manager
call plug#begin('~/.vim/plugged')
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
call plug#end()

""" ### Basics ### 
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber

" Enable autocompletion:
	set wildmode=longest,list,full

" Goyo plugin, center text relative to screen:
	map <leader>f :Goyo \| set linebreak<CR>

" Spell-check set to <leader>o:
	map <leader>o :setlocal spell! spelllang=en_gb<CR>

" Splits open at the bottom and the right:
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

""" ### Identatation ###

" Python
au BufNewFile,BufRead *.py
    \ set expandtab	|"  replace tabs with spaces
    \ set autoindent    |"  copy indent when starting a new line
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
