" runs before plug#begin

set encoding=UTF-8
set timeoutlen=5000
set mouse=a
set cmdheight=1
set tabstop=4
set softtabstop=0
set shiftwidth=4
set scrolloff=15
set number 
set relativenumber 
set nowrap 
set cursorline 
set expandtab 
set smarttab
set nohlsearch

let g:project_local_config = '.config.vim'
let g:maximizer_set_default_mapping = 0
let g:EasyMotion_smartcase = 1

let g:root_patterns = [
  \ '.git',
  \ g:project_local_config
  \ ]

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

