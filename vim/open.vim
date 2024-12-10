"--open file
" opens file from project path or elsewhere in new tab, switching to existing tab if already open
" openPath managed in `projects.vim`
if !exists('$openPath')
	let $openPath = ''
endif
fun! TMOpenFileComplete(val, cmd, pos) abort
	let firstChar = a:val[0]
	let append = a:val[-1:] == '*' ? '' : '*'
	"--glob for relative or absolute paths
	if firstChar == '~' || firstChar == '/' || firstChar == '.'
		return glob(a:val .. append, 0, 1)
	else
		"--otherwise check in openPath if set
		if !empty($openPath)
			"-! must cd, otherwise glob doesn't seem to ignore `wildignore` symlinked paths
			cd $openPath
		endif
		let paths = glob(a:val .. append, 0, 1)
		if !empty($openPath)
			cd -
			"--format more nicely
			let lpaths = []
			for path in paths
				call add(lpaths, substitute(path, $openPath .. '/', '', ''))
			endfor
			return lpaths
		else
			return paths
		endif
	endif
endfun
fun! TMOpenFile(file)
	let firstChar = a:file[0]
	if empty($openPath) || firstChar == '~' || firstChar == '/' || firstChar == '.'
		execute 'tab drop ' .. a:file
	else
		execute 'tab drop ' .. $openPath .. '/' .. a:file
	endif
endfun
command! -nargs=? -complete=customlist,TMOpenFileComplete OpenFile call TMOpenFile('<args>')

