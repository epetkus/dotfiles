" Remap leader key
let mapleader = ","

" Show line numbers (relative)
set number relativenumber
set nu rnu

" Reandom configs
filetype plugin on

" Show lightline
set laststatus=2

" Enable system clipboard
set clipboard+=unnamedplus

" 1 tab to 2 space 
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Turn off vi compatibility
set nocompatible

" indetation
set smartindent
set autoindent

 " load indent file for the current filetype
filetype indent on

call plug#begin('~/.vim/plugged')
" NERDTree (file tree sidebar)
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'

" Bringin colours
Plug 'kien/rainbow_parentheses.vim'
Plug 'luochen1990/rainbow'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'

" Autocomplete all the things
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'

" Rails
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Formatting
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

" FZF config
" use both ctrl+p and ctrl+t
nnoremap <silent> <C-t> :FZF -m<cr>
nnoremap <silent> <C-p> :FZF -m<cr>

nnoremap <silent> <C-f> :Rg<CR>

" Airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='cobalt2'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 1

" start tmuxline even without vim running
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
	inoremap <silent><expr> <c-space> coc#refresh()
else
	inoremap <silent><expr> <c-@> coc#refresh()
endif

