if has('unix')
  let g:config_directory = '~/Dropbox/vim'
else
  let g:config_directory = '~/My Documents/My Dropbox/vim'
endif

let g:config_directory = expand(g:config_directory)

exec 'source ' . g:config_directory . '/vimrc.vim'
