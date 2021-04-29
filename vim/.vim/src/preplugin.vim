" runs before plug#begin

set encoding=UTF-8
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
set incsearch
set timeoutlen=500

language en_US.utf8

let g:project_local_config = '.config.vim'
let g:maximizer_set_default_mapping = 0
let g:EasyMotion_smartcase = 1

let g:rooter_patterns = [
  \ '!^third_party',
  \ '!^vendor',
  \ '!^submodule',
  \ '.git',
  \ 'compile_commands.json',
  \ '.ccls',
  \ '.vim',
  \ g:project_local_config
  \ ]

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

