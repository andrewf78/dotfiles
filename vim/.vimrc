syntax on
colorscheme andrew
set t_Co=256
set nu
set nowrap

" set golang files to use python syntax highlighting
au BufRead,BufNewFile *.go setfiletype cpp
