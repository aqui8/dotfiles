" TODO follow sym links
call plug#begin()
Plug 'tpope/vim-sensible'
Plug '29decibel/codeschool-vim-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'benekastah/neomake'
Plug 'junegunn/rainbow_parentheses.vim'
" TODO sexp
call plug#end()

exec 'set rtp+=' . fnamemodify(resolve(expand('~/.config/nvim/init.vim')), ':h')

if has("gui_running")
    colorscheme codeschool
endif

set nu
set nowrap
set tabstop=4
set shiftwidth=4
set softtabstop=4

inoremap jk <Esc>

let mapleader = "\<Space>"

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop> 

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop> 

vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"stay selected when visual mode indenting
vmap < <gv
vmap > >gv

"tabs
nnoremap tc :tabc<CR>
nnoremap tn :tabe<CR>
nnoremap <C-w>> gt
nnoremap <C-w>< gT

" tab navigation like browser
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

"Set current buffer to directory
nnoremap <leader>vd :cd %:p:h<CR>

" Apply file
nnoremap <leader>vr :so %<CR>

noremap … :call NERDComment(1, 'toggle')<CR>

nnoremap <leader>o <C-^>
nnoremap <leader>d :Explore<CR>

runtime fzf.vim
runtime fugitive.vim
runtime neomake.vim
