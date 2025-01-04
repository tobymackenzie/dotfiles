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

"--choose default color scheme
colorscheme koehlertm
