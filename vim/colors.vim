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

"==statusline
highlight! link StatusLine DiffAdd
highlight! link StatusLineNC Pmenu

