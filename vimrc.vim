" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Configure platform specific stuffs
if has('unix')
  set guifont=DejaVu\ Sans\ Mono\ 10
  set backupdir=/tmp,~/tmp,.
  set directory=/tmp,~/tmp,.
  if version >= 703
    set undodir=/tmp,~/tmp,.
  endif
  set guioptions-=a
  let g:yankring_history_dir = '/tmp'
  command! Maximize set lines=999 columns=999
else
  set guifont=DejaVu_Sans_Mono:h10:cANSI
  set backupdir=$TEMP,$TMP,.
  set directory=$TEMP,$TMP,.
  if version >= 703
    set undodir=$TEMP,$TMP,.
  endif
  let $PATH = $PATH . ';C:\Program Files\7-Zip'
  let g:netrw_scp_cmd  = '"' . g:config_directory . '\..\..\utils\pscp.exe" -q'
  let g:netrw_sftp_cmd = '"' . g:config_directory . '\..\..\utils\psftp.exe"'
  let g:netrw_http_cmd = '"' . g:config_directory . '\..\..\utils\curl.exe" -o'
  let &shellpipe = '| tee %s 2>&1'
  let &shellquote = '"'
  let g:clang_exec = '""' . g:config_directory . '/Silex/clang/clang.exe"'
  let g:clang_user_options = '2> NUL || exit 0"'
  let g:yankring_history_dir = $TEMP
  let &grepprg = 'grep -n $*'
  " exec 'source ' . g:config_directory . '/visual_studio.vim'
  command! Maximize simalt ~x
endif

" snipmate options
let g:snippets_dir = "'" . g:config_directory . "/Silex/snippets'"

" Ultisnips
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsSnippetDirectories=['UltiSnips']

" XPTemplate
let g:xptemplate_key = '<Tab>'
let g:xptemplate_key_pum_only = '<S-Tab>'
let g:xptemplate_nav_next = '<C-j>'
let g:xptemplate_nav_prev = '<C-k>'
let g:xptemplate_nav_cancel = '<C-c>'
let g:xptemplate_to_right = '<C-;>'
let g:xptemplate_fallback = '<C-n>'

" FuzzyFinder options
let g:fuf_modesDisable = ['mrucmd']
let g:file_completer = {}
function g:file_completer.onComplete(item, method)
  call feedkeys('i' . a:item)
endfunction
function g:file_completer.onAbort()
endfunction
function! CompleteFile()
  call fuf#callbackfile#launch('', 0, '>', '', g:file_completer)
endfunction
inoremap <C-X><C-F> <Esc>:call CompleteFile()<CR>

" clang_complete
let g:clang_complete_auto = 0
let g:clang_complete_copen = 0
let g:clang_hl_errors = 0
let g:clang_snippets = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_sort_algo = 'alpha'
let g:clang_use_library = 0
let g:clang_library_path = g:config_directory . '/Silex/clang'

" NetRW
let g:netrw_cursorline = 0

" ideone
let g:ideone_open_browser_after_post = 1

" CommandT
let g:CommandTMatchWindowAtTop = 1

" Fugitive
autocmd BufReadPost fugitive://* set bufhidden=delete

" Gitv
let g:Gitv_OpenHorizontal = 1
highlight diffAdded guifg=#00bf00
highlight diffRemoved guifg=#bf0000

" vim-addon-manager
let g:vim_addon_manager = {}
let g:vim_addon_manager.shallow_clones = 0
let &runtimepath .= ',' . fnameescape(g:config_directory) . '/plugins/vim-addon-manager'
let s:plugins = 'bad-whitespace molokai vim-powerline vim-multiple-cursors css_color vim-coffee-script repeat inkpot The_NERD_tree UltiSnips FuzzyFinder afterimage browser%2227 up Tabular DrawIt matchit.zip fugitive gitv rails FSwitch Decho clang_complete visualstar PickAColor ideone surround vcscommand DirDiff textobj-rubyblock Conque_Shell cmakeref scons pdc Gundo EasyMotion'
call vam#ActivateAddons(split(s:plugins, ' '))
let &runtimepath = fnameescape(g:config_directory) . '/Silex,' . &runtimepath

" Put these in an autocmd group, so that we can delete them easily.
augroup Silex
au!

" Always use '*' register for yanks/cuts
set clipboard=unnamed

" Colors
if has('gui')
  au VimEnter * colorscheme molokai
elseif (&t_Co == 255 || &t_Co == 88)
  au VimEnter * colorscheme molokai
endif

" Convenience helpers
command! EditVimRc exec ':e ' . fnameescape(g:config_directory) . '/vimrc.vim'
command! -nargs=1 Dechod Decho '|' . <args> . '|'
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1
command! Reformat silent! %s/\v\S+\s*\zs\{$/\r{/ | silent! %s/}\s*else/}\relse/ | exe 'silent! normal gg=G' | nohlsearch
command! -complete=file -nargs=1 DeleteFile :echo 'DeleteFile: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis

