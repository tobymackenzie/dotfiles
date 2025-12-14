"=====
"==human friendly versions of commands, like command pallet of Sublime, etc
"=====

"--files
command! -nargs=? -complete=dir FileManager call TMExploreFn(<f-args>)
command! -nargs=? -complete=dir FM call TMExploreFn(<f-args>)
command! Reveal execute ':silent !o -R ' . expand('%')
command! NewFile call NewFile()

"--lint
command! Lint ALELint

"==vim
"--vim info
command! Info echo "-----version" | version | echo "\n-----scriptnames" | scriptnames

"--refresh current file / page
command! Refresh {
	if &ft == 'netrw'
		call feedkeys('<c-L>')
	else
		edit
	endif
}
command! Reload Refresh

"--reload config
command! ReloadVimrc {
	so $MYVIMRC
	redraw
	echo 'reloaded vimrc'
}
command! ReloadConfig ReloadVimrc
command! ReSource Reload

"--show colors
command! ShowColors tabnew | so $VIMRUNTIME/syntax/hitest.vim

