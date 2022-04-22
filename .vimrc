set shiftwidth=4
set tabstop=4
set expandtab
set number
set ttymouse=xterm2
set mouse=a
set autoindent
set showmatch           
set showmode            
" turn off bell sound
set visualbell
" Without this ESC causes a one second hang
set ttimeoutlen=100
" diff split next to each other
set diffopt+=vertical
set laststatus=2
set statusline=%F\ 
set statusline+="\uE0B2"
set statusline+=%#LineNr#
set statusline+=\ %{getcwd()}
set statusline+=\ %{FugitiveStatusline()}
set notermguicolors
set hlsearch
"highlights search terms. :noh to clear
set ignorecase
set smartcase
"case insensitive searching
"Adding \c or \C to a search will force sensitive or insensitive searching
set rtp+=~/.fzf
let g:solarized_termcolors=255
set background=dark
let g:completor_python_binary = '/usr/bin/python3'
let g:completor_clang_binary = '/usr/bin/clang'
syntax on
filetype plugin on
colorscheme evan 
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
set showcmd

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Lines                     
  \ call fzf#vim#lines(<q-args>, <bang>0)'

command F FZF

autocmd BufWritePost .vimrc source %

"nnoremap <C-c> :w <Enter>:! clear ;g++ -o  %:r.out % -std=c++11; ./%:r.out<Enter>
nnoremap <C-c> :w <Enter>:bo term ++rows=10 ++close bash -c "g++ -o  %:r.out % -std=c++11 && %:r.out; echo ''; bash "<Enter>
"nnoremap <C-c> :w <Enter>:! clear ;python3  %:p<Enter>
let mapleader = ","
vnoremap <leader>c :norm I

" use w!! to write with sudo
cmap w!! w !sudo tee % >/dev/null
" leader example
"nnoremap <leader>c :echo 'cat'
"
" Make navigative windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


function! RgDir(...)
    if a:0 > 0
        let l:path = a:1 
    else
        "let l:path = $ws
        let l:path ="."
    endif
    let l:pattern = ''
    call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(l:pattern), 1, fzf#vim#with_preview({'dir':l:path}), 0)
endfunction

command! -bang -nargs=* S call RgDir(<f-args>)

" FZF search hotkeys
map <C-f> :Rg<CR>
map <C-p> :F<CR>
map <C-l> :BLines<CR>

let g:fzf_colors =
            \ { 'fg':    ['fg', 'Normal'],
            \ 'bg':      ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl':      ['fg', 'Comment'],
            \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':     ['bg', 'Keyword'],
            \ 'hl+':     ['fg', 'Statement'],
            \ 'info':    ['fg', 'PreProc'],
            \ 'border':  ['fg', 'Ignore'],
            \ 'prompt':  ['fg', 'Conditional'],
            \ 'pointer': ['fg', 'Exception'],
            \ 'marker':  ['fg', 'Keyword'],
            \ 'spinner': ['fg', 'Label'],
            \ 'header':  ['fg', 'Comment'] }
