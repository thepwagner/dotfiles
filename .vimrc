" Colors
set t_Co=256
set bg=dark
color zenburn
let g:zenburn_high_Contrast=1
set guifont=fixed

call plug#begin('~/.vim/plugged')

" file browsing
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'

" formatting
Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'

" languages
Plug 'ekalinin/Dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'vim-ruby/vim-ruby'

call plug#end()

set number
set hidden
syntax on
filetype plugin indent on

set incsearch
set ignorecase
set smartcase
set showmatch
set hlsearch

set undodir=~/.vimundo/
set undofile

set nobackup
set nowritebackup
set noswapfile

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

set laststatus=2
set statusline=%f\ %2*%m\ %1*%h%r%=[%{&encoding}\ %{&fileformat}\ %{strlen(&ft)?&ft:'none'}\ %{getfperm(@%)}]\ 0x%B\ %12.(%c:%l/%L%)

nmap <F8> :TagbarToggle<CR>
map <F2> :NERDTreeToggle<CR>

