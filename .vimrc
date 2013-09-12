let g:config_directory = fnamemodify(resolve($MYVIMRC), ":h:p")
exec 'source ' . g:config_directory . '/vimrc.vim'
