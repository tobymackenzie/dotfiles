"--retrobox with personal modifications, more green
runtime colors/retrobox.vim
let g:colors_name = 'grretrobox'

hi! link TabLineSel Normal

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
	hi Pmenu ctermfg=156 guifg=#abf192
	hi StatusLine ctermfg=235 ctermbg=156 guifg=#203620 guibg=#abf192
	hi TabLineFill ctermfg=156 guifg=#abf192
	hi! TJMStatusEtc ctermfg=0 ctermbg=156 guifg=black guibg=#abf192

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

	"--make it noticeable which mode I'm in
	augroup TJMInsertBGStyle
		autocmd!
		autocmd InsertEnter * hi LineNr term=reverse ctermfg=72 guifg=#689d6a
		autocmd InsertLeave * hi LineNr ctermfg=29 guifg=#427b58
		"--remove this feature before changing to another color scheme
		autocmd ColorSchemePre * silent augroup TJMInsertBGStyle | autocmd! | augroup end
	augroup end
endif
