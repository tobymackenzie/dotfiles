"==plug.vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	if empty(glob('~/.vim/autoload/plug.vim'))
		"--bail aren't installed
		finish
	endif
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"==comments
"> https://vimawesome.com/plugin/the-nerd-commenter
" commands for toggling comments on selected lines
"-@ sublime keymap help via <https://stackoverflow.com/questions/11553382/vim-map-d-to-comment-code>
"--space after / before begin / end delimiters
let NERDSpaceDelims=1
Plug 'preservim/nerdcommenter'
if has('mac')
	map <D-/> \c<space><CR>
	imap <D-/> <esc>\c<space><CR>gi
else
	map <C-/> \c<space><CR>
	imap <C-/> <esc>\c<space><CR>gi
endif
map <Leader>/ \c<space>

"==linting
let g:ale_lint_delay = 4000
let g:ale_lint_on_enter = 0
" let g:ale_lint_on_text_changed = 'never'
Plug 'dense-analysis/ale'

"==match: better `%` matching, eg HTML tags
packadd! matchit

"==text
"--editorconfig
"> https://vimawesome.com/plugin/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

"==vcs
"--fugitive: run git commands from vim, show status, stage chunks
Plug 'tpope/vim-fugitive'

"--gitgutter: show changed lines
"> https://vimawesome.com/plugin/vim-gitgutter
" shows git line status in gutter
" don't use default key maps (causes `h` delay)
let g:gitgutter_map_keys = 0
Plug 'airblade/vim-gitgutter'
call plug#end()
