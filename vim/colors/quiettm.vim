"--quiet with personal modifications, more green
runtime colors/quiet.vim
let g:colors_name = 'quiettm'

hi IncSearch ctermfg=49 guifg=#00ffaf
hi Search ctermfg=49 guifg=#00ffaf
hi Visual ctermfg=49 guifg=#00ffaf
hi CurSearch ctermfg=214 guifg=#ffaf00
hi Todo ctermfg=214 guifg=#ffaf00
hi! link StatusLine CursorColumn
hi link TJMStatusEtc CursorColumn
if &background ==# 'dark'
	hi MatchParen ctermfg=34 guifg=#00ffaf
	hi PMenuMatch ctermfg=34 guifg=#00af00
	hi PMenuMatchSel ctermfg=34 guifg=#00af00
else
	hi PMenuMatch ctermfg=49 guifg=#00ffaf
	hi PMenuMatchSel ctermfg=49 guifg=#00ffaf
	hi MatchParen ctermbg=7 ctermfg=114 guibg=#ffffff guifg=#87d787
endif
