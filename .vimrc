set term=xterm-256color
set shiftwidth=4
set tabstop=4
set expandtab
set number
set ttymouse=xterm2
set mouse=n
set autoindent

"\e[H":beginning-of-line
"\e[F":end-of-line

filetype plugin on
let g:pydiction_location = '/home/evan/.vim/Pydiction/complete-dict' 

colorscheme distinguished

command F FZF

set showcmd

autocmd BufWritePost .vimrc source %

nnoremap <C-c> :w <Enter>:! clear ;g++ -o  %:r.out % -std=c++11; ./%:r.out<Enter>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set rtp+=~/.fzf
