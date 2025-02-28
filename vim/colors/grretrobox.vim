"--retrobox with personal modifications, more green
runtime colors/retrobox.vim
let g:colors_name = 'grretrobox'

"--replace some colors with greener alternatives
if &background ==# 'dark'
	"-! should be less vibrant, more warm, more light
	if exists('g:terminal_ansi_colors')
		let g:terminal_ansi_colors[-1] = '#cbe392'
	endif
	hi Normal ctermfg=156 guifg=#abf192
	hi Cursor ctermbg=156 guibg=#abf192
	hi CursorLine guibg=#203620
	hi CursorLineNr ctermfg=142 guifg=#b8bb26
	hi LineNr ctermfg=29 guifg=#427b58
	hi ModeMsg ctermfg=142 guifg=#b8bb26
	hi MoreMsg ctermfg=142 guifg=#b8bb26
	hi Pmenu ctermfg=237 ctermbg=72 guifg=#3c3836 guibg=#689d6a
	hi PmenuMatch ctermfg=229 ctermbg=72 guifg=#fbf1c7 guibg=#689d6a
	hi PMenuMatchSel ctermfg=132 ctermbg=142 guifg=#b16286 guibg=#b8bb26
	hi PMenuSel ctermbg=142 guibg=#b8bb26
	hi StatusLine ctermfg=236 ctermbg=142 guifg=#203620 guibg=#b8bb26
	hi TabLine ctermfg=142 ctermbg=236 guifg=#b8bb26 guibg=#203620
	hi TablineSel ctermfg=156 ctermbg=29 guifg=#abf192 guibg=#427b58
	hi TabLineFill ctermfg=29 ctermbg=236 guifg=#427b58 guibg=#1c1c1c
	hi! TJMStatus ctermfg=142 ctermbg=236 guifg=#b8bb26 guibg=#203620
	hi! TJMStatusMode ctermfg=156 ctermbg=29 guifg=#abf192 guibg=#427b58
	hi! TJMStatusEtc ctermfg=142 ctermbg=236 guifg=#b8bb26 guibg=#203620
	hi Visual ctermbg=142 guibg=#b8bb26

	"--make it noticeable which mode I'm in
	augroup TJMInsertBGStyle
		autocmd!
		autocmd InsertEnter * hi LineNr term=reverse ctermfg=243 guifg=#7c6f64
		autocmd InsertLeave * hi LineNr ctermfg=29 guifg=#427b58
		"--remove this feature before changing to another color scheme
		autocmd ColorSchemePre * silent augroup TJMInsertBGStyle | autocmd! | augroup end
	augroup end
else
	"-! not really worked on
	hi Normal ctermbg=194 guibg=#d7ffd7
	hi CursorLineNr ctermfg=64 guifg=#79740e
	hi LineNr ctermfg=29 guifg=#427b58
	hi StatusLine ctermfg=188 ctermbg=237 guifg=#e5d4b1 guibg=#3c3836
	hi TablineSel ctermbg=194 guibg=#d7ffd7
	hi TJMStatus ctermfg=237 ctermbg=188 guifg=#3c3836 guibg=#e5d4b1
	hi TJMStatusMode ctermfg=230 ctermbg=100 guifg=#fbf1c7 guibg=#98971a
	hi TJMStatusEtc ctermfg=237 ctermbg=188 guifg=#3c3836 guibg=#e5d4b1

	"--make it noticeable which mode I'm in
	augroup TJMInsertBGStyle
		autocmd!
		autocmd InsertEnter * hi LineNr term=reverse ctermfg=72 guifg=#689d6a
		autocmd InsertLeave * hi LineNr ctermfg=29 guifg=#427b58
		"--remove this feature before changing to another color scheme
		autocmd ColorSchemePre * silent augroup TJMInsertBGStyle | autocmd! | augroup end
	augroup end
endif
