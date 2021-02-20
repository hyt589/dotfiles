if has('nvim')

  " Install vim-plug if not found
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif
else

  " Install vim-plug if not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif

  " Run PlugInstall if there are missing plugins
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
  \| endif

endif

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'szw/vim-maximizer'

Plug 'puremourning/vimspector'
Plug 'idanarye/vim-vebugger'

Plug 'michaeljsmith/vim-indent-object'

Plug 'preservim/nerdtree'

Plug 'francoiscabrol/ranger.vim'

if has('nvim')
  Plug 'rbgrouleff/bclose.vim'
endif

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'Shougo/vimfiler.vim'

Plug 'liuchengxu/vista.vim'
Plug 'preservim/tagbar'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kassio/neoterm'

Plug 'tpope/vim-commentary'

Plug 'jackguo380/vim-lsp-cxx-highlight'
" Plug 'sheerun/vim-polyglot'

Plug 'Shougo/unite.vim'

Plug 'sonph/onehalf', { 'rtp': 'vim' }

Plug 'airblade/vim-rooter'

Plug 'arakashic/chromatica.nvim'

Plug 'rakr/vim-one'

Plug 'joshdick/onedark.vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

Plug 'easymotion/vim-easymotion'

Plug 'godlygeek/tabular'

Plug 'tpope/vim-fugitive'

" Always load this plugin last
Plug 'ryanoasis/vim-devicons'

call plug#end()
