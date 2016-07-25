syntax on
colorscheme andrew
set t_Co=256
set nu
set nowrap

" Infect all the things! (vim pkg managment initialization)
execute pathogen#infect()

"----------------------------------------------------------
" NERD Tree setup.
"----------------------------------------------------------
" Open NERDTree automagically upon startup.
autocmd vimenter * NERDTree

" Open NERDTree even if no files are specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" If NERDTree is the only open window, close vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" New windows open on the right
set splitright

"----------------------------------------------------------
" Syntastic setup
"----------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" set golang files to use python syntax highlighting
au BufRead,BufNewFile *.go setfiletype cpp
