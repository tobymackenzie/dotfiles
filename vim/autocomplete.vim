
set completeopt+=menuone,noinsert,noselect
"--disable error when no matches found
set shortmess+=c
"--auto popup when three word characters in a row entered
augroup TJMAutopleteOnIns
	autocmd!
	autocmd InsertCharPre * noautocmd call TMAutopleteOnIns()
augroup END
fun! TMAutopleteOnIns() abort
	if !pumvisible()
		\ && v:char =~ '\w'
		\ && getline('.')[col('.') - 3] =~ '\w'
		\ && getline('.')[col('.') - 2] =~ '\w'
		\ && getline('.')[col('.') - 1] !~ '\w'
		if len(&omnifunc) != 0
			noautocmd call feedkeys("\<C-x>\<C-o>", 'n')
			"--fallback to c-p. need timer because feedkeys isn't done immediately
			if exists('b:TMAutopletePTimer')
				call timer_stop(b:TMAutopletePTimer)
			endif
			let b:TMAutopletePTimer = timer_start(20, {->TMShowAutopleteP()})
		else
			call TMShowAutopleteP()
		endif
	endif
endfun
fun! TMShowAutopleteP() abort
	if !pumvisible()
		noautocmd call feedkeys("\<C-x>\<C-p>", 'n')
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
