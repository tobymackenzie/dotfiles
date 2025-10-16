" fairly simple scheme designed for vim.tiny and 8 color in TTY
" have added things so it looks alright in regular / gui vim

hi clear
set background=dark
if exists("syntax_on")
	syntax reset
endif
if 1
	let g:colors_name = "tiny"
endif
hi! Normal ctermbg=black ctermfg=white
hi! Cursor term=reverse ctermfg=green guifg=green
hi! CursorLine term=underline cterm=NONE guibg=#005500
hi! CursorLineNr term=underline cterm=bold ctermbg=green ctermfg=black guibg=green guifg=black
hi! DiffAdd term=reverse ctermbg=green ctermfg=black guifg=black guibg=green
hi! LineNr term=underline cterm=bold ctermfg=2 guifg=green
hi! Search term=underline cterm=underline ctermbg=green ctermfg=black guibg=green guifg=black
hi! SpecialKey ctermfg=4 guifg=#009900
hi! StatusLine term=bold cterm=bold ctermbg=black ctermfg=2 guibg=green guifg=black
hi! TabLine term=bold cterm=bold ctermbg=NONE ctermfg=2 guibg=black guifg=green
hi! TabLineFill term=bold cterm=bold ctermbg=NONE ctermfg=black guibg=green guifg=black
hi! TabLineSel term=reverse ctermbg=green ctermfg=black guifg=black guibg=green
hi! TJMStatus ctermbg=black ctermfg=green guibg=black guifg=green
hi! TJMStatusEtc ctermbg=black ctermfg=green guibg=black guifg=green
hi! TJMStatusMode term=reverse ctermbg=black ctermfg=green guibg=green guifg=black
hi! Visual term=reverse cterm=NONE ctermbg=green ctermfg=black guibg=green guifg=black
hi! link PMenu TJMStatusMode
hi! link NonText SpecialKey

"--plugin
hi! GitGutterAdd ctermfg=green guifg=green
hi! GitGutterChange ctermfg=yellow guifg=yellow
hi! GitGutterDelete ctermfg=red guifg=red
hi! SignColumn ctermbg=NONE guibg=NONE
