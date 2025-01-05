if has('gui_macvim')
	"--use our colorscheme if MacVim
	let macvim_skip_colorscheme=1
endif
"--enable syntax highlighting, must be before colorscheme
syntax on

"--defaults for custom color names that aren't defined by scheme
"-# using link without ! because that will be ignored if defined
augroup TJMColorFallbacks
	autocmd!
	autocmd ColorScheme * silent highlight link TJMStatusEtc Cursor
augroup end

"--set colors helper
fun! SetColors(val = 'koehlertm') abort
	if a:val == 'dark' || a:val == 'light'
		execute 'set bg=' .. a:val
	else
		execute ':colorscheme ' .. a:val
	endif
endfun
command! -nargs=? -complete=color SetColors call SetColors(<f-args>)

"--choose default color scheme (see default arg)
SetColors
