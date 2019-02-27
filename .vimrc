set expandtab " Make sure that every file uses spaces, not tabs
set shiftround  " Round indent to multiple of 'shiftwidth'
set smartindent " Do smart indenting when starting a new line
set autoindent  " Copy indent from current line, over to the new line
set smarttab

set lazyredraw
set regexpengine=1

" Set the tab width
let s:tabwidth=2
exec 'set tabstop='    .s:tabwidth
exec 'set shiftwidth=' .s:tabwidth
exec 'set softtabstop=0'.s:tabwidth

retab

set fenc=utf-8
set ff=unix

set laststatus=2

set colorcolumn=80

set noswapfile

execute pathogen#infect()
syntax on
filetype on
filetype plugin indent on

" air-line
let g:airline_theme='sol'
let g:airline_powerline_fonts=1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:netrw_liststyle=3

" Toggle past / nopaste node
set pastetoggle=<F10>

let test#ruby#use_binstubs = 0

nmap <leader>tn :TestNearest<CR>
nmap <leader>tf :TestFile<CR>

" Upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Rubocop
nmap <Leader>r :RuboCop<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_haskell_checkers = ['ghc-mod']

vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Force retabbing
nmap <leader>x :call ForceRetab()<CR>

function! ForceRetab()
  setlocal expandtab
  retab
endfunction

" Vim signature, for showing marks
nmap <leader>m :SignatureToggle<CR>

" Show folds
set foldcolumn=1
nnoremap <leader>f :call FoldColumnToggle()<cr>

function! FoldColumnToggle()
  if &foldcolumn
    setlocal foldcolumn=0
  else
    setlocal foldcolumn=1
  endif
endfunction
