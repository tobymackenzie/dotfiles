"--window switch
nnoremap <Space><Space> <c-w><c-w>
"--select all
"-# ggVG adds extra line break
nnoremap <leader>a G$vgg0
"--toggle buffers
nnoremap <leader>b <C-^>
nnoremap <leader>B :buffers<cr>:b
nnoremap <s-space>B :buffers<cr>:b
"--duplicate line / selection
nnoremap <leader>d :copy.<cr>
xnoremap <leader>d y`]p
"--file sidebar
nnoremap <leader>f :FileManager<cr>
nnoremap <leader>F :FileManager<space>
nnoremap <s-space>F :FileManager<space>
"--git (fugitive plugin)
nnoremap <leader>g :tab G<cr>
"--git command line
nnoremap <leader>G :!git<space>
"--help
nnoremap <expr> <leader>h &ft == 'help' ? ':help ' : ':tab help '
nnoremap <leader>H :tab help<cr>
"--open
nnoremap <leader>o :OpenFile **/
nnoremap <leader>O :OpenFile<space>
"--paste (without copying)
noremap <leader>p "0p
"--project
nnoremap <leader>P :Project<space>
"--quit
noremap <leader>q :<c-u>qa<CR>
"--reveal in file browser (mac only)
if has('mac')
	nnoremap <silent> <leader>r :Reveal<cr>
endif
"--save
noremap <leader>s :update<cr>
noremap <leader>ss :update<cr>
"--spell check
noremap <leader>sc :set spell!<CR>
"--open terminal
nnoremap <leader>! :!
nnoremap <leader>t :!
nnoremap <leader>T :tab term<cr>
"--window close
noremap <leader>w :<c-u>close<CR>
"--tab close
if 1
fun! TMCloseCleanly()
	"--close if buffer open in more than one window
	"--for help, need close unless last window
	if len(win_findbuf(bufnr('%'))) > 1 || (&ft == 'help' && winnr() != winnr('$'))
		close
	"--otherwise, delete buffer unless last netrw
	elseif &ft !=# 'netrw' || len(getbufinfo({'buflisted':1})) > 1 || tabpagenr('$') > 1
		let origTab = tabpagenr()
		bdelete
		"--special handling of no name buffer when it's open with netrw as only other tab
		if expand('%') == '' && tabpagenr() > 1 && origTab == tabpagenr()
			let origBuffer = bufnr()
			close
			execute 'bdelete ' .. origBuffer
		endif
	endif
	if &ft !=# 'netrw' && expand('%') == '' && len(getbufinfo({'buflisted':1})) <= 1 && tabpagenr('$') <= 1
		Explore
		"--prevent empty files being added to buffer list
		for buf in filter(range(1, bufnr('$')), 'buflisted(v:val) && empty(bufname(v:val)) && bufwinnr(v:val) < 0 && (getbufline(v:val, 1, "$") == [""])')
			execute 'bdelete' buf
		endfor
	endif
endfun
noremap <leader>x :call TMCloseCleanly()<cr>
endif
noremap <leader>X :if confirm('Are you sure you want to close without saving?', "&Yes\n&No", 1) == 1 <bar> q! <bar> endif<cr>
"--yank current line without break / indent
noremap <leader>y m'^y$``
"--yank all
noremap <leader>Y :%y+<cr>
"--switch window / tab directionally
noremap <expr> <leader><left> winnr('$') > 1 ? '<c-w><left>' : ':tabprevious<cr>'
noremap <expr> <leader><right> winnr('$') > 1 ? '<c-w><right>' : ':tabnext<cr>'
noremap <leader><up> <c-w><up>
noremap <leader><down> <c-w><down>
"--reload vimrc
nmap <leader>< :ReloadVim<cr>
"--edit vimrc
nmap <leader>, :e $MYVIMRC<cr>
"--command mode
noremap <leader>; :
noremap <leader>: :
"--surround text with parens
"-! visual mode version should either leave selection selected or move to end of selection when done
nnoremap <expr> <leader>( 'i' . (col(".") == col("$") - 1 ? '<right>' : '') . '()<esc>i'
xnoremap <leader>( :keeppatterns lockmarks s/\%V\_.*\%V/(&)/<cr>
"--surround text with block
nnoremap <expr> <leader>[ 'i' . (col(".") == col("$") - 1 ? '<right>' : '') . '[]<esc>i'
xnoremap <leader>[ :keeppatterns lockmarks s/\%V\_.*\%V/[&]/<cr>
"--surround text with curly braces
nnoremap <expr> <leader>{ 'i' . (col(".") == col("$") - 1 ? '<right>' : '') . '{}<esc>i'
xnoremap <leader>{ :keeppatterns lockmarks s/\%V\_.*\%V/{&}/<cr>
"--surround text with single quotes
nnoremap <expr> <leader>' 'i' . (col(".") == col("$") - 1 ? '<right>' : '') . '\'\'<esc>i'
xnoremap <leader>' :keeppatterns lockmarks s/\%V\_.*\%V/'&'/<cr>
"--surround text with double quotes
nnoremap <expr> <leader>" 'i' . (col(".") == col("$") - 1 ? '<right>' : '') . '""<esc>i'
xnoremap <leader>" :keeppatterns lockmarks s/\%V\_.*\%V/"&"/<cr>
"--restore ; (movement repeat)
noremap <Leader>. ;

