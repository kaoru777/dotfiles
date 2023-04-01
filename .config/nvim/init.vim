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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" https://github.com/nvim-tree/nvim-tree.lua
Plug 'nvim-tree/nvim-tree.lua'

" https://github.com/ms-jpq/coq_nvim
" main one
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
" 9000+ Snippets
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}

Plug 'sainnhe/gruvbox-material'
call plug#end()

" Nvim tree
" vim.opt.termguicolors = true
" require("nvim-tree").setup({
"   sort_by = "case_sensitive",
"   renderer = {
"     group_empty = true,
"   },
"   filters = {
"     dotfiles = true,
"   },
" })

let mapleader=","

nnoremap <silent> <n> :NvimTreeToggle<CR>
nnoremap <silent> <leader>f :%!pg_format<CR>

if has('termguicolors')
  set termguicolors
endif
set background=dark
"set background=light
let g:gruvbox_material_background = 'medium'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material

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
filetype plugin indent on
syntax on
filetype plugin on
set cursorline


