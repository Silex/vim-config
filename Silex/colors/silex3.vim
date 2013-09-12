" Port of http://studiostyles.info/schemes/son-of-obsidian
" to vim
" Last Change: 2010 sep 28
" Version: 1.0
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="sonofobsidian"

hi Comment          guifg=#99AA8A gui=none cterm=none
hi Normal           guifg=#FFFFFF guibg=#22282A gui=none cterm=none
hi CursorLine       guibg=#32383A gui=none cterm=none
hi CursorColumn     guibg=#32383A gui=none cterm=none
hi Search           guibg=#808080 gui=none cterm=none
hi Visual           guifg=#FFFFFF guibg=#4F6164 gui=none cterm=none
hi VisualNOS        guifg=#FFFFFF guibg=#4F6164 gui=none cterm=none
hi Identifier       guifg=#FFFFFF gui=none cterm=none
hi Number           guifg=#FFCD22 gui=none cterm=none
hi Operator         guifg=#E8E2B7 gui=none cterm=none
hi String           guifg=#EC7600 gui=none cterm=none
hi FoldColumn       guifg=#FFFFFF guibg=#394144 gui=none cterm=none
hi LineNr           guifg=#3F4E49 guibg=#293134 gui=none cterm=none
hi PreProc          guifg=#A082BD gui=none cterm=none
hi Keyword          guifg=#93C763 gui=none cterm=none
hi Conditional      guifg=#93C763 gui=none cterm=none
hi Statement        guifg=#93C763 gui=none cterm=none
hi Type             guifg=#93C763 gui=none cterm=none
hi Structure        guifg=#678CB1 gui=none cterm=none
hi Tag              guifg=#93C763 gui=none cterm=none
hi xmlTagName       guifg=#93C763 gui=none cterm=none
hi xmlCdata         guifg=#99A38A gui=none cterm=none
hi xmlAttrib        guifg=#678CB1 gui=none cterm=none
hi htmlTagName      guifg=#93C763 gui=none cterm=none
hi htmlArg          guifg=#678CB1 gui=none cterm=none
hi ErrorMsg         guifg=#FF0000 gui=none cterm=none
hi WarningMsg       guifg=#FFCD22 gui=none cterm=none
hi Folded           guifg=#808080 guibg=#1C2325 gui=none cterm=none
hi PMenu            guifg=#CCCCFF guibg=#1C2325 gui=none cterm=none
hi PMenuSel         guibg=#2C3335 gui=none cterm=none

