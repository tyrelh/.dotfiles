set tabstop=4                     " number of spaces a tab shoud be
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number                        " display line numbers
set mouse=a                       " mouse interaction
set scrolloff=4                   " offset lines when scrolling begins

set encoding=utf-8
set fileformat=unix

syntax enable

let mapleader=' '


" Vim Plug
call plug#begin('~/.vim/plugged')  " specify a directory for plugins
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sirver/ultisnips'
" Plug 'Mofiqul/dracula.nvim'
Plug 'joshdick/onedark.vim'
call plug#end()


" theming
colorscheme onedark
let g:airline_theme='onedark'

if (has("termguicolors"))
    set termguicolors
endif

"lua require 'colorizer'.setup()


" nerdcommenter
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv


" nerdtree
let NERDTreeQuitOnOpen=1
nmap <F2> :NERDTreeToggle<CR>


" tabs
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemode=':t'
nmap <leader>1 :bp<CR>
nmap <leader>2 :bn<CR>
nmap <C-w> :bd<CR>


" ultisnips
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/ultisnips']
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


