let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
endif

execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()

endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

colorscheme molokai

" insert中の jj に Escを割り当てる
inoremap <silent> jj <ESC>

" enable moving right at visual
set virtualedit=block
" enable backspace in insert mode
set backspace=indent,eol,start

set ambiwidth=double

set wildmenu

set autoread
set autoindent

set iminsert=0

set fenc=utf-8

" search
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

"preview
set noerrorbells

set shellslash

set showmatch matchtime=1

set cinoptions+=:0

set cmdheight=2

set laststatus=2

set showcmd

set display=lastline

set listchars=tab:^\ ,trail:~

set history=10000

hi Comment ctermfg=3

set expandtab

set shiftwidth=2

set softtabstop=2

set tabstop=2
" delete toolbar
set guioptions-=T
" yank to clipboard
set guioptions+=a

set guioptions-=m

set showmatch

set smartindent

set noswapfile

set title
" show number
set number

set clipboard=unnamed,autoselect

nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

syntax on

set nrformats=

set whichwrap=b,s,h,l,<,>,[,],~

set mouse=a

set wildmode=list:longest

set formatoptions+=mM

set ruler

set showmode

set wrap


" Light line settings
let g:lightline = {
    \ 'active': {
    \   'left': [ ['mode','paste'],
    \             ['gitinfo','readonly','filename','modified']]
    \ },
    \ 'component_function': {
    \   'gitinfo': 'Fugitives'
    \ }
    \}

function! Fugitives()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
      let _ = fugitive#head()
      return strlen(_) ? 'git::'._ : ''
    endif
  catch
  endtry
  return ''
endfunction

