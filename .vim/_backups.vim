" append date and time to backup files
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S")

" backup, undo and swap space
if filewritable(".") && ! filewritable("${HOME}/.vim/.backup")
    silent execute '!umask 077; mkdir -p $HOME/.vim/.backup'
endif

if filewritable(".") && ! filewritable("${HOME}/.vim/.undo")
    silent execute '!umask 077; mkdir -p $HOME/.vim/.undo'
endif

if filewritable(".") && ! filewritable("${HOME}/.vim/.swp")
    silent execute '!umask 077; mkdir -p $HOME/.vim/.swp'
endif

" note this requires some cleanup - make a cron 
" example command to clean up files 5 days old
" find $HOME/.vim/.backup/ -type f -ctime -5 -delete
set backup

set undodir=$HOME/.vim/.undo//
set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.swp//
