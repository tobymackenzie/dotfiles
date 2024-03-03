"=====
"==human friendly versions of commands, like command pallet of Sublime, etc
"=====

"--vim info
command! Info echo "-----version" | version | echo "\n-----scriptnames" | scriptnames

"--show colors
command! TMShowColors tabnew | so $VIMRUNTIME/syntax/hitest.vim

"--file manager
command! -nargs=? -complete=dir TMexplore call TMExploreFn(<f-args>)
