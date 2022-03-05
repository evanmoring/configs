set shiftwidth=4
set tabstop=4
set expandtab
set number
set ttymouse=xterm2
set mouse=n
set autoindent
set ignorecase          
set smartcase           
set showmatch           
set showmode            

augroup UPDATE_GITBRANCH
  " clear old commands
  autocmd!

  " update git branch
  autocmd BufWritePre * :call UpdateGitBranch()
  autocmd BufReadPost * :call UpdateGitBranch()
  autocmd BufEnter * :call UpdateGitBranch()
augroup END
let g:gitparsedbranchname = ' '

function! UpdateGitBranch()
  let l:string = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  let g:gitparsedbranchname = strlen(l:string) > 0?'['.l:string.']':''
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

set laststatus=2
set statusline=%F\ 
set statusline+="\uE0B2"
set statusline+=%#LineNr#
set statusline+=\ %{getcwd()}
set statusline+=\ %{g:gitparsedbranchname}

set notermguicolors

augroup UPDATE_GITBRANCH
  " clear old commands
  autocmd!

  " update git branch
  autocmd BufWritePre * :call UpdateGitBranch()
  autocmd BufReadPost * :call UpdateGitBranch()
  autocmd BufEnter * :call UpdateGitBranch()
augroup END
let g:gitparsedbranchname = ' '

function! UpdateGitBranch()
  let l:string = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
  let g:gitparsedbranchname = strlen(l:string) > 0?'['.l:string.']':''
endfunction

set laststatus=2
set statusline=%F\ 
set statusline+="\uE0B2"
set statusline+=%#LineNr#
set statusline+=\ %{getcwd()}
set statusline+=\ %{g:gitparsedbranchname}

"set statusline=
"set statusline+=%#PmenuSel#
"set statusline+=%{StatuslineGit()}
"set statusline+=%#LineNr#
"set statusline+=\ %f
"set statusline+=%m\
"set statusline+=%=
"set statusline+=%#CursorColumn#
"set statusline+=\ %y
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %p%%
"set statusline+=\ %l:%c
"set statusline+=\ 


set notermguicolors

"\e[H":beginning-of-line
"\e[F":end-of-line

filetype plugin on
let g:pydiction_location = '/home/evan/.vim/Pydiction/complete-dict' 
let g:solarized_termcolors=255
set background=dark

colorscheme evan 

command F FZF
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'
set showcmd

autocmd BufWritePost .vimrc source %

"nnoremap <C-c> :w <Enter>:! clear ;g++ -o  %:r.out % -std=c++11; ./%:r.out<Enter>
vnoremap <C-c> :norm I
let mapleader = "/"
" leader example
"nnoremap <leader>c :echo 'cat'

nnoremap <C-c> :w <Enter>:! clear ;python3  %:p<Enter>

let mapleader = ","
vnoremap <leader>c :norm I
" leader example
"nnoremap <leader>c :echo 'cat'

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"set shellcmdflag=-ic

set rtp+=~/.fzf

set hlsearch
"highlights search terms. :noh to clear
set ignorecase
set smartcase
"case insensitive searching
"Adding \c or \C to a search will force sensitive or insensitive searching

"for transparenR:t
"set term=screen-256color
"autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
"autocmd vimenter * hi NonText guibg=NONE ctermbg=NONE
:highlight NonText ctermbg=none

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

" Didn't look good with Solarized
" bg used to be Normal 
" bg + used to be CursorLine CursorColumn
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

