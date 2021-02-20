let g:vim_home = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let &runtimepath .= ',' .g:vim_home 

exec 'source ' . g:vim_home . '/src/preplugin.vim'
exec 'source ' . g:vim_home . '/src/plugins.vim'
exec 'source ' . g:vim_home . '/src/coc_config.vim'
exec 'source ' . g:vim_home . '/src/postplugin.vim'
exec 'source ' . g:vim_home . '/src/syntax.vim'

if len(expand('%')) == 0
  if has('nvim')
    exec 'intro'
  endif
  call timer_start(200, {-> execute('Ranger')})
endif
