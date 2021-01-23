nnoremap <silent> <A-right> :bn<CR>
nnoremap <silent> <A-left> :bp<CR>

" neovim terminal
tnoremap <Esc> <C-\><C-n>

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)

" TagBar
nmap <C-t> :TagbarToggle<CR>

" unite/denite vim
nnoremap <leader>f :Denite file_rec<CR>

map <C-f> :VimFilerExplorer -winwidth=30 -toggle -no-quit -simple<CR>

" fzf.vim
nnoremap <C-p> :Files<cr>

imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
" quick configure to vim config
nmap <silent> ;v :next $MYVIMRC<CR>
nmap <silent> <BS> :nohlsearch<CR>
