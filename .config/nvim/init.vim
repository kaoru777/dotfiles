let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/nvim-tree/nvim-tree.lua
Plug 'nvim-tree/nvim-tree.lua'

if system('uname -s') == "Darwin\n"
  "OSX
  " https://github.com/ms-jpq/coq_nvim
  " main one
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  " 9000+ Snippets
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
endif

Plug 'sainnhe/gruvbox-material'
call plug#end()

let mapleader=","

nnoremap <silent> <n> :NvimTreeToggle<CR>
nnoremap <silent> <leader>f :%!pg_format<CR>

if has('termguicolors')
  set termguicolors
endif

if system('uname -s') == "Darwin\n"
  set background=dark
  "set background=light
  let g:gruvbox_material_background = 'medium'
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material
endif

set number
set relativenumber
set nocompatible
set showmatch
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set path+=**
set wildmenu
set wildignore+=comma,separated,list,of,file,patterns
filetype plugin indent on
syntax on
filetype plugin on
set cursorline


