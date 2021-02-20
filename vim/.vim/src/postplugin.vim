let g:airline#extensions#tabline#enabled         = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:neoterm_default_mod                        = 'botright'
let g:neoterm_size                               = 15
let g:neoterm_autoinsert                         = 1
let g:airline_inactive_collapse                  = 0
let g:airline_focuslost_inactive                 = 1
let g:airline_theme                              = 'onehalfdark'
let g:chromatica#libclang_path                   = '/usr/lib/x86_64-linux-gnu/libclang-11.so.1'
let g:airline_powerline_fonts                    = 1
let g:vista_default_executive                    = 'coc'
let g:vista_sidebar_width                        = 60

set cmdheight=1

if has('nvim')
  set termguicolors
endif

colorscheme onehalfdark
highlight Comment gui=None

autocmd BufNewFile,BufRead *.c             call s:cpp_mode()
autocmd BufNewFile,BufRead *.cpp           call s:cpp_mode()
autocmd BufNewFile,BufRead *.h             call s:cpp_mode()
autocmd BufNewFile,BufRead *.hpp           call s:cpp_mode()
autocmd BufNewFile,BufRead *.vim           call s:viml_mode()
autocmd BufNewFile,BufRead *.vimrc         call s:viml_mode()
autocmd BufNewFile,BufRead *CMakeLists.txt call s:cmake_mode()
autocmd BufNewFile,BufRead *.cmake         call s:cmake_mode()
autocmd BufNewFile,BufRead *.json          call s:json_mode()
autocmd BufNewFile,BufRead *.md            call s:markdown_mode()

autocmd User RooterChDir           silent! call s:check_project_config()
autocmd User AirlineAfterInit      silent! let g:airline_section_a = "%#__accent_bold#%{winnr()} - " . g:airline_section_a
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd   silent! call s:after_easy_motion()

function s:after_easy_motion() abort
  execute 'silent! CocEnable'
  execute 'silent! noh'
endfunction

function s:markdown_mode() abort
  setlocal wrap sw=2
endfunction

function s:cpp_mode() abort
  setlocal sw=4
endfunction

function s:cmake_mode() abort
  setlocal sw=4
endfunction

function s:viml_mode() abort
  setlocal sw=2
endfunction

function s:json_mode() abort
  setlocal sw=2
  call JSON#formatCurrentBuffer()
endfunction

function s:go_to_buffer_nr(num) abort
  let l:possible_buffers = range(1, bufnr('$'))
  let l:listed_buffers   = filter(l:possible_buffers, 'buflisted(v:val)')
  let l:listed_buffers   = filter(l:listed_buffers, 'getbufvar(v:val, "&buftype") ==# ""')
  execute 'b' . l:listed_buffers[a:num-1]
endfunction

function s:clear_saved_buffer() abort
  let l:possible_buffers = range(1, bufnr('$'))
  let l:listed_buffers   = filter(l:possible_buffers, 'buflisted(v:val)')
  let l:listed_buffers   = filter(l:listed_buffers, 'getbufvar(v:val, "&buftype") !=# "terminal"')
  let l:saved_buffers    = filter(l:listed_buffers, 'getbufvar(v:val, "&mod") !=# "1"')
  let l:saved_buffers    = filter(l:saved_buffers, 'v:val != bufnr("%")')
  for l:buf in l:saved_buffers
    execute 'bdelete ' . l:buf
  endfor
endfunction

function s:check_project_config() abort
  call cmake#init()
  call ProjectConfigure()
endfunction

function ProjectConfigure() abort
  if filereadable(getcwd() . '/' . g:project_local_config)
    execute 'source ' . getcwd() . '/' . g:project_local_config
  endif
endfunction

nnoremap Q :q<cr>

nnoremap <c-j> jzz
nnoremap <c-k> kzz
nnoremap o zzo
nnoremap O zzO

nnoremap <silent><leader>1 :call <SID>go_to_buffer_nr(1)<cr>
nnoremap <silent><leader>2 :call <SID>go_to_buffer_nr(2)<cr>
nnoremap <silent><leader>3 :call <SID>go_to_buffer_nr(3)<cr>
nnoremap <silent><leader>4 :call <SID>go_to_buffer_nr(4)<cr>
nnoremap <silent><leader>5 :call <SID>go_to_buffer_nr(5)<cr>
nnoremap <silent><leader>6 :call <SID>go_to_buffer_nr(6)<cr>
nnoremap <silent><leader>7 :call <SID>go_to_buffer_nr(7)<cr>
nnoremap <silent><leader>8 :call <SID>go_to_buffer_nr(8)<cr>
nnoremap <silent><leader>9 :call <SID>go_to_buffer_nr(9)<cr>
nnoremap <silent><leader>bd :bdelete<cr>
nnoremap <silent><leader>bc :call <SID>clear_saved_buffer()<cr>

" nnoremap <silent><F2> :TagbarToggle<CR>
nnoremap <silent><F2> :Vista!!<CR>
" nnoremap <silent><F3> :NERDTreeToggle<CR>
nnoremap <silent><F3> :VimFilerExplorer<CR>

nnoremap <silent><leader>t :Ttoggle<CR>
tnoremap <esc> <c-\><c-n>

nnoremap <silent><space>1 :exe 1 . 'wincmd w'<cr>
nnoremap <silent><space>2 :exe 2 . 'wincmd w'<cr>
nnoremap <silent><space>3 :exe 3 . 'wincmd w'<cr>
nnoremap <silent><space>4 :exe 4 . 'wincmd w'<cr>
nnoremap <silent><space>5 :exe 5 . 'wincmd w'<cr>
nnoremap <silent><space>6 :exe 6 . 'wincmd w'<cr>
nnoremap <silent><space>7 :exe 7 . 'wincmd w'<cr>
nnoremap <silent><space>8 :exe 8 . 'wincmd w'<cr>
nnoremap <silent><space>9 :exe 9 . 'wincmd w'<cr>

nnoremap <space>w <c-w>

nnoremap <silent><space>r :exec 'source ' . g:vim_home . '/init.vim'<cr>

nmap <c-_> gcc
vmap <c-_> gc
nnoremap <silent><c-s> :wa<cr>

nnoremap <silent><leader>db  :call debug#ToggleBreakPoint()<cr>
nnoremap <silent><leader>dcb :call debug#ToggleConditionalBreakPoint()<cr>
nnoremap <silent><F4>        :call debug#Launch()<cr>
nnoremap <silent><F5>        :call debug#StepOver()<cr>
nnoremap <silent><F6>        :call debug#StepInto()<cr>
nnoremap <silent><F7>        :call debug#StepOut()<cr>
nnoremap <silent><F8>        :call debug#RunToCursor()<cr>
nnoremap <silent><F9>        :call debug#Continue()<cr>
nnoremap <silent><F10>       :call debug#Stop()<cr>

vnoremap > >gv
vnoremap < <gv

nnoremap <silent><leader>p :MarkdownPreview<cr>
nnoremap <silent><leader>P :MarkdownPreviewStop<cr>

" Easymotion
nmap <Leader><Leader>s <Plug>(easymotion-sn)
xmap <Leader><Leader>s <Plug>(easymotion-sn)
omap <Leader><Leader>z <Plug>(easymotion-sn)
nmap <Leader>s <Plug>(easymotion-s2)
xmap <Leader>s <Plug>(easymotion-s2)
omap <Leader>z <Plug>(easymotion-s2)
map <leader><leader> <Plug>(easymotion-prefix)

noremap <silent><space>m :MaximizerToggle<cr>

call JSON#init()
call debug#Init()

call s:check_project_config()
