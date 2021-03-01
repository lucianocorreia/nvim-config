call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
call plug#end()

syntax enable

set number
set relativenumber
set hidden
set mouse=a

set inccommand=split

set background=dark
"colorscheme onedark
colorscheme gruvbox

" commandos
let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>

nnoremap <leader>ww :w!<CR>

