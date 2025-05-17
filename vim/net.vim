"--simplify connecting to sftp/scp slightly
fun! TMNetrwUrl(url, type)
	let url = a:url
	if url !~ '://'
		let url = a:type .. '://' .. url
	endif
	if url !~ '://.*/'
		let url = url .. '/'
	endif
	call TMExploreFn(url)
endfun
command! -nargs=? SCP call TMNetrwUrl('<args>', 'scp')
command! -nargs=? SFTP call TMNetrwUrl('<args>', 'sftp')
"--alias FTP to SFTP because we haven't done plain FTP in a long while
command! -nargs=? FTP call TMNetrwUrl('<args>', 'sftp')
