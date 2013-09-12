" Vim color file
" Maintainer:	Hans Fugal <hans@fugal.net>
" Last Change:	$Date: 2003/05/06 16:37:49 $
" Last Change:	$Date: 2003/06/02 19:40:21 $
" URL:		http://hans.fugal.net/vim/colors/desert.vim
" Version:	$Id: desert.vim,v 1.6 2003/06/02 19:40:21 fugalh Exp $

" cool help screens
" :he group-name
" :he highlight-groups
" :he cterm-colors

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    " hi clear
    if exists("syntax_on")
	syntax reset
    endif
endif
let g:colors_name="anotherdark"

highlight Pmenu guibg=lightgreen guifg=black ctermbg=black ctermfg=blue gui=none cterm=none
highlight PmenuSel guibg=darkgreen guifg=white ctermbg=black ctermfg=yellow gui=none cterm=none

hi Normal	guifg=White guibg=grey20

" highlight groups
hi Cursor	guibg=khaki guifg=slategrey gui=none cterm=none
"hi CursorIM
"hi Directory
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText
"hi ErrorMsg
hi VertSplit	guibg=#c2bfa5 guifg=grey50 gui=none cterm=none
hi Folded	guibg=grey30 guifg=gold gui=none cterm=none
hi FoldColumn	guibg=grey30 guifg=tan gui=none cterm=none
hi IncSearch	guifg=slategrey guibg=khaki gui=none cterm=none
"hi LineNr
hi ModeMsg	guifg=goldenrod gui=none cterm=none
hi MoreMsg	guifg=SeaGreen gui=none cterm=none
hi NonText	guifg=LightBlue guibg=grey30 gui=none cterm=none
hi Question	guifg=springgreen gui=none cterm=none
hi Search	guibg=peru guifg=wheat gui=none cterm=none
hi SpecialKey	guifg=yellowgreen gui=none cterm=none
hi StatusLine	guibg=#c2bfa5 guifg=black gui=none cterm=none
hi StatusLineNC	guibg=#c2bfa5 guifg=grey50 gui=none cterm=none
hi Title	guifg=indianred gui=none cterm=none
hi Visual	gui=none guifg=khaki guibg=olivedrab
"hi VisualNOS
hi WarningMsg	guifg=salmon gui=none cterm=none
"hi WildMenu
"hi Menu
"hi Scrollbar
"hi Tooltip

" syntax highlighting groups
hi Comment	guifg=orange gui=none cterm=none
hi Constant	guifg=#ffa0a0 gui=none cterm=none
hi Identifier	guifg=palegreen gui=none cterm=none
hi Statement	guifg=khaki gui=none cterm=none
hi PreProc	guifg=indianred gui=none cterm=none
hi Type		guifg=darkkhaki gui=none cterm=none
hi Special	guifg=navajowhite gui=none cterm=none
"hi Underlined
hi Ignore	guifg=grey40 gui=none cterm=none
"hi Error
hi Todo		guifg=orangered guibg=yellow2 gui=none cterm=none

" color terminal definitions
hi SpecialKey	ctermfg=darkgreen gui=none cterm=none
hi NonText	ctermfg=darkblue gui=none cterm=none
hi Directory	ctermfg=darkcyan gui=none cterm=none
hi ErrorMsg	ctermfg=7 ctermbg=1 gui=none cterm=none
hi IncSearch	ctermfg=yellow ctermbg=green gui=none cterm=none
hi Search	ctermfg=grey ctermbg=blue gui=none cterm=none
hi MoreMsg	ctermfg=darkgreen gui=none cterm=none
hi ModeMsg	ctermfg=brown gui=none cterm=none
hi LineNr	ctermfg=3 gui=none cterm=none
hi Question	ctermfg=green gui=none cterm=none
hi StatusLine	gui=none cterm=reverse
hi StatusLineNC gui=none cterm=reverse
hi VertSplit	gui=none cterm=reverse
hi Title	ctermfg=5 gui=none cterm=none
hi Visual	gui=none cterm=reverse
hi VisualNOS	gui=none cterm=underline
hi WarningMsg	ctermfg=1 gui=none cterm=none
hi WildMenu	ctermfg=0 ctermbg=3 gui=none cterm=none
hi Folded	ctermfg=darkgrey ctermbg=none gui=none cterm=none
hi FoldColumn	ctermfg=darkgrey ctermbg=none gui=none cterm=none
hi DiffAdd	ctermbg=4 gui=none cterm=none
hi DiffChange	ctermbg=5 gui=none cterm=none
hi DiffDelete	ctermfg=4 ctermbg=6 gui=none cterm=none
hi DiffText	ctermbg=1 gui=none cterm=none
hi Comment	ctermfg=lightblue gui=none cterm=none
hi Constant	ctermfg=darkred gui=none cterm=none
hi Special	ctermfg=red gui=none cterm=none
hi Identifier	ctermfg=6 gui=none cterm=none
hi Statement	ctermfg=3 gui=none cterm=none
hi PreProc	ctermfg=5 gui=none cterm=none
hi Type		ctermfg=2 gui=none cterm=none
hi Underlined	ctermfg=5 gui=none cterm=underline
hi Ignore	ctermfg=7 gui=none cterm=none
hi Ignore	ctermfg=darkgrey gui=none cterm=none
hi Error	ctermfg=7 ctermbg=1 gui=none cterm=none

"vim: sw=4
