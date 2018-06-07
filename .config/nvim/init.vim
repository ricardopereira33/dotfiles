" vim-plug autoconfig if not already installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | nested source $MYVIMRC
endif

" startup for vim-plug
call plug#begin('~/.local/share/nvim/plugged')


" Completions and snippets
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neco-vim', { 'for': 'vim' }
Plug 'Shougo/neosnippet' | Plug 'Shougo/neosnippet-snippets'

" Helpers
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'edkolev/promptline.vim'
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'haya14busa/incsearch.vim'

" IDE
Plug 'neomake/neomake'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

call plug#end()

set clipboard+=unnamedplus
set completeopt-=preview
set noshowmode
set lazyredraw
set hidden
set ruler
set noswapfile
set ignorecase
set smartcase
set magic
set showmatch
set nobackup
set nowb
set noerrorbells
set expandtab
set updatetime=250

set tabstop=4
set softtabstop=4
set shiftwidth=4

set number
set relativenumber
set numberwidth=2
set fileformat=unix

set whichwrap+=<,>,h,l

let mapleader = "\<Space>"

set wildignore+=.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" python special settings
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

nnoremap <silent> <A-right> :bn<CR>
nnoremap <silent> <A-left> :bp<CR>

" neovim terminal
tnoremap <Esc> <C-\><C-n>

" conceal markers
if has('conceal')
  set conceallevel=2
endif

" incsearch.vim
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" TagBar
nmap <C-t> :TagbarToggle<CR>

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

" themes and colors
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set termguicolors
set background=dark
colorscheme gruvbox
"colorscheme nord
let g:seiya_auto_enable=1
let g:seiya_target_groups = ['guibg']

" unite/denite vim
nnoremap <leader>f :Denite file_rec<CR>
let g:unite_source_grep_command = 'ack-grep'
let g:unite_source_grep_default_opts ='-i --no-heading --no-color -k -H'
let g:unite_source_grep_recursive_opt = ''


map <C-f> :VimFilerExplorer -winwidth=30 -toggle -no-quit -simple<CR>

" fzf.vim
nnoremap <C-p> :Files<cr>

" session management
let g:session_autosave = 'no'

" nvr
let $VISUAL = 'nvr -cc split --remote-wait'

" deoplete + neosnippet + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"
" quick configure to vim config
nmap <silent> ;v :next $MYVIMRC<CR>
nmap <silent> <BS> :nohlsearch<CR>

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


let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
