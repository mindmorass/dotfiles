set ff=unix			" set file formast to unix/dos
set hlsearch			" highligh serached text
set shell=bash
set noerrorbells        	" no ding noises
set visualbell			" visual effect on error (set vb for short)
set history=200			" command history buffer
set undolevels=200		" undo buffer
set ignorecase			" ignore case on searches
set mousehide			" hide mouse while typing
set nowrap			" no visual wrapping
set wrapscan			" searches wrap around the file
set tabstop=4
set shiftwidth=4
set filetype=on
set expandtab
set modeline
set modelines=5
set paste

" cursor options
au WinLeave * set nocursorline	" line and column options: nocursorline nocursorcolumn
au WinEnter * set cursorline 	" line and column options: cursorline cursorcolumn
set cursorline 			" draw line under the cursor

let python_highlight_all=1
