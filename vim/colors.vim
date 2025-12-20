if 1
if has('gui_macvim')
	"--use our colorscheme if MacVim
	let macvim_skip_colorscheme=1
endif
"--enable syntax highlighting, must be before colorscheme
syntax on

"--defaults for custom color names that aren't defined by scheme
highlight! default link TJMStatus CursorColumn
highlight! default link TJMStatusMode Cursor
highlight! default link TJMStatusEtc Cursor

"--set colors helper
"-# pretty much just `:colorscheme` with a `dark` / `light` setting
if !exists('$TJM_COLORS')
	let $TJM_COLORS = 'koehlertm'
endif
fun! SetColors(val = $TJM_COLORS) abort
	if a:val == 'dark' || a:val == 'light'
		execute 'set bg=' .. a:val
	else
		execute ':colorscheme ' .. a:val
	endif
endfun
command! -nargs=? -complete=color Colors call SetColors(<f-args>)
command! -nargs=? -complete=color SetColors call SetColors(<f-args>)

"--random color helper
fun! RandomColors()
	if !exists('g:colorschemes')
		"-@ https://stackoverflow.com/a/44102038
		let g:colorschemes = uniq(
			\ sort(
				\ map(
					\ globpath(&runtimepath, "colors/*.vim", 0, 1),
					\ 'fnamemodify(v:val, ":t:r")'
				\ )
			\ )
		\ )
	endif
	let scheme = g:colorschemes[rand() % len(g:colorschemes)]
	call SetColors(scheme)
	redraw
	echo 'colorscheme ' .. scheme
endfun
command! RandomColors call RandomColors()

"--choose default color scheme
"-# start with dark to avoid flash of white
set background=dark
colorscheme $TJM_COLORS

"--toggle dark mode helper
fun! ToggleDarkMode() abort
	let &background = (&background == 'dark' ? 'light' : 'dark')
endfun
command! -nargs=0 ToggleDarkMode call ToggleDarkMode()
"--fallback for vim.tiny
finish
endif
colorscheme tiny
