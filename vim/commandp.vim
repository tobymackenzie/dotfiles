"=====
"==human friendly versions of commands, like command pallet of Sublime, etc
"=====

"--files
command! -nargs=? -complete=dir FileManager call TMExploreFn(<f-args>)
command! -nargs=? -complete=dir FM call TMExploreFn(<f-args>)
command! Reveal execute ':silent !o -R ' . expand('%')

"--lint
command! Lint ALELint

"==vim
"--vim info
command! Info echo "-----version" | version | echo "\n-----scriptnames" | scriptnames

"--reload config
command! Reload {
	so $MYVIMRC
	redraw
	echo 'reloaded vimrc'
}
command! ReloadConfig Reload
command! ReloadVim Reload
command! Resource Reload

"--show colors
command! ShowColors tabnew | so $VIMRUNTIME/syntax/hitest.vim

