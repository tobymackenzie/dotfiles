
set completeopt+=menuone,noinsert,noselect
"--disable error when no matches found
set shortmess+=c
"--auto popup when three word characters in a row entered
augroup TJMAutopleteOnIns
	autocmd!
	autocmd InsertCharPre * call TMAutopleteOnIns()
augroup END
fun! TMAutopleteOnIns()
	if len(&omnifunc) != 0
		\ && v:char =~ '\w'
		\ && getline('.')[col('.') - 3] =~ '\w'
		\ && getline('.')[col('.') - 2] =~ '\w'
		\ && getline('.')[col('.') - 1] !~ '\w'
		call feedkeys("\<C-x>\<C-o>", 'n')
	endif
endfun
"--close func def preview when ')' called to finish function call
"-! not useful in all languages, but others would be much more complicated
inoremap <expr> ) TMClosePreviewDone()
fun! TMClosePreviewDone()
	for w in range(1, winnr('$'))
		if getwinvar(w, "&pvw") == 1
			call feedkeys("\<esc>:pclose\<CR>i\<right>", 'n')
		endif
	endfor
	return ")"
endfun
"--generic autocomplete
"-! this only sort of works, not in all file types, not for all words, can be slow
set omnifunc=syntaxcomplete#Complete
"--hide line numbers in preview window
augroup TJMHidePreviewLN
	autocmd!
	autocmd WinEnter * call TMHidePreviewLN()
augroup END
fun! TMHidePreviewLN()
	if &pvw
		setlocal nonumber
	endif
endfun
"--tab to select first / current item
inoremap <expr> <Tab> pumvisible() ? (complete_info()['selected'] == -1 ? "\<C-n>" : "\<C-y>") : "\<Tab>"

"==per language fixes
"--sql: disable special plugin autocomplete if plugin not installed
if !exists('g:loaded_dbext') && !exists('g:omni_sql_default_compl_type')
	let g:omni_sql_default_compl_type = 'syntax'
endif
