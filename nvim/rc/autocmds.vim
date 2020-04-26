augroup neovim
  autocmd!
  autocmd FileType vimfiler set nonumber | set norelativenumber
  autocmd Filetype * if &ft!='vimfiler' | set relativenumber | set number | endif
  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd BufWritePre * %s/\s\+$//e
  autocmd BufWritePost * Neomake
  autocmd TermClose * bw!
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
  autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END
