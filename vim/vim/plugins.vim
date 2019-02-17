"--plug.vim plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"--autocomplete
"> https://github.com/Valloric/YouCompleteMe
" ycm requires macvim on mac, and requires `cmake` installed
if (has('gui_macvim') || has('linux')) && executable('cmake')
	Plug 'valloric/youcompleteme', {'do': './install.py'}
endif

"--comments
"> https://vimawesome.com/plugin/the-nerd-commenter
" commands for toggling comments on selected lines
"-@ sublime keymap help via <https://stackoverflow.com/questions/11553382/vim-map-d-to-comment-code>
Plug 'scrooloose/nerdcommenter'
if has('mac')
	map <D-/> \c<space><CR>
	imap <D-/> <esc>\c<space><CR>i
else
	map <C-/> \c<space><CR>
	imap <C-/> <esc>\c<space><CR>i
endif

"--text
"---editorconfig
"> https://vimawesome.com/plugin/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'

"--vcs
"> https://vimawesome.com/plugin/vim-gitgutter
" shows git line status in gutter
if v:version > 703
	Plug 'airblade/vim-gitgutter'
endif
call plug#end()
