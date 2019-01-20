
" ------------------ Vundle Setting --------------------------------- "
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Keep Plugin commands between vundle#begin/end.
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
"Plugin 'Yggdroot/LeaderF'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-scripts/taglist.vim'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'
Plugin 'simplyzhao/cscope_maps.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'mileszs/ack.vim'
"Plugin 'rking/ag.vim'
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-lua-ftplugin'
"Plugin 'python-mode/python-mode'
Plugin 'tbastos/vim-lua'

call vundle#end()            " required
filetype plugin indent on    " required

" ------------------ VIM Normal Setting --------------------------------- "
syntax on
set number
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=NONE guifg=NONE
set scrolloff=10
"Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ------------------ NERDTree Setting --------------------------------- "
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let NERDTreeAutoCenter=1
let NERDTreeAutoCenterThreshold=3

" ------------------ VIM airline Setting --------------------------------- "
set t_Co=256
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1

" ------------------ Taglist Setting --------------------------------- "
"let Tlist_Auto_Open = 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Inc_Winwidth = 0

" ------------------ python-mode --------------------------------- "
let g:pymode_python = 'python3'



" ------------------ --------------------------------- "
" ------------------ --------------------------------- "
" ------------------ --------------------------------- "
" ------------------ --------------------------------- "
