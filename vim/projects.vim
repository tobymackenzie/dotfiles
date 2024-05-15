"--open
" open project path in tjm proj path or elsewhere
" depends on TJM_PROJ_PATH environment variable to define base path
"-@ [ideas](https://vi.stackexchange.com/questions/39720/is-there-a-project-manager-extension-like-vscode-in-vim)
if !exists('g:currentProj')
	let g:currentProj = ''
endif
fun! TMProjectComplete(proj, cmd, pos) abort
	let firstChar = a:proj[0]
	"--glob for relative or absolute paths
	if firstChar == '~' || firstChar == '/' || firstChar == '.'
		return glob(a:proj .. '*', 0, 1)
	else
		"--otherwise check in proj path
		if a:proj =~ '/'
			"--if subpath implied, glob in path
			let dirs = glob(expand($TJM_PROJ_PATH) .. '/' .. a:proj .. '*', 0, 1)
		else
			"--otherwise, just glob proj root
			let dirs = glob(expand($TJM_PROJ_PATH) .. '/*', 0, 1)
		endif
		"--format more nicely
		let ldirs = []
		for dir in dirs
			call add(ldirs, substitute(dir, $TJM_PROJ_PATH .. '/', '', ''))
		endfor
		"--filter to match passed value
		return filter(ldirs, 'v:val =~ a:proj')
	endif
endfun
fun! TMOpenProject(proj)
	if empty(a:proj)
		echo g:currentProj
		return
	endif
	let firstChar = a:proj[0]
	if firstChar == '~' || firstChar == '/' || firstChar == '.'
		let l:proj = a:proj
	else
		let l:proj = $TJM_PROJ_PATH .. '/' .. a:proj
	endif
	"--store old buffer for removal if "No Name"
	if !empty(a:proj)
		let g:currentProj = l:proj
	endif
	let loaded = 0
	"--restore project session if exists
	if !empty(a:proj) && filereadable(l:proj .. '/.projvimsess')
		let origSecure = &secure
		if !origSecure
			set secure
		endif
		"-! silent prevents error running `bwipe` stored in session, but also masks any other errors while loading
		execute 'silent! source ' .. l:proj .. '/.projvimsess'
		let loaded = 1
		if !origSecure
			set nosecure
		endif
		echow "loaded project from session"
	endif
	"--otherwise, cd and explore
	if !loaded
		let origBuffer = &ft != 'netrw' && expand('%') == '' && getline(1,'$') == [''] ? bufnr() : 0
		execute 'cd ' .. l:proj
		call TMExploreFn(l:proj)
		let loaded = 1
		"--remove "No Name" buffer
		if origBuffer && loaded
			execute 'bdelete ' .. origBuffer
		endif
	endif
endfun
command! -nargs=? -complete=customlist,TMProjectComplete Project call TMOpenProject('<args>')
"--save project session
fun! TMSaveProject()
	if !empty(g:currentProj)
		execute 'mksession! ' .. g:currentProj .. '/.projvimsess'
	endif
endfun
command! -nargs=0 ProjectSave call TMSaveProject()
"---storing options will override changes to this config, take up much more space
set sessionoptions-=options
"--clear project session
fun! TMClearProject()
	if !empty(g:currentProj)
		execute '!rm ' .. g:currentProj .. '/.projvimsess'
	endif
endfun
command! -nargs=0 ProjectClear call TMClearProject()

