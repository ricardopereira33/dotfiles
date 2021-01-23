let mapleader = "\<Space>"
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1

let g:seiya_auto_enable=1
let g:seiya_target_groups = ['guibg']
let g:unite_source_grep_command = 'rg'

let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" incsearch.vim
let g:incsearch#auto_nohlsearch = 1

" vim-airline settings
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme = 'gruvbox'
"let g:airline_theme = 'nord'
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1

" deoplete + autopairs changes
let g:AutoPairsMapCR=0
let g:deoplete#enable_at_startup = 1

call deoplete#custom#option({
  \ 'auto_complete_delay': 200,
  \ 'smart_case': v:true,
  \ })


" session management
let g:session_autosave = 'no'

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" nvr
let $VISUAL = 'nvr -cc split --remote-wait'
