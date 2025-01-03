"--koehler with personal modifications
runtime colors/koehler.vim
let g:colors_name = 'koehlertm'

highlight Normal ctermfg=lightgreen guifg=#b0ffb3

"--highlight current line
highlight CursorLine guibg=#444444
highlight CursorLineNr ctermfg=black ctermbg=green guifg=black guibg=green

"--make it noticeable which mode I'm in
augroup TJMInsertBGStyle
	autocmd!
	autocmd InsertEnter * hi Normal term=reverse	guibg=#002200
	autocmd InsertLeave * hi Normal term=NONE	guibg=black
	autocmd InsertEnter * hi LineNr term=reverse ctermfg=7 ctermbg=2 guifg=white guibg=#00a000
	autocmd InsertLeave * hi LineNr ctermfg=231 ctermbg=65 guifg=#ffffff guibg=#5f875f
	"--remove this feature before changing to another color scheme
	autocmd ColorSchemePre * silent augroup TJMInsertBGStyle | autocmd! | augroup end
augroup end

"--show whitespace
highlight NonText ctermfg=darkGray guifg=gray43
highlight SpecialKey ctermfg=darkGray guifg=gray43

"--vcs
highlight GitGutterAdd ctermfg=green guifg=green
highlight GitGutterChange ctermfg=yellow guifg=yellow
highlight GitGutterDelete ctermfg=red guifg=red

"==line number
highlight! LineNr ctermfg=231 ctermbg=65 guifg=#ffffff guibg=#5f875f

"==popup menu
highlight! PMenuMatch ctermfg=14 ctermbg=13 guifg=#ff0000 guibg=#444444
highlight! PMenuMatchSel ctermfg=14 ctermbg=46 guifg=#ff0000 guibg=#00ff00
highlight! PMenuSel ctermfg=16 ctermbg=46 guifg=#000000 guibg=#00ff00

"==statusline
" highlight StatusLine ctermbg=1 guifg=#ffffff guibg=#5f875f
" highlight StatusLine ctermfg=21 ctermbg=231 guifg=#ffffff guibg=#5f875f
highlight! link StatusLine DiffAdd
highlight! link StatusLineNC Pmenu
highlight! TJMStatusEtc ctermfg=0 ctermbg=10 guifg=black guibg=#00cc55

"==tabs
highlight! link Tabline diffadd
highlight! link Tablinefill diffadd
highlight! link tablinesel cursor
