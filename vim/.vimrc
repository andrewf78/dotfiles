"------------------------------------------------------------------------------
" Miscellaneous setup
"------------------------------------------------------------------------------
syntax on
colorscheme andrew
set t_Co=256
set nu
set nowrap
set autoindent
set expandtab

" Status line shows [filename:line:column].
set statusline+=[%t:%l:%c]

" All horizontally split windows use "-" as a separator (active and non-active).
set fillchars+=stl:-
set fillchars+=stlnc:-

" Set golang files to use C++ syntax highlighting.
au BufRead,BufNewFile *.go setfiletype cpp

"------------------------------------------------------------------------------
" Infect all the things! (Pathogen pkg managment initialization).
"------------------------------------------------------------------------------
filetype off
execute pathogen#infect()
execute pathogen#helptags()
filetype indent plugin on

"------------------------------------------------------------------------------
" NERD Tree setup.
"------------------------------------------------------------------------------
" Have NERDTree show hidden files.
let NERDTreeShowHidden=1

" New windows open on the right
set splitright

" Open NERDTree automagically upon startup, but focus on document window.
autocmd vimenter * NERDTree
autocmd vimenter * wincmd p

" Open NERDTree even if no files are specified.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" If NERDTree is the only open window, close vim.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
                 \ b:NERDTree.isTabTree()) | q | endif

"------------------------------------------------------------------------------
" Syntastic setup
"------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Pipe syntax errors to LocationList.
let g:syntastic_always_populate_loc_list=1

" Open/close the LocationList automatically on an error/fix.. 
let g:syntastic_auto_loc_list=1

" Perform checks when file is opened, but not when exit follows write.
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Cap the LocationList contents to 5 lines.
let g:syntastic_loc_list_height=5

"------------------------------------------------------------------------------
" Deoplete setup
"------------------------------------------------------------------------------
let g:deoplete#enable_at_startup=1

" EOF
