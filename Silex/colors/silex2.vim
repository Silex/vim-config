" Port of http://studiostyles.info/schemes/selenitic
" to vim
" Last Change: 2010 sep 28
" Version: 1.0
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name='selenitic'

hi Comment      guifg=#7A987A gui=none cterm=none
hi Normal       guifg=#DFDFBF guibg=#333333 gui=none cterm=none
hi CursorLine   guibg=#434343 gui=none cterm=none
hi CursorColumn guibg=#434343 gui=none cterm=none
hi Visual       guibg=#486A65 gui=none cterm=none
hi VisualNOS    guibg=#486A65 gui=none cterm=none
hi Number       guifg=#6E96BE gui=none cterm=none
hi String       guifg=#DFAF8F gui=none cterm=none
hi Structure    guifg=#8ACCCF gui=none cterm=none
hi Type         guifg=#8ACCCF gui=none cterm=none
hi FoldColumn   guibg=#F0F0F0 guibg=#333333 gui=none cterm=none
hi LineNr       guifg=#7A987A guibg=#333333 gui=none cterm=none
hi PreProc      guifg=#EFC986 gui=none cterm=none
hi Keyword      guifg=#EFC986 gui=none cterm=none
hi Conditional  guifg=#EFC986 gui=none cterm=none
hi Statement    guifg=#EFC986 gui=none cterm=none
hi htmlArg      guifg=#DFDFBF gui=none cterm=none
hi htmlTagName  guifg=#EFC986 gui=none cterm=none
hi xmlCdata     guifg=#808080 gui=none cterm=none
hi xmlTagName   guifg=#EFC986 gui=none cterm=none
hi ErrorMsg     guifg=#EFC986 gui=none cterm=none
hi WarningMsg   guifg=#7A987A gui=none cterm=none
hi Folded       guifg=#808080 gui=none cterm=none
hi Search       guibg=#505050 gui=none cterm=none
hi PMenu        guifg=#CCCCFF guibg=#232323 gui=none cterm=none
hi PMenuSel     guibg=#303030 gui=none cterm=none

