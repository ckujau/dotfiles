"
" ~/.vimrc
"
set background=dark		" Use 'light' otherwise
set encoding=utf-8		" default: 'latin1'
set nohlsearch			" Don't highlight search results
set noincsearch			" No incremental search
set nolist			" Don't show tabs
set nomodeline			" CVE-2019-12735
set nonumber			" Don't show line numbers
set ruler			" Show ruler
set showcmd			" Show (partial) command in status line
set showmatch			" Show matching brackets
set t_ti= t_te=			" Don't blank on exit
set viminfo='100,<1000,s10,h	" Raise register buffer to 1000
" set lcs+=space:·		" Print spaces as dots when 'list' is active.
" set shiftwidth=4		" Number of spaces (auto)indent
" set tabstop=4			" Number of spaces for <Tab>
" set textwidth=80		" To be used interactively, with gq}
" set backupcopy=yes		" Make a copy of the file and overwrite the original one
" set writebackup		" Make a backup before overwriting a file.

" Syntax highlighting
if has("syntax")
	syntax on
"	colorscheme murphy
endif

" Jump to the last cursor position upon reopening a file
if has("autocmd")
	autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
