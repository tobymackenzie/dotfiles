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
