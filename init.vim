call plug#begin()
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'elixir-editors/vim-elixir'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

syntax enable

set number
set relativenumber
set hidden
set mouse=a

set encoding=utf-8
set nobackup
set nowritebackup

" Enables filetype detection, loads ftplugin, and loads indent
" (Not necessary on nvim and may not be necessary on vim 8.2+)
filetype plugin indent on

set inccommand=split

set background=dark
colorscheme onedark
"colorscheme gruvbox

" commandos
let mapleader="\<space>"
nnoremap <leader>ev :vsplit ~/.config/nvim/init.vim<CR>

nnoremap <c-p> :Files<CR>
"nnoremap <c-f> :Ag<space>

" NERDTree commands
"nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
