colorscheme koehler
highlight Normal ctermfg=lightgreen guifg=#b0ffb3

"--highlight current line
highlight CursorLine guibg=#444444
highlight CursorLineNr ctermfg=black ctermbg=green guifg=black guibg=green
"---make it noticeable which mode I'm in
augroup TJMInsertBGStyle
	autocmd!
	autocmd InsertEnter * hi Normal term=reverse	guibg=#002200
	autocmd InsertLeave * hi Normal term=NONE	guibg=black
	autocmd InsertEnter * hi LineNr term=reverse ctermfg=cyan guifg=cyan guibg=#003300
	autocmd InsertLeave * hi LineNr term=NONE ctermfg=yellow guifg=yellow guibg=#001100
augroup end

"--show whitespace
highlight NonText ctermfg=darkGray guifg=gray43
highlight SpecialKey ctermfg=darkGray guifg=gray43

"--vcs
highlight GitGutterAdd ctermfg=green guifg=green
highlight GitGutterChange ctermfg=yellow guifg=yellow
highlight GitGutterDelete ctermfg=red guifg=red

"==popup menu
highlight! PMenuMatch ctermfg=14 ctermbg=13 guifg=#ff0000 guibg=#444444
highlight! PMenuMatchSel ctermfg=14 ctermbg=46 guifg=#ff0000 guibg=#00ff00
highlight! PMenuSel ctermfg=16 ctermbg=46 guifg=#000000 guibg=#00ff00

"==statusline
highlight! link StatusLine DiffAdd
highlight! link StatusLineNC Pmenu
highlight! TJMStatusEtc ctermfg=0 ctermbg=10 guifg=black guibg=#00cc55

"==tabs
highlight! link Tabline diffadd
highlight! link Tablinefill diffadd
highlight! link tablinesel cursor
