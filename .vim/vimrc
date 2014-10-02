" load any plugins in ~/.vim/bundle
execute pathogen#infect()

let mapleader = ","         " change <leader> command
syntax enable               " use syntax highlighting
filetype plugin indent on   " use filetype-specific indent options

set nocompatible
set nospell spelllang=en_au " don't highlight mispelled words by default
set number                  " show line numbers
set wildmenu                " visual autocomplete for command menu
set showmatch               " highlight matching [{()}]
set incsearch               " search as characters are entered
set ignorecase              " ignore case in search patterns
set encoding=utf-8          " set how vim represents characters internally
set expandtab               " tabs are spaces
set laststatus=2            " makes status lines display
set tabstop=2               " number of visual spaces per TAB
set softtabstop=2           " number of spaces in tab when editing
set shiftwidth=2            " number of spaces to move when ussing >> << and ==
set scrolljump=5            " when scrolling keep 5 lines above/below
set history=3000            " keep 3000 lines of command line history
set undolevels=1000         " 50 undos, saved in undodir
set autoread                " watch for file changes
set noshowmode              " don't show the mode, we have airline
set writebackup             " create a backup of open files
set backupdir=~/tmp/swapfiles//,/tmp//
set directory=~/tmp/swapfiles//,/tmp//
set foldmethod=syntax
set foldlevel=1

" stops folds from opening while in insert method
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" airline
let g:airline_enable_branch = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" map Ctrl-movement to move between window splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" arrow keys are for wusses
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
