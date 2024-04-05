"=====
"==human friendly versions of commands, like command pallet of Sublime, etc
"=====

"--vim info
command! Info echo "-----version" | version | echo "\n-----scriptnames" | scriptnames

"--show colors
command! ShowColors tabnew | so $VIMRUNTIME/syntax/hitest.vim

"--files
command! -nargs=? -complete=dir FileManager call TMExploreFn(<f-args>)
command! -nargs=? -complete=dir FM call TMExploreFn(<f-args>)
command! Reveal execute ':silent !open -R ' . expand('%') . ' & ' | execute ':redraw!'

"--lint
fun! TMLint()
	if &filetype == 'php'
		!php -l %
	else
		echoerr "Don't know how to lint file type " . &filetype . "."
	endif
endfun
command! Lint call TMLint()
