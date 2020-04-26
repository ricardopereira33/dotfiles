" THEME
set termguicolors
set background=dark

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

" python special settings
au BufNewFile,BufRead *.py set
    \ tabstop=4
    \ softtabstop=4
    \ shiftwidth=4
    \ textwidth=79

set wildignore+=.git,*.swp,*pyc,*pyo,*.png,*.jpg,*.gif,*.ai,*.jpeg,*.psd,*.jar,*.zip,*.gem,log/**,tmp/**,coverage/**,rdoc/**,output_*,*.xpi,doc/**

" conceal markers
if has('conceal')
  set conceallevel=2
endif

" incsearch.vim
set hlsearch

