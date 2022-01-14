set term=xterm-256color
set shiftwidth=4
set tabstop=4
set expandtab
set number
set ttymouse=xterm2
set mouse=a
set autoindent

"\e[H":beginning-of-line
"\e[F":end-of-line

filetype plugin on
let g:pydiction_location = '/home/evan/.vim/Pydiction/complete-dict' 
set background=dark
let g:solarized_termcolors = 255 
colorscheme solarized 


command F FZF

set showcmd

autocmd BufWritePost .vimrc source %

nnoremap <C-c> :w <Enter>:! clear ;g++ -o  %:r.out % -std=c++11; ./%:r.out<Enter>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set shellcmdflag=-ic

set rtp+=~/.fzf

set hlsearch
"highlights search terms. :noh to clear

set showmatch

set ignorecase
set smartcase
"case insensitive searching
"Adding \c or \C to a search will force sensitive or insensitive searching

"for transparenR:t
"set term=screen-256color
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi NonText guibg=NONE ctermbg=NONE
:highlight NonText ctermbg=none


function! RgDir(isFullScreen, args)
    let l:restArgs = [a:args]

    let l:restArgs = split(l:restArgs[0], '-pattern=', 1)
    let l:pattern = join(l:restArgs[1:], '')

    let l:restArgs = split(l:restArgs[0], '-path=', 1)
    " Since 8.0.1630 vim has a built-in trim() function
    let l:path = trim(l:restArgs[1])

    call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case " .. shellescape(l:pattern), 1, {'dir': l:path}, a:isFullScreen)
endfunction

" the path param should not have `-pattern=`
command! -bang -nargs=+ -complete=dir RgD call RgDir(<bang>0, <q-args>)
command! -bang -nargs=+ RgD call RgDir(<bang>0, <q-args>)
command! -nargs=* Xyz :call RgDir(<bang>0,'-path= '.<q-args>. ' -pattern=')
nnoremap <leader>zd :RgD -path= . -pattern=