" NERDTree
hi treePart guibg=bg guifg=bg gui=none cterm=none
hi treePartFile guibg=bg guifg=bg gui=none cterm=none

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" It will return the syntax highlighting group
" that the current thing under the cursor belongs to
command! ShowHighLight echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<' . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<' . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'

" Cycle through buffers with tabs
"nnoremap <Tab> :bn<CR>
"nnoremap <S-Tab> :bp<CR>

" Tabs in visual mode indents/deindent block
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Scroll offset
set scrolloff=0

" Write to swap file every 50 keystroke
set updatecount=50

" Autocompletion
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
for key in split('<C-X><C-L> <C-X><C-N> <C-X><C-K> <C-X><C-T> <C-X><C-I> <C-X><C-]> <C-X><C-F> <C-X><C-D> <C-X><C-V> <C-X><C-U> <C-X><C-O> <C-X>s <C-N> <C-P>')
  " exe 'inoremap <expr> ' . key . " pumvisible() ? '" . key . "' : '" . key . "<Down>'"
  " exe 'iunmap ' . key
endfor

" Haml
au BufNewFile,BufRead *.hamlc set filetype=haml

" Pandoc
au BufNewFile,BufRead *.md,*.pdc,*.mdown set filetype=pdc
au FileType pdc let &l:makeprg = 'pandoc --section-divs --offline -s %:p -c css/style.css -o %:p:r.html'
au FileType slidy let &l:makeprg = 'pandoc --section-divs --offline -s -m -i -t slidy -c css/style.css %:p -o %:p:r.html'

" Autowrites buffers on :make
set autowrite

" C++
au FileType cpp let &l:makeprg = 'g++ -o %:r %'

" Scons
au BufNewFile,BufRead SCons* set filetype=scons

" Undo
set undolevels=1000  "maximum number of changes that can be undone
if version >= 703
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif

" Useful shortcuts
vnoremap ,c "+y
vnoremap ,x "+d
nnoremap ,v "+P
vnoremap ,v "+p
nnoremap ,a ggVG
nnoremap ,t :CommandT<CR>
nnoremap ,f :FufFile<CR>
nnoremap ,g :FufFileWithCurrentBufferDir<CR>
nnoremap ,r :FufMruFile<CR>
nnoremap ,d :FufDir<CR>
nnoremap ,b :FufBuffer<CR>
nnoremap ,s :FSHere<CR>
nnoremap ,q :FufQuickfix<CR>
nnoremap ,m :make!<CR>
nnoremap ,n :NERDTreeToggle<CR>
nnoremap ,l :ls<CR>:b<space>

" :saveas but with range support
command! -range=% -nargs=1 -bang -complete=file SaveAs <line1>,<line2>write<bang> <args> | edit #

" backspace in Visual mode deletes selection
vnoremap <BS> d

" Highlight searches, use <C-L> to temporarily turn off highlighting
set hlsearch
nnoremap <C-L> :nohl<CR><C-L>

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

" Gui options
set guioptions=a-mbr

" Don't update the display while executing macros
set lazyredraw

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

map ' `
cnoremap <C-A> <Home>
cnoremap <C-E> <End>

" CTRL-C / CTRL-V
function! ClassicIde()
  vnoremap <C-C> "+y
  vnoremap <C-X> "+d
  nnoremap <C-V> "+P
  nnoremap <C-A> ggVG
endfunction
function! BackToVim()
  vunmap <C-C>
  vunmap <C-X>
  nunmap <C-V>
  nunmap <C-A>
endfunction

"" CTRL-Tab is Next window
"noremap <C-Tab>   <C-W>w
"inoremap <C-Tab>  <C-O><C-W>w
"cnoremap <C-Tab>  <C-C><C-W>w
"onoremap <C-Tab>  <C-C><C-W>w

" Scrolling options
set scroll=2

" Disable encryption (:X)
set key=

" mksession options
set sessionoptions=buffers

" get rid of the silly characters in window separators
set fillchars=""

" Enable syntax highlighting
syntax on

" Indentation options
set nowrap
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable use of the mouse for all modes
set mouse=a

" backspace and cursor keys wrap to previous/next line
set backspace=indent,eol,start
set whichwrap+=<,>,[,]

" Set visual/select mode options
set selectmode=""
set mousemodel=popup
set keymodel=""
set selection=inclusive

" History
set history=1000
set undolevels=1000

" Folding
set nofoldenable

" Files to ignore
set wildignore=*.swp,*.bak,*.o,*.obj

" Attempt to determine the type of a file based on its name and possibly its
" contents.  Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" One of the most important options to activate. Allows you to switch from an
" unsaved buffer without saving it first. Also allows you to keep an undo
" history for multiple files. Vim will complain if you try to quit without
" saving, and swap files will keep you safe if your computer crashes.
set hidden

" Better command-line completion
set wildmenu
set wildmode=longest:full

" Show partial commands in the last line of the screen
set showcmd

" Use case insensitive search, except when using capital letters
set ignorecase
set nosmartcase

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell.  If visualbell is set, and
" this line is also included, vim will neither flash nor beep.  If visualbell
" is unset, this does nothing.
set t_vb=

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
"set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" End of autocmd group Silex
augroup END
