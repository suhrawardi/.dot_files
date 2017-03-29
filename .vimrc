set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
retab

set fenc=utf-8
set ff=unix

set laststatus=2

set colorcolumn=80

execute pathogen#infect()
syntax on
filetype plugin indent on

let g:airline_theme='sol'
let g:airline_powerline_fonts=1

let g:netrw_liststyle=3

" Toggle past / nopaste node
set pastetoggle=<F10>

" Vim shortcuts
nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

" Upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Swap two words
nmap <silent> gw :s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR>`'

" Rspec
nmap <leader>s :VroomRunNearestTest<CR>

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

" Haskell Syntastic extensions
au FileType haskell nnoremap <buffer> <F1> :HdevtoolsType<CR>
au FileType haskell nnoremap <buffer> <silent> <F2> :HdevtoolsClear<CR>
au FileType haskell nnoremap <buffer> <silent> <F3> :HdevtoolsInfo<CR>

vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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

" NERDtree
map <C-n> :NERDTreeToggle<CR>
