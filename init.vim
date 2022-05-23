syntax on

set encoding=utf-8

set exrc
"set guicursor=
"set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set noswapfile
set nobackup
set undodir=/home/martin/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes

" Give more space for displaying messages
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('/home/martin/.config/nvim/autoload/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'mbbill/undotree'
call plug#end()

colorscheme gruvbox
set background=dark
highlight Normal guibg=none

let mapleader = " "
"noremap <leader>ps :lua require('telescope.builtin').grep_string { search = vim.fn.input("Grep For > ")}<CR>
noremap <C-p>      :lua require('telescope.builtin').git_files()<CR>
noremap <leader>pf :lua require('telescope.builtin').find_files()<CR>

"noremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fm.expand("<cword>") }<CR>
noremap <leader>pb :lua require('telescope.builtin').buffers()<CR>
noremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>

" WM stuff
noremap <leader>vs :vsp
noremap <leader>hs :sp
" Terminal
noremap <leader>ts :sp<bar>term<cr><c-w>J:resize 10<cr>
" Moving between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

" terminal
noremap <leader>vt :vsp terminal
noremap <leader>ht :sp terminal

" Saving/Quitting
noremap <leader>q :q
noremap <leader>w :w

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup AutoGroupMH
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END
