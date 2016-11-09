"""""""""""VUNDLE-STUFF"""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/plugin/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Plugins here
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rkulla/pydiction.git'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on
""""""""""""END""""""""""""""""""""""""

""""""""""""""Airline(statusbar)""""""""""""
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'serene'

""""""""""""""Splits"""""""""""""""""""""""""
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

""""""""""""""Python Stuff""""""""""""""""""""
let g:pydiction_location = '/home/skippy/.vim/bundle/pydiction/complete-dict'
autocmd FileType python set foldmethod=indent
nnoremap <space> za
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

autocmd BufWritePost *.py call Flake8()
let python_highlight_all=1
syntax on

""""""""""""""""""Misc"""""""""""""""""""""""""""
let mapleader=" "
set nu
set clipboard=unnamed

"""""""""""""""""""Netrw(file explorer)""""""""""""""
nmap <silent> <f2> :Lexplore<cr>
let g:netrw_browse_split = 4
let g:netrw_altv = 1

"""""""""""""""""""Spell checking toggle""""""""""""""""
set spell spelllang=en_us
nn <F6> :setlocal spell! spell?<CR>

""""""""""""""""""""better colors"""""""""""""""""""""""""
colorscheme zenburn
set background=light

""""""""""""""""""""custom execution hacks""""""""""""""""""
nmap <silent> <F5> :!python %<CR>
nmap <silent> <F4> :!

""""""""""""""""""""Buffers and custom exits""""""""""""""
set hidden
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>d :q<CR>
nmap <leader>w :wq<CR>

""""""""""""""""""""""text width and terminal colors""""""""""""""""
set tw=79
set t_Co=256
