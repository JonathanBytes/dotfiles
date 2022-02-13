set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set relativenumber
set laststatus=2
set noshowmode
"set termguicolors 


call plug#begin('~/.vim/plugged')

" Temas
Plug 'morhetz/gruvbox'

" Motion 
Plug 'easymotion/vim-easymotion'
Plug 'jdhao/better-escape.vim'
Plug 'christoomey/vim-tmux-navigator'

" Files
Plug 'scrooloose/nerdtree'

" Icons
Plug 'kyazdani42/nvim-web-devicons'

" Git implementation
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
let NERDTreeQuitOnOpen=1
let mapleader=' '

nmap <Leader>s <Plug>(easymotion-s2)

let g:better_escape_shortcut = 'jk'

nmap <Leader>e :NERDTreeToggle<CR>
nmap <C-n> :NERDTreeClose<CR>
